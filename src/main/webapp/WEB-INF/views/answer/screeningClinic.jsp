<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 선별 진료소 -->
<div class="answer">
	<p onclick="answerClick('/mainAnswer', 'korea', '', 'click')" class="answer__img"><img src="images/gui1.png" alt=""></p>
	<div class=" answer__content">
		<p class="answer__name">코로나알림이</p>
		<div class="answer__ask clinic">
			<p class="answer__info">
				<a href="https://www.mohw.go.kr/react/popup_200128.html" target="_blank">선별 진료소</a>에 관한 안내입니다.
			</p>
			<p class="answer__info">
				<a href="https://www.mohw.go.kr/react/popup_200128_2.html" target="_blank">검체 채취가 가능한 선별 진료소</a>를 이용하여야 검사 가능<br>ㄴ 선별 진료소는, 안전하게 검체를 채취할 수 있는 환경과 의뢰 체계를 갖추고 있습니다!
			</p>
			<p class="answer__info">* 
				<a href="https://www.mohw.go.kr/react/popup_200128.html" target="_blank">지역별 선별 진료소 목록</a> 및 <a href="https://www.mohw.go.kr/react/popup_200128_2.html" target="_blank">검체 채취 가능 진료소 목록</a>을 확인해보세요
			!</p>
			<p class="answer__info">*암, 심장질환 등 호흡기질환이 아닌 환자들께서는 코로나19에 대해서 안심하고 
				<a href="https://www.mohw.go.kr/react/popup_200128_3.html" target="_blank">국민안심병원</a>에서 진료받으실 수 있습니다.
			</p>

			<button onclick="answerClick('/suspectedSymptoms', 'suspected', '', 'click')" class="answer__request">의심증상 확인하기</button>
		</div>
		<p class="answer__time">오후 10:50</p>
	</div>
</div>