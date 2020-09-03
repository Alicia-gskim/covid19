var API_URL = "https://answerny.ai:7480/api";
var IMGSRV_URL = "https://answerny.ai/img";
var sessionKey = "";
var categoryData = "";

// oneway greet, push message variables
var projectId = "0a90b0500918";
var subProject = '';
var greetQuery;
var pushQuery;
var greet;
//화면 요소 Data
var ERROR_MESSAGE = "죄송합니다. 문의하신 내용을 찾는데 문제가 발생했습니다.<br>잠시 후 다시 질문부탁드립니다.";
var DEFAULT_BOTTOM_ANSWER = "아래에 버튼을 선택해주세요.";
var QUESTION_TOP_HTML = ["<div class='box_wrap'>", "<ul class='question_box'>", "<li class='question'>"].join('');
var QUESTION_BOTTOM_HTML = ["</li>", "<li class='time'></li>", "</ul>", "</div>"].join('');
var ANSWER_TOP_HTML = ["<div class='box_wrap'>", "<ul class='answer_box'>", "<li class='name'><img src='" + IMGSRV_URL + "/gui1.png' alt='' onclick='javascript:oneWayQuery(1)'/></li>","<li class='subname'>코로나19 챗봇<sup style=\"color:#F37058;font-size:10px\">BETA</sup> </li>","<li class='answer'>"].join('');
var ANSWER_BOTTOM_HTML = ["</li>", "<li class='time'></li>", "</ul>", "</div>"].join('');
var LOADING_HTML = ["<ul id='loading' class='answer_box'>", "<li class='name'><img src='" + IMGSRV_URL + "/gui1.png' alt=''/></li>", "<li class='answer'>", "<div class='three-balls'>", "<div class='ball ball1'></div>", "<div class='ball ball2'></div>", "<div class='ball ball3'></div>", "</div>", "</li>", "</ul>"].join('');
var REFRESH_MESSAGE = '{  "message": "오랫동안 대화가 없어 챗봇이 쉬고 있어요😴<br>챗봇과 대화를 다시 시작하시려면 새로고침 후 사용해주세요🙂",  "buttons": {  "type": "refresh",  "button": [  {  "buttonname": "새로고침"  }  ]  }}';

var GET_HEADER_URL = "/info/trend/korea";
var GET_REGIN_DATA_URL = "/info/trend/cites";

// 사용자 대기 이벤트
var userWaitTime = 60 * 1000;
var userRefreshTime = 3600 * 1000;
var eventBool = false;
var refreshBool = true;
var timer;
var timer_R;
var cardCount = 0;
var buttonHeightCnt = 0;

$(function() {
	$(document).ready(function() {
		
		
		
//		postCallAjax(API_URL + "/sessionRequest")
		async.waterfall(
				[
					// Step #1. 세션키 가져오기
					function (callback) {
						getSeesionKey(callback);
					},
					// Step #2. 헤더영역 데이터 가져오기
					function (callback) {
						$.ajax( {
							type: 'POST',
							url: GET_HEADER_URL,
							cache: false,
							dataType: 'json',
							contentType: 'application/json',
							success: function(res) {
								if(res.message == 'success') {
									callback('ServiceKeyIsNone');
								} else {
									console.log(res.json);
									var jsonData = res.json;
									// 1. 국내 확진자 전체 누석수
									$('#notice_total').text(jsonData.TotalCase);
									// 2. 어제 대비 오늘 추가 확진자 수
									$('#notice_increase').text('(+' + (Number(jsonData.TodayRecovered) + Number(jsonData.TodayDeath) + Number(jsonData.TotalCaseBefore)) + ')');
									// 3. 발생현황 카운트 기준일
									$('#notice_time').text(jsonData.updateTime);
									
									// 4. 누적 치료중인 사람수
									$('#NowCase span:first-child').text(jsonData.NowCase);
									$('#NowCase span:last-child').text('('+ calculationPercentage(jsonData.NowCase, jsonData.TotalCase) +'%)');
									$('#NCplus').text('+' + jsonData.TotalCaseBefore);
									
									// 5. 누적 자가격리 해제된 사람 수
									$('#TotalRecovered span:first-child').text(jsonData.TotalRecovered);
									$('#TotalRecovered span:last-child').text('('+ calculationPercentage(jsonData.TotalRecovered, jsonData.TotalCase) +'%)');
									$('#TRplus').text('+' + jsonData.TodayRecovered);
									
									// 6. 누적 사망자 수
									$('#TotalDeath span:first-child').text(jsonData.TotalDeath);
									$('#TotalDeath span:last-child').text('('+ calculationPercentage(jsonData.TotalDeath, jsonData.TotalCase) +'%)');
									$('#TDplus').text('+' + jsonData.TodayDeath);
									
									// 7. 검사결과를 기다리는 사람수
									$('#checkingCounter').text(jsonData.checkingCounter);
									
									// 정상 : 후처리 동작 없음
									callback(null);
								}
							},
							error: function(e) {
								callback(e);
							}
						})
					},
					// Setp #3. 초기 메인 답변
					function (callback) {
						$.ajax({
							url: '/mainAnswer',
							beforeSend: function beforeSend() {
								// 로딩 태그 보여주기
//								$(".box_wrap").append(LOADING_HTML);
							},
							success: function(res) {
								$('.box_wrap').append(res);
								
								if( res.match('.info') != null ) {
									new Swiper('.info');
								}
								
								callback(null);
							},
							error: function(e) {
								console.log("e : ", e);
								callback(e);
							},
							complete: function() {
								$(".answer__time:last").text(getHour());
							}
						})
					},
					function(callback) {
						$('html, body').animate({scrollTop: $('.answer:last').offset().top}, 10);
						
						callback(null);
					}
				],
				function (err) {
					if (err) {
						console.log(err);
					} else {
						// 기본 메시지의 시간을 현재 시간으로 변경
						$(".time:last").text(getHour());
						// 질문창 포커스
						$("#sentence").focus();
					}
				}
			);
	});
	
	function getSeesionKey(callback) {
		if (sessionKey == "") {
			$.ajax({
				type: 'POST',
				url: API_URL + "/sessionRequest",
				cache: false,
				dataType: 'json',
				processData: false,
				contentType: "application/json",
				success: function success(jsonData) {
					if (JSON.stringify(jsonData) == "{}") {
						callback('SessionKeyIsNone');
					} else {
						sessionKey = jsonData.sessionKey;
						callback(null);
					}
				},
				error: function error(request, status, _error2) {
					callback(_error2);
				}
			});
		} else {
			callback(null);
		}
	}
});

function setMessage(query, type) {
	var txt = "";
	if( type == 'click' && (query == undefined || query == '') ) {
		// 버튼클릭 or 최초실행시 실행
		switch(arg) {
			case "region":				txt = "지역별 확진자현황";			break;
			case "government":			txt = "보도자료 정부브리핑";			break;
			case "issue":				txt = "코코로나19 팩트 & 이슈체크";	break;
			case "target":				txt = "대상별 맞춤정보";				break;
			case "personalized":		txt = "일반인 맞춤정보";				break;
			case "quarantine":			txt = "자가격리자 맞춤정보";			break;
			case "overseasVisitors":	txt = "해외방문자 맞춤정보";			break;
			case "medical":				txt = "의료인 맞춤정보";				break;
			case "groupFacility":		txt = "집단시설 맞춤정보";			break;
			case "clinic":				txt = "선별진료소 정보확인";			break;
			case "suspected":			txt = "의심증상 확인하기";			break;
			case "foreignChk":			txt = "국외현황 정보확인";			break;
			
			case "seoul":				txt = "서울특별시";				break;
			case "busan":				txt = "부산광역시";				break;
			case "daegu":				txt = "대구광역시";				break;
			case "incheon":				txt = "인천광역시";				break;
			case "gwangju":				txt = "광주광역시";				break;
			case "daejeon":				txt = "대전광역시";				break;
			case "ulsan":				txt = "울산광역시";				break;
			case "sejong":				txt = "세종시";					break;
			case "gyeonggi":			txt = "경기도";					break;
			case "gangwon":				txt = "강원도";					break;
			case "chungbuk":			txt = "충청북도";					break;
			case "chungnam":			txt = "충청남도";					break;
			case "jeonbuk":				txt = "전라북도";					break;
			case "jeonnam":				txt = "전라남도";					break;
			case "gyeongbuk":			txt = "경상북도";					break;
			case "gyeongnam":			txt = "경상남도";					break;
			case "jeju":				txt = "제주도";					break;
			case "korea":				txt = "전체보기";					break;
			
			default : txt = "코로나 알림이";								break;
		}
	} else {
		// 메세지 보내기 했을 경우 실행
		txt = query;
	}
	
	console.log("지역선택 : ", txt);
	html = '<div class="questioner"><p class="questioner__text">';
	html += txt + '</p><p class="questioner__time">'
	html += getHour() + '</p>';
	
	$('.box_wrap').append(html);
}

// 상세 지역별 결과 값 표시
function getCitiesInfo(mappingView, city, type) {
	var cityData = {};
	async.waterfall(
			[
				function (callback) {
					// Step #1. 선택한 도시의 데이터 조회
					$.ajax({
						type: 'POST',
						dataType: 'json',
						contentType: 'application/json',
						cache: false,
						url: GET_REGIN_DATA_URL,
						success: function(res) {
							console.log('all city : ', res);
							console.log(city +' : '+ res.json[city]);
							
							cityData = res.json[city];
							callback(null);
						},
						error: function(e) {
							console.log("e : ", e);
							callback(e);
						}
					})
				},
				function(callback) {
					if( type == 'click' ){
						console.log("지역선택 : ", cityData.countryName);
						setMessage('', cityData.countryName);
					}
					callback(null);
				},
				function(callback) {
					// Step #2. 조회한 도시의 데이터를 바인딩할 화면 표시
					$.ajax({
						url: '/region-city',
						beforeSend: function beforeSend() {
							// 로딩 태그 보여주기
//							$(".box_wrap").append(LOADING_HTML);
						},
						success: function(res) {
							$('.box_wrap').append(res);
							
							if( res.match('.info') != null ) {
								new Swiper('.info');
							}
							callback(null);
						},
						error: function(e) {
							console.log("e : ", e);
							callback(e);
						},
						complete: function() {
							$(".answer__time:last").text(getHour());
						}
					});
				},
				function(callback) {
					// Step #3. 표시된 화면에 조회한 데이터 바인딩
					console.log("Async가 잘 되나? : ", cityData);
					$('.answer:last').find('#city__name').text(cityData.countryName);
					$('.answer:last').find('#city__totalCase').children('span').text(cityData.totalCase);
					$('.answer:last').find('#city__case').children('span').text('('+ cityData.newCcase +'/'+ cityData.newFcase +')');
					$('.answer:last').find('#city__case').children('span').prepend('<b>'+ cityData.newCase +'</b>');
					$('.answer:last').find('#city__recovered').children('span').text(cityData.recovered);
					$('.answer:last').find('#city__death').children('span').text(cityData.death);
					$('.answer:last').find('#city__percentage').children('span').text(cityData.percentage);
					
					const link = setLink(city);
					$('.answer:last').find('#city__link').children('a').attr('href', link);
					$('.answer:last').find('#city__link span').text(cityData.countryName);
					
					callback(null);
				},
				function(callback) {
					$('html, body').animate({scrollTop: $('.answer:last').offset().top}, 10);
					callback(null);
				}
			],
			function (err) {
				if (err) {
					console.log(err);
				} else {
					// 기본 메시지의 시간을 현재 시간으로 변경
					$(".time:last").text(getHour());
					// 질문창 포커스
					$("#sentence").focus();
				}
			}
		);
}

function answerClick(url, arg, query, type) {
	if( type == 'click' ) {		
		setMessage(query, type);
	}
	
	$.ajax({
		url: url,
		beforeSend: function beforeSend() {
			// 로딩 태그 보여주기
//			$(".box_wrap").append(LOADING_HTML);
		},
		success: function(res) {
			$('.box_wrap').append(res);
			
			if( res.match('.info') != null ) {
				new Swiper('.info');
			}
		},
		error: function(e) {
			console.log("e : ", e);
		},
		complete: function() {
			$(".answer__time:last").text(getHour());
			
			$('html, body').animate({scrollTop: $('.answer:last').offset().top}, 10);
		}
	})
}
function getHour() {
	return convert12H(checkTime(new Date().getHours()) + ':' + checkTime(new Date().getMinutes()));
}
function convert12H(a) {

	var time = a; // 'hh:mm' 형태로 값이 들어온다
	var getTime = time.substring(0, 2); // 시간(hh)부분만 저장
	var intTime = parseInt(getTime); // int형으로 변환

	if (intTime < 12) {
		// intTime이 12보다 작으면
		var str = '오전 '; // '오전' 출력
	} else {
		// 12보다 크면
		var str = '오후 '; // '오후 출력'
	}

	if (intTime == 12) {
		// intTime이 12면 변환 후 그대로 12
		var cvHour = intTime;
	} else {
		// 나머지경우엔 intTime을 12로 나눈 나머지값이 변환 후 시간이 된다
		var cvHour = intTime % 12;
	}

	// 'hh:mm'형태로 만들기
	var res = str + ('0' + cvHour).slice(-2) + time.slice(-3);
	return res;
}
function checkTime(i) {
	if (i < 10) {
		i = "0" + i;
	}
	return i;
}

// 메세지 전송 함수
function doQuestion() {
	var query = $('#sentence').val();
	
	// 입력 메세지 표시
	setMessage(query, 'input');
	
	var param = {
			"query": query
	};
	// 입력값에 대한 결과
	$.ajax({
		type: 'POST',
		url: '/info/dialogflow',
		contentType: 'application/json',
		dataType: 'json',
		data: JSON.stringify(param),
		success: function(res) {
//			alert("<<응답받은 결과값>> 1. query : " + res.query + ", 2. url : " + res.url + ", 3. page name : " + res.pgname);
			
			if(res.msg == 'success') {
				if(res.isBool) {
					// 상세 지역별 현황
					getCitiesInfo(res.url, res.pgname);
				} else {
					// 그 외
					answerClick(res.url, res.pgname, query, 'input');				
				}
			} else {
				console.log("입력 메세지 : ", query);
				
				setNoMatchInfo();
			}
		},
		error: function(e) {
			console.log("e : ", e);
		},
		complete: function() {
			$('#sentence').val('');
			
			$(".answer__time:last").text(getHour());
			
			$('html, body').animate({scrollTop: $('.answer:last').offset().top}, 10);
			
		}
	})
}

function removeComma(str) {
	var n = parseInt(str.replace(/,/g,""));

	return Number(n);
}

function calculationPercentage(a, b) {
	return (parseFloat(removeComma(a)/removeComma(b)) * 100).toFixed(1);
}

function setNoMatchInfo() {
	$.ajax({
		url: '/nomatch',
		success: function(res) {
			$('.box_wrap').append(res);
		},
		error: function(e) {
			console.log(e);
		},
		complete: function() {
			$(".answer__time:last").text(getHour());
		}
	})
}

function setLink(city) {
	var link = '';
	
	switch(city) {
		case "busan" :
			link = "http://www.busan.go.kr/corona/index.jsp";
			break;
		case "chungbuk" :
			link = "http://www.chungbuk.go.kr/www/index.do";		
			break;
		case "chungnam" :
			link = "http://www.chungnam.go.kr/";
			break;
		case "daegu" :
			link = "http://www.daegu.go.kr/intro.jsp";
			break;
		case "daejeon" :
			link = "https://www.daejeon.go.kr/corona19/index.do";
			break;
		case "gangwon" :
			link = "http://www.provin.gangwon.kr/covid-19.html";
			break;
		case "gwangju" :
			link = "https://www.gwangju.go.kr/";
			break;
		case "gyeongbuk" :
			link = "http://www.gb.go.kr/Main/index.html";
			break;
		case "gyeonggi" :
			link = "https://www.gg.go.kr/contents/contents.do?ciIdx=1150&menuId=2909";
			break;
		case "gyeongnam" :
			link = "http://xn--19-q81ii1knc140d892b.kr/main/main.do";
			break;
		case "incheon" :
			link = "https://www.incheon.go.kr/health/index";
			break;
		case "jeju" :
			link = "https://www.jeju.go.kr/corona19.jsp";
			break;
		case "jeonbuk" :
			link = "http://www.jeonbuk.go.kr/";
			break;
		case "jeonnam" :
			link = "https://www.jeonnam.go.kr/";
			break;
		case "sejong" :
			link = "https://www.sejong.go.kr/bbs/R3273/list.do;jsessionid=KwNXp1uVMRJV3XiPEwGBVLQgnhUCLZTxNX1qCgoBaWyWEa77V2WEvD51b1aNfDXa.Portal_WAS2_servlet_engine5?cmsNoStr=17465";
			break;
		case "ulsan" :
			link = "http://www.ulsan.go.kr/corona.jsp";
			break;
		case "seoul" :
			link = "https://www.seoul.go.kr/coronaV/coronaStatus.do";
			break;
		default:
			link = "http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=13&ncvContSeq=&contSeq=&board_id=&gubun=')";
			break;
	}
	
	return link;
}