<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 지역별 확진자현황 -->
<div class="answer">
	<p onclick="getCitiesInfo('/mainAnswer', 'korea', '', 'click')" class="answer__img"><img src="images/gui1.png" alt=""></p>
	<div class=" answer__content">
		<p class="answer__name">코로나알림이</p>
		<div class="answer__ask">
			<p class="answer__info">지역별 확진자현황을 확인할 수 있는 두 가지 방법을 안내드립니다.</p>
			<p class="answer__info--head">지역별 현황 전체보기 선택시</p>
			<p class="answer__info"> 17개 광역시/도별 확진환자, 의사환자 검사 현황 확인 <span>(보건복지부 운영 사이트)</span></p>
			<p class="answer__info--head">특정 지역명 선택시</p>
			<p class="answer__info">해당 광역시/도에서 운영하는 확진자 현황 페이지로 이동 가능</p>

			<div class="btn_wrap local">
				<div class="btn_cover">
<!-- 					<button type="button" onclick="window.open('http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=13&ncvContSeq=&contSeq=&board_id=&gubun=')" class="btn_box"> -->
					<button type="button" onclick="getCitiesInfo('/region-city', 'korea', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_allregion.png">
						</div>
						<div class="greeting-contents">전체보기</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'seoul', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_seoul.png">
						</div>
						<div class="greeting-contents">서울특별시</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'busan', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_busan.png">
						</div>
						<div class="greeting-contents">부산광역시</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'daegu', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_daegu.png">
						</div>
						<div class="greeting-contents">대구광역시</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'incheon', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_incheon.png">
						</div>
						<div class="greeting-contents">인천광역시</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'gwangju', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_gwangju.png">
						</div>
						<div class="greeting-contents">광주광역시</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'daejeon', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_deajun.png">
						</div>
						<div class="greeting-contents">대전광역시</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'ulsan', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_ulsan.png">
						</div>
						<div class="greeting-contents">울산광역시</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'sejong', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_sejong.png">
						</div>
						<div class="greeting-contents">세종시</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'gyeonggi', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_gyeonggi.png">
						</div>
						<div class="greeting-contents">경기도</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'gangwon', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_gangwon.png">
						</div>
						<div class="greeting-contents">강원도</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'chungbuk', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_chungbuk.png">
						</div>
						<div class="greeting-contents">충청북도</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'chungnam', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_chungnam.png">
						</div>
						<div class="greeting-contents">충청남도</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'jeonbuk', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_jeonbuk.png">
						</div>
						<div class="greeting-contents">전라북도</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'jeonnam', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_jeonnam.png">
						</div>
						<div class="greeting-contents">전라남도</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'gyeongbuk', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_gyeongbuk.png">
						</div>
						<div class="greeting-contents">경상북도</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'gyeongnam', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_gyeongnam.png">
						</div>
						<div class="greeting-contents">경상남도</div>
					</button>
					<button type="button" onclick="getCitiesInfo('/region-city', 'jeju', '', 'click')" class="btn_box">
						<div class="greeting-img">
							<img src="https://answerny.ai/img/G6_jeju.png">
						</div>
						<div class="greeting-contents">제주도</div>
					</button>
				</div>
			</div>
		</div>
		<p class="answer__time">오후 10:50</p>
	</div>
</div>