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
	<!-- header -->
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
				<span class="total__number" id="notice_total"></span>
				<span class="increase" id="notice_increase"></span>
				<span class="set_time" id="notice_time"></span>
			</div>
			<div class="dashboard">
				<div class="covid__box ing">
					<p class="title">치료중</p>
					<p class="number" id="NowCase">
						<span></span>
						<span class="percent"></span>
					</p>
					<div class="plusnumber" id="NCplus"></div>
				</div>
				<div class="covid__box end">
					<p class="title">격리해제</p>
					<p class="number" id="TotalRecovered">
						<span></span>
						<span class="percent"></span>
					</p>
					<div class="plusnumber" id="TRplus"></div>
				</div>
				<div class="covid__box deth">
					<p class="title">사망자</p>
					<p class="number" id="TotalDeath">
						<span></span>
						<span class="percent"></span>
					</p>
					<div class="plusnumber" id="TDplus"></div>
				</div>
			</div>
			<div class="inspection">
				<p>검사 중 <span id="checkingCounter"></span> <span id="tests_increase"></span></p>
			</div>
		</div>
		<p class="info" id="notice_text">*질병관리본부 발표 후 1-2시간 이내에 업데이트되며,증감수는 전일 00시 대비입니다.</p>
	</header>
	<!-- //header -->
	<%@ include file="./help.jsp" %>
	
	<div class="box_wrap">
		<!-- 기본질문 -->
		<!-- <div class="answer">
			<p onclick="answerClick('/mainAnswer')" class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask">
					안녕하세요, 코로나19에 대해 궁금한 정보를 안내해드리는 챗봇입니다.<br>
					필요한 정보는 버튼을 선택하거나 질문을 직접 입력하여 확인하실 수 있습니다.
					<div class="btn_wrap">
						<div class="btn_cover">
							<button onclick="answerClick('/caseByRegion', 'region')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn11.png">
								</div>
								<div class="greeting-contents">지역별<br>확진자현황</div>
							</button>
							<button onclick="answerClick('/governmentBriefing', 'government')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn9.png">
								</div>
								<div class="greeting-contents">보도자료<br>정부브리핑</div>
							</button>
							<button onclick="answerClick('/covid19Issue', 'issue')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn_factcheck.png">
								</div>
								<div class="greeting-contents">코코로나19 팩트<br>& 이슈체크</div>
							</button>
							<button onclick="answerClick('/customizedByTarget', 'target')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn10.png">
								</div>
								<div class="greeting-contents">대상별<br>맞춤정보</div>
							</button>
							<button onclick="answerClick('/screeningClinic', 'clinic')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn2.png">
								</div>
								<div class="greeting-contents">선별진료소<br>정보확인</div>
							</button>
							<button onclick="answerClick('/foreignCurrencyCheck', 'foreignChk')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn1.png">
								</div>
								<div class="greeting-contents">국외현황<br>정보확인</div>
							</button>
						</div>
					</div>
					<div style="font-size:11px;">정보 출처 :
						<a href="http://www.cdc.go.kr/cdc/" target="_blank" class="btn2 type_b"
							style="text-decoration:underline;color:#0040ff;">질병관리본부,</a>
						<a href="http://ncov.mohw.go.kr/index_main.jsp" target="_blank"class="btn2 type_b"
							style="text-decoration:underline;color:#0040ff;">코로나바이러스감염증-19(COVID-19)</a>
					</div>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div> -->
	</div>

	<div class="search">
		<div class="search__wrap">
			<input type="text" class="quesion_input" name="sentence" id="sentence" onkeypress="if(event.keyCode==13) {doQuestion(); return false;}">
			<input type="text" hidden="hidden" id="hidden_query">
			<button type="submit" class="btn_send_thema" onclick="doQuestion()">보내기</button>
		</div>
	</div>
</body>
</html>