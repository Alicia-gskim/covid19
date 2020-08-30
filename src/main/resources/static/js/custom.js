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
					// Step #2. 카테고리 데이터 가져오기
					function (callback) {
						greet = true;
//						getCategoryData("0", callback);
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

function answerClick(url, arg) {
	var txt = "";
	switch(arg) {
		case "region":				txt = "지역별 확진자현황";			break;
		case "government":			txt = "보도자료 정부브리핑";			break;
		case "issue":				txt = "코코로나19 팩트 & 이슈체크";	break;
		case "target":				txt = "대상별 맞춤정보";				break;
		case "clinic":				txt = "선별진료소 정보확인";			break;
		case "foreignChk":			txt = "국외현황 정보확인";			break;
		case "personalized":		txt = "일반인 맞춤정보";				break;
		case "quarantine":			txt = "자가격리자 맞춤정보";			break;
		case "overseasVisitors":	txt = "해외방문자 맞춤정보";			break;
		case "medical":				txt = "의료인 맞춤정보";				break;
		case "groupFacility":		txt = "집단시설 맞춤정보";			break;
		case "suspected":			txt = "의심증상 확인하기";			break;
		
		case "seoul":				txt = "서울특별시";				break;
		case "busan":				txt = "부산광역시";				break;
		case "daegu":				txt = "대구광역시";				break;
		case "incheon":				txt = "인천광역시";				break;
		case "gwangju":				txt = "광주광역시";				break;
		case "daejeon":				txt = "대전광역시";				break;
		case "ulsan":				txt = "울산광역시";				break;
		case "sejong":				txt = "세종시";					break;
		case "gangwondo":			txt = "강원도";					break;
		case "north-chungcheong":	txt = "충청북도";					break;
		case "south-chungcheong":	txt = "충청남도";					break;
		case "north-jeolla":		txt = "전라북도";					break;
		case "south-jeolla":		txt = "전라남도";					break;
		case "north-gyeongsang":	txt = "경상북도";					break;
		case "south-gyeongsang":	txt = "경상남도";					break;
		case "jeju":				txt = "제주도";					break;
		
		default : txt = "코로나 알림이";								break;
	}
	
	console.log("지역선택 : ", txt);
	html = '<div class="questioner"><p class="questioner__text">';
	html += txt + '</p><p class="questioner__time">'
	html += getHour() + '</p>';
	
	$('.box_wrap').append(html);
	
	$.ajax({
		url: url,
		beforeSend: function beforeSend() {
			//질문 박스
			$(".box_wrap").append(LOADING_HTML);
		},
		success: function(res) {
			$('.box_wrap').append(res);
		},
		error: function(e) {
			console.log("e : ", e);
		},
		complete: function() {
			$(".answer__time:last").text(getHour());
			$('#loading').remove();
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

function doQuestion(_query, hidden_query) {
	if(!refreshBool)	return false;
	var query = _query ? _query : $('#sentence').val();

	var blank_query = query;
	blank_query = blank_query.replace(/^\s+|\s+$/g, "");
	
	if (blank_query != "") {
		if (hidden_query) document.getElementById("hidden_query").value = hidden_query;
		
		if (eventBool) {
			eventBool = false;
			$("#sentence").on("keydown", function () {
				clearInterval(timer);
				timer = window.setTimeout(oneWayQuery, userWaitTime);
			});
		}
		if (refreshBool) {
			// refreshBool = false;
			$("#sentence").on("keydown", function () {
				clearInterval(timer_R);
				timer_R = window.setTimeout(refreshQuery,userRefreshTime);
			});
		}
		var ajaxSend = true;
		var jsonData = undefined;

		// input hidden_query text into hidden input tag
		var hidden_query = $('#hidden_query').val().length > 0 ? $('#hidden_query').val() : query;
		hidden_query = hidden_query.replace(/<(\/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(\/)?>/gi," ");	// html태그 없애기
		
		if (query.length > 0) {
			if (ajaxSend) {
				var param = "?query=" + encodeURIComponent(query) + "&sessionKey=" + sessionKey + "&projectId=" + projectId;
				$.ajax({
					type: "GET",
					url: API_URL + "/iChatResponse" + param,
					cache: false,
					dataType: 'json',
					processData: false,
					contentType: "application/json",
					beforeSend: function beforeSend() {
						//질문 박스
						var tempStr = "";
						tempStr += QUESTION_TOP_HTML;
						tempStr += decodeURIComponent(hidden_query);
						tempStr += QUESTION_BOTTOM_HTML;
						tempStr += LOADING_HTML;

						$(".search_boxs").append(tempStr);
						$(".time:last").text(getHour());
						$('#search_boxs').scrollTop(500);
						$("#sentence").val("");
						$('#hidden_query').val("");
					},
					success: ajaxAnswerSuccess,
					error: ajaxAnswerError
				});
			}
		}
	}
}

function ajaxAnswerSuccess(jsonData) {
	if (JSON.stringify(jsonData) == "{}") {
		callback('iChatResponseIsNone');
	} else {
		//답변박스
		var data = jsonData.answer;
			
		if(data.indexOf('"hidden_query"') !=-1){
		} else {
			$("#sentence").attr("readonly",false);
		}
		
		if (data != undefined) {
			try {
				var jAnswer = JSON.parse(data);
				
//				doAnswer(wrapTemplate(jAnswer), jAnswer);
			} catch (e) {
				 console.log(e);
				 doAnswer(data);
			}
		} else {
			doAnswer(ERROR_MESSAGE);
			console.log("ajaxAnswerError error : data is undefined");
		}
	}
}
function ajaxAnswerError(request, status, error) {
	doAnswer(ERROR_MESSAGE);
	callback(null);
}

function doAnswer(a, b) {
	/* a를 객체로 만들고
	 * a에 메세지에 스트링 값을 넣고
	 * 바텀 스와이퍼는 따로 조건문 추가하여 붙일 수 있도록
	 */
	
	$('#loading').remove();
	if (a.bottomAnswer) {
		if (a.resultAnswer === '') a.resultAnswer = DEFAULT_BOTTOM_ANSWER;
		$(".demoview").append(a.bottomAnswer);
	}
	
	var tempStr = ANSWER_TOP_HTML;
	tempStr += a.resultAnswer ? a.resultAnswer : a;
	tempStr += ANSWER_BOTTOM_HTML;

	$(".search_boxs").append(tempStr);
	var tmp = {};
	if(b.cards != undefined){
		tmp.cards = b.cards;
		activateSwiper(tmp);
	}
	if(b.buttons.button != undefined) {
		if(b.buttons.button.length == undefined) {
			if(b.buttons.button.type === 'swipe' || b.buttons.button.type == 'swipe_bottom' || b.buttons.button.type == 'swipe_lines') {	
				tmp.buttons.button = b.buttons.button;
				activateSwiper(tmp);
			}
		} else {
			for(var i=0;i<b.buttons.button.length;i++) {
				if(b.buttons.button[i].type === 'swipe' || b.buttons.button[i].type == 'swipe_bottom' || b.buttons.button.type == 'swipe_lines') {
					tmp.buttons.button = b.buttons.button[i];
					activateSwiper(tmp);
				}
			}
		}
	}
	
	var wid;
	var max = 0;
	$('div[name="cardSize'+cardCount+'"]').each(function (i, v) {
		wid = $(this).height();
	    if(max < wid){
	    	max = wid;
	    }
	});
	$('div[name="cardSize'+cardCount+'"]').each(function (i, v) {
		$(this).css('height', max);			
	});
	cardCount++;

	$(".time:last").text(getHour());
	var all = $(".search_boxs").prop('scrollHeight'); //전체 사이즈
	var lastH = $(".answer_box:last").prop('offsetHeight'); // 마지막 말풍선 사이즈
	var minus = 0;
	if(lastH > 481) {
		minus = all - lastH;
		$(".search_boxs").scrollTop(minus - 150);
	} else {
		$(".search_boxs").scrollTop($('.search_boxs')[0].scrollHeight);
	}
	$('#sentence').keydown();

	$('div[name=greeting'+buttonHeightCnt+']')
	.mouseover(function (e) {
		var img = $(this).find('img').attr("src");
		img = img.replace(".png", "-1.png");
		$(this).find('img').attr("src", img);
	})
	.mouseout(function (e) {
		var img = $(this).find('img').attr("src");
		img = img.replace("-1.png",".png");
		$(this).find('img').attr("src", img);
	});
	buttonHeightCnt++;
}