<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="answer">
	<p onclick="answerClick('/mainAnswer', 'korea', '', 'click')" class="answer__img"><img src="images/gui1.png" alt=""></p>
	<div class=" answer__content">
		<p class="answer__name">코로나알림이</p>
		<div class="answer__ask">
			<p class="answer__info">질병관리본부에서는 대상에 따라 필요한 코로나19정보를 제공하고 있습니다. 대상을 선택하시면 해당 정보를 확인하실 수 있습니다</p>

			<div class="btn_wrap local">
				<div class="btn_cover">
					<button onclick="answerClick('/personalizedInformation', 'personalized', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/Greeting_btn4.png">
						</div>
						<div class="greeting-contents">일반인<br>맞춤정보</div>
					</button>
					<button onclick="answerClick('/personalQuarantine', 'quarantine', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/Greeting_btn5.png">
						</div>
						<div class="greeting-contents">자가격리자<br>맞춤정보</div>
					</button>
					<button onclick="answerClick('/overseasVisitors', 'overseasVisitors', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/Greeting_btn6.png">
						</div>
						<div class="greeting-contents">해외방문자<br>맞춤정보</div>
					</button>
					<button onclick="answerClick('/medicalPersonnel', 'medical', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/Greeting_btn7.png">
						</div>
						<div class="greeting-contents">의료인<br>맞춤정보</div>
					</button>
					<button onclick="answerClick('/groupFacility', 'groupFacility', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/Greeting_btn8.png">
						</div>
						<div class="greeting-contents">집단시설<br>맞춤정보</div>
					</button>
				</div>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
		</div>
		<p class="answer__time">오후 10:50</p>
	</div>
</div>