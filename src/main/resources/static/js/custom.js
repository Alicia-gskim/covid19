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
			// 로딩 태그 보여주기
			$(".box_wrap").append(LOADING_HTML);
		},
		success: function(res) {
			$('html, body').animate({scrollTop: $('.answer:last').offset().top}, 10);
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
			$('#loading').remove();
		}
	});
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
//	if(!refreshBool)	return false;
//	var query = _query ? _query : $('#sentence').val();
//
//	var blank_query = query;
//	blank_query = blank_query.replace(/^\s+|\s+$/g, "");
//	
//	if (blank_query != "") {
//		if (hidden_query) document.getElementById("hidden_query").value = hidden_query;
//		
//		if (eventBool) {
//			eventBool = false;
//			$("#sentence").on("keydown", function () {
//				clearInterval(timer);
//				timer = window.setTimeout(oneWayQuery, userWaitTime);
//			});
//		}
//		if (refreshBool) {
//			// refreshBool = false;
//			$("#sentence").on("keydown", function () {
//				clearInterval(timer_R);
//				timer_R = window.setTimeout(refreshQuery,userRefreshTime);
//			});
//		}
//		var ajaxSend = true;
//		var jsonData = undefined;
//
//		// input hidden_query text into hidden input tag
//		var hidden_query = $('#hidden_query').val().length > 0 ? $('#hidden_query').val() : query;
//		hidden_query = hidden_query.replace(/<(\/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(\/)?>/gi," ");	// html태그 없애기
//		
//		if (query.length > 0) {
//			if (ajaxSend) {
//				var param = "?query=" + encodeURIComponent(query) + "&sessionKey=" + sessionKey + "&projectId=" + projectId;
//				$.ajax({
//					type: "GET",
//					url: API_URL + "/iChatResponse" + param,
//					cache: false,
//					dataType: 'json',
//					processData: false,
//					contentType: "application/json",
//					beforeSend: function beforeSend() {
//						//질문 박스
//						var tempStr = "";
//						tempStr += QUESTION_TOP_HTML;
//						tempStr += decodeURIComponent(hidden_query);
//						tempStr += QUESTION_BOTTOM_HTML;
//						tempStr += LOADING_HTML;
//
//						$(".search_boxs").append(tempStr);
//						$(".time:last").text(getHour());
//						$('#search_boxs').scrollTop(500);
//						$("#sentence").val("");
//						$('#hidden_query').val("");
//					},
//					success: ajaxAnswerSuccess,
//					error: ajaxAnswerError
//				});
//			}
//		}
//	}
	
	console.log($('#sentence').val());
	
	var param = {
			"query": $('#sentence').val(),
			"page": 'main'
	};
	$.ajax({
		type: 'POST',
		url: 'tmp/request',
		contentType: 'application/json',
		dataType: 'json',
		data: JSON.stringify(param),
		beforeSend: function beforeSend() {
//			html = '<div class="questioner"><p class="questioner__text">';
//			html += $('#sentence').val() + '</p><p class="questioner__time">'
//			html += getHour() + '</p>';
//			
//			$('.box_wrap').append(html);
			
			//질문 박스
			$(".box_wrap").append(LOADING_HTML);
		},
		success: function(res) {
			$('html, body').animate({scrollTop: $('.answer:last').offset().top}, 10);
//			$('.box_wrap').append(res);
			alert("<<응답받은 결과값>> 1. query : " + res.query + ", 2. url : " + res.url + ", 3. page name : " + res.pgname);
			
			if( res.isBool ) {
				answerClick(res.url, res.pgname);
			}
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