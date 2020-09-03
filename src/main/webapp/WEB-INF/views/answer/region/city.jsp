<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 지역현황 답변 -->
<div class="answer">
	<p onclick="answerClick('/mainAnswer', 'korea', '', 'click')" class="answer__img"><img src="images/gui1.png" alt=""></p>
	<div class=" answer__content">
		<p class="answer__name">코로나알림이</p>
		<div class="answer__ask">
			<p id="city__name" class="country"></p>
			<p id="city__totalCase" class="total">발생 총합 : <span></span></p>
			<p id="city__case" class="new__case">신규 확진자(국내/해외) : <span></span></p>
			<p id="city__recovered" class="recovered">완치자 :  <span></span></p>
			<p id="city__death" class="death">사망자 :  <span></span></p>
			<p id="city__percentage" class="percent">발생률 :  <span></span></p>
			<p id="city__link" class="link">
				더 자세한 사항을 알고 싶으면 아래 링크를 통해 확인하시기 바랍니다.<br>
				<a href="https://www.seoul.go.kr/coronaV/coronaStatus.do" target="_blank">
					<span></span> 코로나 사이트 바로가기
				</a>
			</p>
		</div>
		<p class="answer__time">오후 10:50</p>
	</div>
</div>