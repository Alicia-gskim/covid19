<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 지역현황 답변 -->
<div class="answer">
	<p onclick="answerClick('/mainAnswer', 'main')" class="answer__img"><img src="images/gui1.png" alt="""></p>
	<div class=" answer__content">
		<p class="answer__name">코로나알림이</p>
		<div class="answer__ask">
			<p class="country">서울</p>
			<p class="total">발생 총합 : <span>158,121</span></p>
			<p class="new__case">신규 확진자(국내/해외) : <span><b>458</b> (438/20) </span></p>					
			<p class="recovered">완치자 :  <span>1,245</span></p>
			<p class="death">사망자 :  <span>30</span></p>
			<p class="percent">발생률 :  <span>15%</span></p>
			<p class="link">
				더 자세한 사항을 알고 싶으면 아래 링크를 통해 확인하시기 바랍니다.<br>
				<a href="https://www.seoul.go.kr/coronaV/coronaStatus.do" target="_blank"><span>서울</span> 코로나 사이트 바로가기</a></p>
		</div>
		<p class="answer__time">오후 10:50</p>
	</div>
</div>