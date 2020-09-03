<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="answer">
	<p onclick="answerClick('/mainAnswer', 'korea', '', 'click')" class="answer__img"><img src="images/gui1.png" alt=""></p>
	<div class=" answer__content">
		<p class="answer__name">코로나알림이</p>
		<div class="answer__ask">
			안녕하세요, 코로나19에 대해 궁금한 정보를 안내해드리는 챗봇입니다.<br>
			필요한 정보는 버튼을 선택하거나 질문을 직접 입력하여 확인하실 수 있습니다.
			<div class="btn_wrap">
				<div class="btn_cover">
					<button onclick="answerClick('/caseByRegion', 'region', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="images/Greeting_btn11.png">
						</div>
						<div class="greeting-contents">지역별<br>확진자현황</div>
					</button>
					<button onclick="answerClick('/governmentBriefing', 'government', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="images/Greeting_btn9.png">
						</div>
						<div class="greeting-contents">보도자료<br>정부브리핑</div>
					</button>
					<button onclick="answerClick('/covid19Issue', 'issue', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="images/Greeting_btn_factcheck.png">
						</div>
						<div class="greeting-contents">코코로나19 팩트<br>& 이슈체크</div>
					</button>
					<button onclick="answerClick('/customizedByTarget', 'target', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="images/Greeting_btn10.png">
						</div>
						<div class="greeting-contents">대상별<br>맞춤정보</div>
					</button>
					<button onclick="answerClick('/screeningClinic', 'clinic', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="images/Greeting_btn2.png">
						</div>
						<div class="greeting-contents">선별진료소<br>정보확인</div>
					</button>
					<button onclick="answerClick('/foreignCurrencyCheck', 'foreignChk', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="images/Greeting_btn1.png">
						</div>
						<div class="greeting-contents">국외현황<br>정보확인</div>
					</button>
				</div>
			</div>
			<div style="font-size:11px;">정보 출처 :
				<a href="http://www.cdc.go.kr/cdc" target="_blank" class="btn2 type_b"
					style="text-decoration:underline;color:#0040ff;">질병관리본부,</a>
				<a href="http://ncov.mohw.go.kr/index_main.jsp" target="_blank" class="btn2 type_b"
					style="text-decoration:underline;color:#0040ff;">코로나바이러스감염증-19(COVID-19)</a></div>
		</div>
		<p class="answer__time">오후 10:50</p>
	</div>
</div>