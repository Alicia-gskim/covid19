<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
	<meta property="og:image" content="https://answerny.ai/img/chatbot_corona19_2.png">
	<title>코로나19 예방을 위한 공익 챗봇 서비스!</title>
	<%@ include file="/css.jsp" %>
	<%@ include file="/script.jsp" %>
</head>
<body>
	<script type="text/javascript" src="js/common.js"></script>
	<div class="demoview">
		<div class="wrap">
			<div>
				<div class="mainguide" style="display:block;">
					<div class="guideimg">
						<div class="banner">
							<a href="#" onclick="moveToUrl('http://www.wisenut.com/')" target="_blank">
								<img class="banner_left" src="images/wisenutlogo.png">
							</a>
							<a href="#" onclick="moveToUrl('https://answerny.ai/')" target="_blank">
								<img class="banner_right" src="images/answernylogo.png">
							</a>
						</div>
					</div>
					<h1 class="btnguide">
						<img class="_never" src="images/g_4.png" onclick="guideNever()">
						<img class="_close" src="images/g_5.png" onclick="guideClose()">
					</h1>
				</div>
			</div>
		</div>
	</div>
	<header>
		<div class="header">
			<h1>코로나 알림이</h1>
			<div class="header__guide">
				<button type="button">
					<img src="images/guide_btn.png" onclick="guideOpen()">
				</button>
			</div>
		</div>
		<div class="covid">
			<div class="total">
				국내 누적 확진환자
				<span class="total__number" id="notice_total">18,265</span>
				<span class="increase" id="notice_increase">(+320)</span>
				<span class="set_time" id="notice_time">20. 8. 26. (수) 00시 기준</span>
			</div>
			<div class="dashboard">
				<div class="covid__box ing">
					<p class="title">치료중</p>
					<p class="number">4,210<span class="percent">(22.1%)</span></p>
					<div class="plusnumber">+278</div>
				</div>
				<div class="covid__box end">
					<p class="title">격리해제</p>
					<p class="number">14,551<span class="percent">(76.3%)</span></p>
					<div class="plusnumber">+90</div>
				</div>
				<div class="covid__box deth">
					<p class="title">사망자</p>
					<p class="number">316<span class="percent">(1.7%)</span></p>
					<div class="plusnumber">+3</div>
				</div>
			</div>
			<div class="inspection">
				<p>검사 중 <span id="tests_number">52,795</span> <span id="tests_increase">(+2,433)</span></p>
			</div>
		</div>
		<p class="info" id="notice_text">
			*질병관리본부 발표 후 1-2시간 이내에 업데이트되며,증감수는 전일 00시 대비입니다.
		</p>
	</header>
	
	
	<div class="search_result">
		<div class="search_boxs" >
			<div class="box_wrap">
				<ul class="answer_box">
				</ul>
			</div>
			<div class="box_wrap">
				<ul class="question_box">
				</ul>
			</div>
			<div class="box_wrap">
				<div class="answer">
					<p class="answer__img">
						<img src="images/gui1.png" alt="" onclick="oneWayQuery(1)">
					</p>
					<div class="answer__content">
						<p class="answer__name">코로나알림이</p>
						<div class="answer__ask">
							안녕하세요, 코로나19에 대해 궁금한 정보를 안내해드리는 챗봇입니다.<br>
							필요한 정보는 버튼을 선택하거나 질문을 직접 입력하여 확인하실 수 있습니다.
							<div class="btn_wrap">
								<div class="btn_cover">
									<div class="btn_box">
										<div class="greeting-img">
											<img src="images/Greeting_btn11.png">
										</div>
										<div class="greeting-contents">지역별<br>확진자현황</div>
									</div>
									<div class="btn_box">
										<div class="greeting-img">
											<img src="images/Greeting_btn9.png">
										</div>
										<div class="greeting-contents">보도자료<br>정부브리핑</div>
									</div>
									<div class="btn_box">
										<div class="greeting-img">
											<img src="images/Greeting_btn_factcheck.png">
										</div>
										<div class="greeting-contents">사실은<br>이렇습니다</div>
									</div>
									<div class="btn_box">
										<div class="greeting-img">
											<img src="images/Greeting_btn10.png">
										</div>
										<div class="greeting-contents">대상별<br>맞춤정보</div>
									</div>
									<div class="btn_box">
										<div class="greeting-img">
											<img src="images/Greeting_btn2.png">
										</div>
										<div class="greeting-contents">선별진료소<br>정보확인</div>
									</div>
									<div class="btn_box">
										<div class="greeting-img">
											<img src="images/Greeting_btn12.png">
										</div>
										<div class="greeting-contents">공적마스크<br>관련 정보</div>
									</div>
									<div class="btn_box">
										<div class="greeting-img">
											<img src="images/Greeting_btn1.png">
										</div>
										<div class="greeting-contents">국외현황<br>정보확인</div>
									</div>
								</div>
							</div>
							<div>
								정보 출처 : 
								<a href="#" onclick="moveToUrl('http://www.cdc.go.kr/cdc/')"
									class="btn2 type_b" style="text-decoration:underline;color:#0040ff;">
									질병관리본부,
								</a>
								<a href="#" onclick="moveToUrl('http://ncov.mohw.go.kr/index_main.jsp')"
									class="btn2 type_b" style="text-decoration:underline;color:#0040ff;">
									코로나바이러스감염증-19(COVID-19)
								</a>
							</div>
						</div>
						<p class="answer__time">오후 10:50</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="search">
		<form id="question_frm" name="question_frm" method="POST" action="javascript:doQuestion()">
			<div class="search__wrap">
				<input type="text" class="quesion_input" name="sentence" id="sentence"
					onkeypress="if(event.keyCode==13) {doQuestion(); return false;}">
				<input type="text" hidden="hidden" id="hidden_query">
				<button type="submit" class="btn_send_thema" onclick="doQuestion()">
					SEND
				</button>
			</div>
		</form>
	</div>
</body>
</html>