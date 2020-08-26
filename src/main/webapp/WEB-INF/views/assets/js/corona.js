"use strict";

(function (window) {
	
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
	var LOADING_HTML = ["<div class='box_wrap' id='loading'>", "<ul class='answer_box'>", "<li class='name'><img src='" + IMGSRV_URL + "/gui1.png' alt=''/></li>", "<li class='answer'>", "<div class='three-balls'>", "<div class='ball ball1'></div>", "<div class='ball ball2'></div>", "<div class='ball ball3'></div>", "</div>", "</li>", "</ul>", "</div>"].join('');
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
	var oneWayQuery = function oneWayQuery(greet) {
		var query = greet ? greetQuery : pushQuery;
		$('#sentence').off('keydown');
		var param = "?query=" + encodeURIComponent(query) + "&sessionKey=" + sessionKey + "&projectId=" + projectId;

		$.ajax({
			type: "GET",
			url: API_URL + "/iChatResponse" + param,
			cache: false,
			dataType: 'json',
			processData: false,
			contentType: "application/json; charset=utf-8",
			beforeSend: function beforeSend() {
				//질문 박스
				$(".search_boxs").append(LOADING_HTML);
				$(".time:last").text(getHour());
				$(".search_boxs").scrollTop($('.search_boxs')[0].scrollHeight);
			},
			success: ajaxAnswerSuccess,
			error: function error(request, status, _error) {
				doAnswer(ERROR_MESSAGE);
				console.log("oneWayQuery() error : " + _error);
			}
		});
	};

	var refreshQuery = function refreshQuery(){
		$("#sentence").attr("readonly",true);
		if(refreshBool){
			var finish = REFRESH_MESSAGE;
			var finishAnswer = JSON.parse(finish);
			var a = wrapTemplate(finishAnswer);
			$('#loading').remove();
			var tempStr = ANSWER_TOP_HTML;
			tempStr += a.resultAnswer ? a.resultAnswer : a;
			tempStr += ANSWER_BOTTOM_HTML;
			$(".search_boxs").append(tempStr);
			$(".time:last").text(getHour());
			$(".search_boxs").scrollTop($('.search_boxs')[0].scrollHeight);
			$('#search_boxs').scrollTop(500);
			$('#sentence').keydown();
		}
		refreshBool = false;
	}
	$(document).ready(function() {
		
		if (subProject !== undefined) {
			greetQuery = projectId + '_' + subProject + 'g';
			pushQuery = projectId + '_' + subProject + 'p';
		} else {
			greetQuery = 'hi';
		}

		async.waterfall([
		// Step #1. 세션키 가져오기
		function (callback) {
			getSeesionKey(callback);
		},
		// Step #2. 카테고리 데이터 가져오기
		function (callback) {
			getCategoryData("0", callback);
		}, function (callback) {
			greet = true;
			oneWayQuery(greet);
			
		}], function (err) {
			if (err) {
				console.log(err);
			} else {
				// 기본 메시지의 시간을 현재 시간으로 변경
				$(".time:last").text(getHour());
				// 질문창 포커스
				$("#sentence").focus();
			}
		} );
		
		
	});

	/*
	 * get time method
	 */
	function getHour() {
		return convert12H(checkTime(new Date().getHours()) + ':' + checkTime(new Date().getMinutes()));
	}

	function getSeesionKey(callback) {
		if (sessionKey == "") {
			$.ajax({
				type: 'POST',
				url: API_URL + "/sessionRequest",
				cache: false,
				dataType: 'json',
				processData: false,
				contentType: "application/json; charset=utf-8",
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

	function getCategoryData(upperId, callback) {
		if (categoryData == "") {
			$.ajax({
				type: 'GET',
				url: API_URL + "/categoryList?projectId=" + projectId,
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				success: function success(jsonData) {
					if (jsonData.status != "ok") {
						callback('CategoryDataIsNone');
					} else {
						categoryData = jsonData.categories;
						// qna = parseCategoryData(upperId);

						callback(null);
					}
				},
				error: function error(request, status, _error3) {
					callback(_error3);
				}
			});
		} else {
			// qna = parseCategoryData(upperId, callback);

			callback(null);
		}
	}

	function parseCategoryData(upperId) {
		var data = [];

		if (upperId == "0") {
			for (var i = 0; i < categoryData.length; i++) {
				var temp = {
					id: categoryData[i].id,
					upperId: upperId,
					question: categoryData[i].name,
					order: categoryData[i].id,
					level: "1",
					hasChild: "true",
					fullname: categoryData[i].fullname
				};

				data.push(temp);
			}
		} else {
			for (var i = 0; i < categoryData.length; i++) {
				if (categoryData[i].id == upperId) {
					var childrenData = categoryData[i].children;

					for (var j = 0; j < childrenData.length; j++) {
						var temp = {
							id: childrenData[i].id,
							upperId: upperId,
							question: childrenData[i].name,
							order: childrenData[i].id,
							level: "2",
							hasChild: "true",
							fullname: childrenData[i].fullname
						};

						data.push(temp);
					}
					break;
				}
			}
		}

		return data;
	}

	/*
	 * 질문 함수
	 */
	function doQuestion(_query, hidden_query) {
		if(!refreshBool)	return false;
		// document.getElementById("sentence").value = q;
		var query = _query ? _query : $('#sentence').val();

		var blank_query = query;
		blank_query = blank_query.replace(/^\s+|\s+$/g, "");
		
		if (blank_query != "") {
			if (hidden_query) document.getElementById("hidden_query").value = hidden_query;
			// document.getElementById("question_frm").submit();
			
			// clear bottom button element
			clearBottomButton();
			
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
						//data: param,
						dataType: 'json',
						processData: false,
						contentType: "application/json; charset=utf-8",
						beforeSend: function beforeSend() {
							//질문 박스
							var tempStr = "";
							tempStr += QUESTION_TOP_HTML;
							tempStr += decodeURIComponent(hidden_query);
							tempStr += QUESTION_BOTTOM_HTML;
							tempStr += LOADING_HTML;

							$(".search_boxs").append(tempStr);
							$(".time:last").text(getHour());
							$(".search_boxs").scrollTop($('.search_boxs')[0].scrollHeight);
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

	/*
  * 답변 박스 생성 함수
  * @a 템플릿 wrapping한 string html data
  * @b 템플릿 wrapping 전 json
  */
	function doAnswer(a, b) {
		/* a를 객체로 만들고
		 * a에 메세지에 스트링 값을 넣고
		 * 바텀 스와이퍼는 따로 조건문 추가하여 붙일 수 있도록
		 */
		
		$('#loading').remove();
		//$('#loading').delay(3000).fadeOut(0);
		if (a.bottomAnswer) {
			if (a.resultAnswer === '') a.resultAnswer = DEFAULT_BOTTOM_ANSWER;
			$(".demoview").append(a.bottomAnswer);
		}
		
		var tempStr = ANSWER_TOP_HTML;
		tempStr += a.resultAnswer ? a.resultAnswer : a;
		tempStr += ANSWER_BOTTOM_HTML;

		$(".search_boxs").append(tempStr);
//		if (b && hasSwipe(b)) {
//			activateSwiper(b);
//		}
		var tmp = {};
		if(b.cards != undefined){
			tmp.cards = b.cards;
			activateSwiper(tmp);
		}
		if(b.buttons != undefined){
			if(b.buttons.length == undefined){
				if(b.buttons.type === 'swipe' || b.buttons.type == 'swipe_bottom' || b.buttons.type == 'swipe_lines'){	
					tmp.buttons = b.buttons;
					activateSwiper(tmp);
				}
			}
			else{
				for(var i=0;i<b.buttons.length;i++){
					if(b.buttons[i].type === 'swipe' || b.buttons[i].type == 'swipe_bottom' || b.buttons.type == 'swipe_lines'){
						tmp.buttons = b.buttons[i];
						activateSwiper(tmp);
					}	
				}
			}
		}
		
		var wid;
		var max = 0;
		$('div[name="cardSize'+cardCount+'"]').each(function (i, v) {
			wid = $(this).height();
			//console.log(i + 1 + "번째 카드: " + wid);
		    if(max < wid){
		    	max = wid;
		    }
		});
		//console.log("max : " + max);
		$('div[name="cardSize'+cardCount+'"]').each(function (i, v) {
			$(this).css('height', max);			
		});
		cardCount++;

		$(".time:last").text(getHour());
		var all = $(".search_boxs").prop('scrollHeight'); //전체 사이즈
		var lastH = $(".answer_box:last").prop('offsetHeight'); // 마지막 말풍선 사이즈
		var minus = 0;
		if(lastH > 481){
			minus = all - lastH;
			$(".search_boxs").scrollTop(minus - 150);
		}else{
			$(".search_boxs").scrollTop($('.search_boxs')[0].scrollHeight);
		}
		$('#sentence').keydown();

		$('div[name=greeting'+buttonHeightCnt+']').mouseover(function (e) {
			var img = $(this).find('img').attr("src");
			img = img.replace(".png", "-1.png");
			$(this).find('img').attr("src", img);
 		}).mouseout(function (e) {
			var img = $(this).find('img').attr("src");
			img = img.replace("-1.png",".png");
 			$(this).find('img').attr("src", img);
 		});
		buttonHeightCnt++;
	}

	/*
  * 12시간 표시 변환 함수
  */
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

	/*
  * 시간 포맷 변환 함수
  */
	function checkTime(i) {
		if (i < 10) {
			i = "0" + i;
		}
		return i;
	}

	Array.prototype.contains = function (elem) {
		for (var i in this) {
			if (this[i] == elem) return true;
		}
		return false;
	};

	/*
	function answer() {
		var query = document.getElementById("sentence").value;
		if (query != "") {
			document.getElementById("question_frm").submit();
		}
	}*/
	
	var dropSelect = function dropSelect(p){
		var drop = $('select[name=dropList]:last option:selected').val();
		doQuestion(drop);
	}

	/* 
  * ajax 통신 성공 콜백 함수
  */
	function ajaxAnswerSuccess(jsonData) {
		if (JSON.stringify(jsonData) == "{}") {
			callback('iChatResponseIsNone');
		} else {
			//답변박스
			var data = jsonData.answer;
			
				
			if(data.indexOf('"hidden_query"') !=-1){
				//console.log("===============");
				//$("#sentence").attr("readonly",true);
			}else{
				$("#sentence").attr("readonly",false);
			}
			
//			console.log(data);
			if (data != undefined) {
				try {
					var jAnswer = JSON.parse(data);					
					
					doAnswer(wrapTemplate(jAnswer), jAnswer);
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

	/* 
  * ajax 통신 에러 콜백 함수
  */
	function ajaxAnswerError(request, status, error) {
		doAnswer(ERROR_MESSAGE);
		console.log("ajaxAnswerError error : " + error);
		callback(null);
	}

	/* 
  * scroll bottom 함수
  */
	function scrollBottom() {
		$(".chat_area").mCustomScrollbar("scrollTo", "bottom", { scrollInertia: 10 });
	}

	/* 
  * swiper 동작 initiate 함수
  * @json swiper click event 위한 파라미터
  */
	function activateSwiper(json) {
		if (json.buttons) {
			var button_length = json.buttons.button.length;
			var button_height = json.buttons.height;
//			if(button_height == undefined)	button_height = 1; 
			var config = {
				'swipe': {
					selector: '.swiper-container:not(.swiper-container-horizontal)',
					sliderPerView: [button_length < 4 ? button_length : 4, 2, 3],
					slidesPerColumn: [button_height == undefined ? 1 : button_height]
				},
				'swipe_bottom': {
					selector: '.swiper-container.bottom:not(.swiper-container-horizontal)',
					// sliderPerView: [button_length < 5 ? button_length : 5, 4, 3]
					sliderPerView: [button_length < 5 ? button_length : 5, 'auto', 4],
					slidesPerColumn: [button_height == undefined ? 1 : button_height]
				},
				'swipe_lines': {
					selector: '.swiper-container:not(.swiper-container-horizontal)',
					// sliderPerView: [button_length < 5 ? button_length : 5, 4, 3]
					sliderPerView: [button_length < 5 ? button_length : 3, 3, 3],
					slidesPerColumn: [button_height == undefined ? 1 : button_height]
				}
			}
			var option = config[json.buttons.type];
			var parameters = {
				slidesPerView: option.sliderPerView[0],
				slidesPerColumn: option.slidesPerColumn[0],
				spaceBetween: 10,
				pagination: {
					el: '.swiper-pagination',
					clickable: true
				},
				breakpoints: {
				    480: {
				      slidesPerView: option.sliderPerView[1],
				      spaceBetween: 10
				    },
				    768: {
				      slidesPerView: option.sliderPerView[2],
				      spaceBetween: 10
				    }
				  }
			}
			
			if (json.buttons.type === 'swipe_bottom') {
				parameters.navigation = {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev'
				}
				
				$('.swiper-container.bottom').on('mouseenter', function () {
					$(this).children().each(function (i, v) {
						return $(v).attr('class').indexOf('swiper-button') > -1 ? $(v).css('display', 'flex') : undefined;
					});
				});
				$('.swiper-container.bottom').on('mouseleave', function () {
					$(this).children().each(function (i, v) {
						return $(v).attr('class').indexOf('swiper-button') > -1 ? $(v).css('display', 'none') : undefined;
					});
				});
			var t = new Swiper(option.selector, parameters);
			}else{
				var t = new Swiper(option.selector, parameters);
			}
			
			//var t = new Swiper(option.selector, parameters);
			
			$('.swiper-container:last .slide-contents').each(function (i, v) {
				$(v).parent().on('click', function (e) {
					if (json.buttons.button[i].url) moveToUrl(json.buttons.button[i].url);
					else if (json.buttons.button[i].hidden_query) doQuestion(json.buttons.button[i].hidden_query, json.buttons.button[i].buttonname);
					else doQuestion(json.buttons.button[i].buttonname);
					// if (json.buttons.type === 'swipe_bottom') $(v).parent().parent().parent().remove();
					// clearBottomButton(); // 하단버튼 클릭 시 삭제처리
				});
			});
		} if (json.cards) {
			var card_length = json.cards.length;
			var config = {
					selector: '.swiper-container:not(.swiper-container-horizontal)',
					sliderPerView: [card_length < 3 ? card_length : 3, 1.5, 2,1]
				}
			var parameters = {
				slidesPerView: 'auto',
				pagination: {
					el: '.swiper-pagination',
					clickable: true
				},
			}
			
			var t = new Swiper(config.selector, parameters);
		}
	}
	
	/*
	 * clear bottom button elements
	 */
	function clearBottomButton() {
		var bottomButtonEl = $('.swiper-container.bottom');
		if (bottomButtonEl) bottomButtonEl.remove();
	}

	/*
	 * 
	 */
	function moveToUrl(url) {
		clearBottomButton();
		window.open(url, '_blank');
	}
	
	/* 
  * JSON 형식 템플릿 wrapping 함수
  * @json 답변 JSON 파라미터
  */
	function wrapTemplate(json) {
//		$('select[name=dropList]:last').attr('disabled', true);
		var resultAnswer = '';
		var bottomAnswer = '';
		var defaultClassName = "btn type_a";
		var exceptionClassName = "btn type_ex";
		var className = '';
		if (json['notice']){
			$('#treatment_number').html(json.notice.treatment.number);
			$('#treatment_percent').html('('+json.notice.treatment.percent+')');
			$('#treatment_increase').html(json.notice.treatment.increase);
			$('#cured_number').html(json.notice.cured.number);
			$('#cured_percent').html('('+json.notice.cured.percent+')');
			$('#cured_increase').html(json.notice.cured.increase);
			$('#dead_number').html(json.notice.dead.number);
			$('#dead_percent').html('('+json.notice.dead.percent+')');
			$('#dead_increase').html(json.notice.dead.increase);
			$('#tests_number').html(json.notice.test.number);
			$('#tests_increase').html('('+json.notice.test.increase+')');
			$('#notice_total').html(json.notice.total);
			$('#notice_increase').html('('+json.notice.increase+')');
			$('#notice_time').html(json.notice.time+'시 기준');
			$('#notice_text').html(json.notice.text);
		}
		if (json['image']) resultAnswer += "<div class=\"img_box\" style=\"text-align:center;\"><img src=\"" + json.image.url + "\" width=\"" + json.image.width + "\"></div>";
		if (json['message']) {
			if (json['keyword_highlight']) {
				var query = $('.question').last().text();
				var wrap = function wrap(k) {
					return "<b class=\"highlight\">" + k + "</b>";
				};
				json['message'] = query.split(' ').reduce(function (acc, cur) {
					return acc === 0 ? json['message'].replace(cur, wrap(cur)) : acc.replace(cur, wrap(cur));
				}, 0);
			}
			resultAnswer += json['message'];
		}
		// card type(button type 4)
		if (json['cards']) {
			var cards = json['cards'];
			resultAnswer += "<div class=\"swiper-container cards\"><div class=\"swiper-wrapper\">";
			for (var i = 0; i < cards.length; i++) {
				resultAnswer += "<div class=\"swiper-slide card\">";
				var card = cards[i].card;
				resultAnswer += "<img src=\"" + card.image.url + "\" width=\"100%\"></br>";
				resultAnswer += "<div name=\"cardSize"+cardCount+"\">";
				if (card.title) resultAnswer += "<p style=\"font-weight: bold; padding-left: 10px; padding-top: 7px;\">" + card.title + "</p>";
				if (card.price) resultAnswer += "<p style=\"padding-left: 10px; \">" + card.price + "</p>";
				resultAnswer += "</div>";
				if (card.rending_url) {
					var pattern = /^(http|https):\/\/([a-z0-9-_\.]*)/i;
					var domain = card.rending_url.match(pattern)[2].replace('www.', '');
					resultAnswer += "<a href=\"javascript:moveToUrl('" + card.rending_url + "')\"><p style=\"padding-left: 10px; color:#ccd3fe;padding-bottom: 8px;\">" + domain + "</p></a>";
				}
				if (card.card_buttons && card.card_buttons.button) {
					card.card_buttons.button.forEach(function (v, i) {
						if(v.isStyle)	className = exceptionClassName;
						else			className = defaultClassName;
						if (v.url) resultAnswer += "<a href=\"javascript:moveToUrl('" + v.url + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
						else if (v.hidden_query) resultAnswer += "<a href=\"javascript:doQuestion('" + v.hidden_query + "', '" + v.buttonname + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
						else resultAnswer += "<a href=\"javascript:doQuestion('" + v.buttonname + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
					});
				}
				if (card.card_drop && card.card_drop.button) {
//					$('select[name=dropList]:last').attr('disabled', true);
					resultAnswer += "<select name=\"dropList\" onchange=\"dropSelect(this.value)\">";	
					card.card_drop.button.forEach(function (v, i) {
						resultAnswer += "<option value='"+ v +"'>"+ v +"</option>";	
					});
					resultAnswer += "</select>";
				}
				resultAnswer += "</div>";
			}
			resultAnswer += "</div><div class=\"swiper-pagination\"></div></div>";
		}  if (json['card']) {
			var card = json['card'];
			resultAnswer += "<img src=\"" + card.image.url + "\" width=\"100%\"></br>";
			if (card.title) resultAnswer += "<p style=\"font-weight: bold; padding-left: 10px; padding-top: 7px;\">" + card.title + "</p>";
			if (card.price) resultAnswer += "<p style=\"padding-left: 10px; \">" + card.price + "</p>";
			if (card.rending_url) {
				var pattern = /^(http|https):\/\/([a-z0-9-_\.]*)/i;
				var domain = card.rending_url.match(pattern)[2].replace('www.', '');
				resultAnswer += "<a href=\"javascript:moveToUrl('" + card.rending_url + "')\"><p style=\"padding-left: 10px; color:#ccd3fe;padding-bottom: 8px;\">" + domain + "</p></a>";
			}
			if (card.card_buttons && card.card_buttons.button) {
				card.card_buttons.button.forEach(function (v, i) {
					if(v.isStyle)	className = exceptionClassName;
					else			className = defaultClassName;
					if (v.url) resultAnswer += "<a href=\"javascript:moveToUrl('" + v.url + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
					else if (v.hidden_query) resultAnswer += "<a href=\"javascript:doQuestion('" + v.hidden_query + "', '" + v.buttonname + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
					else resultAnswer += "<a href=\"javascript:doQuestion('" + v.buttonname + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
				});
			}
		} if (json['buttons']) {
			// button type 1
			if(json.buttons.length == undefined){
				if (json.buttons.type === 'normal') {
					json.buttons.button.forEach(function (v, i) {
						if(v.isStyle)	className = exceptionClassName;
						else			className = defaultClassName;
						if (v.url) resultAnswer += "<a href=\"javascript:moveToUrl('" + v.url + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
						else if (v.hidden_query) resultAnswer += "<a href=\"javascript:doQuestion('" + v.hidden_query + "', '" + v.buttonname + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
						else resultAnswer += "<a href=\"javascript:doQuestion('" + v.buttonname + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
					});
					// button type 2, 3
				} if (json.buttons.type === 'swipe_bottom') {
					bottomAnswer += "<div class=\"swiper-container bottom\"><div class=\"swiper-wrapper\">";
					json.buttons.button.forEach(function (v, i) {
						bottomAnswer += "<div class=\"swiper-slide\">";
						bottomAnswer += "<div class=\"slide-contents\">" + v.buttonname + "</div></div>";
					});
					bottomAnswer += "</div><div class=\"swiper-button-next\"></div><div class=\"swiper-button-prev\"></div></div>";
				} else if (json.buttons.type === 'swipe') {
					resultAnswer += "<div class=\"swiper-container\"><div class=\"swiper-wrapper\">";
					json.buttons.button.forEach(function (v, i) {
						resultAnswer += "<div class=\"swiper-slide\">";
						if (v.image){
							if(v.width != undefined)	resultAnswer += "<div class=\"slide-image-wrap\"><img src=\"" + v.image + "\" width=\""+v.width+"\"></div>";
							else						resultAnswer += "<div class=\"slide-image-wrap\"><img src=\"" + v.image + "\"></div>";
						}
						resultAnswer += "<div class=\"slide-contents\">" + v.buttonname + "</div></div>";
					});
					resultAnswer += "</div><div class=\"swiper-pagination\"></div></div>";
				} else if (json.buttons.type === 'swipe_lines') {
					resultAnswer += "<div class=\"swiper-container\"><div class=\"swiper-wrapper\">";
					json.buttons.button.forEach(function (v, i) {
						resultAnswer += "<div class=\"swiper-slide greeting\" name='greeting"+buttonHeightCnt+"'>";
						if (v.image){
							if(v.width != undefined)	resultAnswer += "<div class=\"slide-image-wrap greeting-img\"><img src=\"" + v.image + "\"  style=\"width:"+v.width+";height:"+v.width+";\"></div>";
							else						
								resultAnswer += "<div class=\"slide-image-wrap greeting-img\"><img src=\"" + v.image + "\"></div>";
						}
						resultAnswer += "<div class=\"slide-contents greeting-contents\">" + v.buttonname + "</div></div>";
					});
					resultAnswer += "</div><div class=\"swiper-pagination\"></div></div>";
				}  else if (json.buttons.type === 'drop_h') {
//					$('select[name=dropList]:last').attr('disabled', true);					
					resultAnswer += "<select name=\"dropList\" onchange=\"dropSelect(this.value)\">";	
					json.buttons.button.forEach(function (v, i) {
						resultAnswer += "<option value='"+ v.hidden_query +"'>"+ v.buttonname +"</option>";
					});
					resultAnswer += "</select>";
				} else if (json.buttons.type === 'drop'){
//					$('select[name=dropList]:last').attr('disabled', true);
					resultAnswer += "<select name=\"dropList\" onchange=\"dropSelect(this.value)\">";	
					json.buttons.button.forEach(function (v, i) {
						resultAnswer += "<option value='"+ v +"'>"+ v +"</option>";
					});
					resultAnswer += "</select>";
				}
				if (json.buttons.type === 'refresh') {
					json.buttons.button.forEach(function (v, i) {
						resultAnswer += "<a href=\"javascript:location.reload();\" class=\"btn type_a\">" + v.buttonname + "</a>";			
						//resultAnswer += "<a href=\"javascript:alert('aaaa');\" class=\"btn type_a\">" + v.buttonname + "</a>";
					});
					// button type 2, 3
				}
			}else{				
				json.buttons.forEach(function (m, n) {
					if (m.type === 'normal') {
						m.button.forEach(function (v, i) {		
							if(v.isStyle)	className = exceptionClassName;
							else			className = defaultClassName;
							 if (v.url) resultAnswer += "<a href=\"javascript:moveToUrl('" + v.url + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
							else if (v.hidden_query) resultAnswer += "<a href=\"javascript:doQuestion('" + v.hidden_query + "', '" + v.buttonname + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";
							else resultAnswer += "<a href=\"javascript:doQuestion('" + v.buttonname + "')\" class=\"" + className + "\">" + v.buttonname + "</a>";							
						});
					}  
					if (m.type === 'swipe_bottom') {
						bottomAnswer += "<div class=\"swiper-container bottom\"><div class=\"swiper-wrapper\">";
						m.button.forEach(function (v, i) {
							bottomAnswer += "<div class=\"swiper-slide\">";
							bottomAnswer += "<div class=\"slide-contents\">" + v.buttonname + "</div></div>";
						});
						bottomAnswer += "</div><div class=\"swiper-button-next\"></div><div class=\"swiper-button-prev\"></div></div>";
					} else if (m.type === 'swipe') {
						var swipe = json['swipe'];
						resultAnswer += "<div class=\"swiper-container\"><div class=\"swiper-wrapper\">";
						m.button.forEach(function (v, i) {
							resultAnswer += "<div class=\"swiper-slide\">";
							if (v.image) resultAnswer += "<div class=\"slide-image-wrap\"><img src=\"" + v.image + "\" width=\""+v.width+"\" style=\"padding-bottom: 10px;\"></div>";
							resultAnswer += "<div class=\"slide-contents\">" + v.buttonname + "</div></div>";
						});
						resultAnswer += "</div><div class=\"swiper-pagination\"></div></div>";
					} else if (m.type === 'swipe_lines') {
						var swipe = json['swipe'];
						resultAnswer += "<div class=\"swiper-container\"><div class=\"swiper-wrapper\">";
						m.button.forEach(function (v, i) {
							resultAnswer += "<div class=\"swiper-slide greeting\" name='greeting"+buttonHeightCnt+"'>";
							if (v.image){
								if(v.width != undefined)	resultAnswer += "<div class=\"slide-image-wrap greeting-img\"><img src=\"" + v.image + "\"  style=\"width:"+v.width+";height:"+v.width+";\"></div>";
								else						
									resultAnswer += "<div class=\"slide-image-wrap greeting-img\"><img src=\"" + v.image + "\"></div>";
							}
							resultAnswer += "<div class=\"slide-contents greeting-contents\">" + v.buttonname + "</div></div>";
						});
						resultAnswer += "</div><div class=\"swiper-pagination\"></div></div>";
					}  else if (m.type === 'drop_h') {
//						$('select[name=dropList]:last').attr('disabled', true);
						resultAnswer += "<select name=\"dropList\" onchange=\"dropSelect(this.value)\">";
						m.button.forEach(function (v, i) {
							resultAnswer += "<option value='"+ v.hidden_query +"'>"+ v.buttonname +"</option>";
						});
						resultAnswer += "</select>";
					} else if (m.type === 'drop') {
//						$('select[name=dropList]:last').attr('disabled', true);
						resultAnswer += "<select name=\"dropList\" onchange=\"dropSelect(this.value)\">";
						m.button.forEach(function (v, i) {
							resultAnswer += "<option value='"+ v +"'>"+ v +"</option>";
						});
						resultAnswer += "</select>";
					}
					if (m.type === 'refresh') {
						m.button.forEach(function (v, i) {
							resultAnswer += "<a href=\"javascript:location.reload();\" class=\"btn type_a\">" + v.buttonname + "</a>";							
						});
					}
				});
			}
		}
		if (json['message_bottom']) {		
			resultAnswer += "<br/><div style=\"font-size:11px;\">";
			if (json.message_bottom.top_text)	resultAnswer += json.message_bottom.top_text;
			if (json.message_bottom.buttons){
				json.message_bottom.buttons.forEach(function (v, i) {
					if (v.url) resultAnswer += "<a href=\"javascript:moveToUrl('" + v.url + "')\" class=\"btn2 type_b\" style=\"text-decoration:underline;color:#0040ff;\">" + v.buttonname + "</a>";
					else if (v.hidden_query) resultAnswer += "<a href=\"javascript:doQuestion('" + v.hidden_query + "', '" + v.buttonname + "')\" class=\"btn2 type_b\">" + v.buttonname + "</a>";
					else resultAnswer += "<a href=\"javascript:doQuestion('" + v.buttonname + "')\" class=\"btn2 type_b\">" + v.buttonname + "</a>";
				});
			}
			if (json.message_bottom.bottom_text)	resultAnswer += "<br/>"+json.message_bottom.bottom_text;
			resultAnswer +="</div>";
		}
		var answerObj = {}
		answerObj.resultAnswer = resultAnswer;
		if (bottomAnswer !== '') answerObj.bottomAnswer = bottomAnswer;
		return answerObj;
	}

	/* 
  * swiper type check 함수
  * @json 답변 JSON 파라미터
  */
	var hasSwipe = function hasSwipe(json) {
		// console.log({json:json});
		return json.cards || (json.buttons && (json.buttons.type === 'swipe' || json.buttons.type === 'swipe_bottom'));
	};

	// window.question = question;
	window.doQuestion = doQuestion;
	window.moveToUrl = moveToUrl;
	window.oneWayQuery = oneWayQuery;
	window.dropSelect = dropSelect;
	window.refreshQuery = refreshQuery;
})(window);
