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
					<img src="images/guide_btn.png" onclick="javascript:guideOpen();">
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
		<p class="info" id="notice_text">*질병관리본부 발표 후 1-2시간 이내에 업데이트되며,증감수는 전일 00시 대비입니다.</p>
	</header>
	<!-- //header -->
	
	<div class="box_wrap">
		<!-- 기본질문 -->
		<div class="answer">
			<p onclick="answerClick('/mainAnswer')" class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask">
					안녕하세요, 코로나19에 대해 궁금한 정보를 안내해드리는 챗봇입니다.<br>
					필요한 정보는 버튼을 선택하거나 질문을 직접 입력하여 확인하실 수 있습니다.
					<div class="btn_wrap">
						<div class="btn_cover">
							<button onclick="answerClick('/caseByRegion')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn11.png">
								</div>
								<div class="greeting-contents">지역별<br>확진자현황</div>
							</button>
							<button onclick="answerClick('/governmentBriefing')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn9.png">
								</div>
								<div class="greeting-contents">보도자료<br>정부브리핑</div>
							</button>
							<button onclick="answerClick('/covid19Issue')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn_factcheck.png">
								</div>
								<div class="greeting-contents">코코로나19 팩트<br>& 이슈체크</div>
							</button>
							<button onclick="answerClick('/customizedByTarget')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn10.png">
								</div>
								<div class="greeting-contents">대상별<br>맞춤정보</div>
							</button>
							<button onclick="anserClick('/screeningClinic')" class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn2.png">
								</div>
								<div class="greeting-contents">선별진료소<br>정보확인</div>
							</button>
							<button class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn1.png">
								</div>
								<div class="greeting-contents">국외현황<br>정보확인</div>
							</button>
						</div>
					</div>
					<div>정보 출처 : <a href="javascript:moveToUrl(&#39;http://www.cdc.go.kr/cdc/&#39;)" class="btn2 type_b"
							style="text-decoration:underline;color:#0040ff;">질병관리본부,</a><a
							href="javascript:moveToUrl(&#39;http://ncov.mohw.go.kr/index_main.jsp&#39;)"
							class="btn2 type_b"
							style="text-decoration:underline;color:#0040ff;">코로나바이러스감염증-19(COVID-19)</a></div>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div>
		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">지역별 확진자 현황</p>
			<p class="questioner__time">오후 10:50</p>
		</div>
		<!-- 지역별 확진자현황 -->
		<div class="answer">
			<p class="answer__img"><img src="images/gui1.png" alt="""></p>
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
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_allregion.png">
								</div>
								<div class="greeting-contents">전체보기</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_seoul.png">
								</div>
								<div class="greeting-contents">서울특별시</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_busan.png">
								</div>
								<div class="greeting-contents">부산광역시</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_daegu.png">
								</div>
								<div class="greeting-contents">대구광역시</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_incheon.png">
								</div>
								<div class="greeting-contents">인천광역시</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_gwangju.png">
								</div>
								<div class="greeting-contents">광주광역시</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_deajun.png">
								</div>
								<div class="greeting-contents">대전광역시</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_ulsan.png">
								</div>
								<div class="greeting-contents">울산광역시</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_sejong.png">
								</div>
								<div class="greeting-contents">세종시</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_gyeonggi.png">
								</div>
								<div class="greeting-contents">경기도</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_gangwon.png">
								</div>
								<div class="greeting-contents">강원도</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_chungbuk.png">
								</div>
								<div class="greeting-contents">충청북도</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_chungnam.png">
								</div>
								<div class="greeting-contents">충청남도</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_jeonbuk.png">
								</div>
								<div class="greeting-contents">전라북도</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_jeonnam.png">
								</div>
								<div class="greeting-contents">전라남도</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_gyeongbuk.png">
								</div>
								<div class="greeting-contents">경상북도</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/G6_gyeongnam.png">
								</div>
								<div class="greeting-contents">경상남도</div>
							</button>
							<button type="button" class="btn_box">
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
		
		<!-- 각 지역별 발생 형황 : q -->
		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">서울특별시 확진자 현황</p>
			<p class="questioner__time">오후 10:50</p>
		</div>
		
		<!-- 지역현황 답변 -->
		<div class="answer">
			<p class="answer__img"><img src="images/gui1.png" alt="""></p>
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

		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">보도자료 정부 브리핑</p>
			<p class="questioner__time">오후 10:50</p>
		</div>

		<!-- 보도자료 정부 브리핑 답변 -->
		<div class="answer">
			<p class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask">
					<p class="answer__info">정부는 코로나19 발생에 따라 중앙사고수습본부와 중앙방역대책본부를 운영하고 있습니다. 각 본부에서는 정례브리핑(1일 1회)과 국내 현황보도를 진행하고 있습니다.
						<br /><br />더 자세한 사항은 각 보도자료 사이트를 이용하여 주시기 바랍니다.
					</p>
					<dl>
						<dt><a hres="https://tv.naver.com/ktv/playlists" target="_blank">KTV 국민방송</a></dt>
						<dd>- 각 본부의 정례브리핑 동영상 확인 가능</dd>
					</dl>
					<dl>
						<dt><a hres="http://ncov.mohw.go.kr/tcmBoardList.do?brdId=&brdGubun=&dataGubun=&ncvContSeq=&contSeq=&board_id=&gubun=" target="_blank">질병관리본부 보도자료</a></dt>
						<dd>- 중앙방역대책본부의 일일집계통계 및 정례브리핑 확인 가능</dd>
					</dl>
					<dl>
						<dt><a hres="http://ncov.mohw.go.kr/tcmBoardList.do?brdId=&brdGubun=&dataGubun=&ncvContSeq=&contSeq=&board_id=&gubun=" target="_blank">중앙사고수습본부 정례브리핑</a></dt>
						<dd>- 중앙사고수습본부의 정례브리핑 확인 가능</dd>
					</dl>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div>

		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">선별 진료소 정보 확인</p>
			<p class="questioner__time">오후 10:50</p>
		</div>

		<!-- 선별 진료소 -->
		<div class="answer">
			<p class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask clinic">
					<p class="answer__info"><a href="https://www.mohw.go.kr/react/popup_200128.html" target="_blank">선별 진료소</a>에 관한 안내입니다.</p>
					<p class="answer__info"><a href="https://www.mohw.go.kr/react/popup_200128_2.html" target="_blank">검체 채취가 가능한 선별 진료소</a>를 이용하여야 검사 가능<br>ㄴ 선별 진료소는, 안전하게 검체를 채취할 수 있는 환경과 의뢰 체계를 갖추고 있습니다!</p>
					<p class="answer__info">* <a href="https://www.mohw.go.kr/react/popup_200128.html" target="_blank">지역별 선별 진료소 목록</a> 및 <a href="https://www.mohw.go.kr/react/popup_200128_2.html" target="_blank">검체 채취 가능 진료소 목록</a>을 확인해보세요!</p>
					<p class="answer__info">*암, 심장질환 등 호흡기질환이 아닌 환자들께서는 코로나19에 대해서 안심하고 <a href="https://www.mohw.go.kr/react/popup_200128_3.html" target="_blank">국민안심병원</a>에서 진료받으실 수 있습니다.</p>

					<button onclick="answerClick('/suspectedSymptoms', 'suspected')" class="answer__request">의심증상 확인하기</button>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div>

		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">의심 증상 확인하기</p>
			<p class="questioner__time">오후 10:50</p>
		</div>

		<!-- 의심증상 -->
		<div class="answer">
			<p class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask clinic">
					<p class="answer__info">코로나19의 원인 병원체는 신종 코로나 바이러스입니다.<br>
						증상은 발열 및 호흡기 증상(기침, 인후통, 폐렴 등)이 주로 나타나며, 현재 정확한 치명률은 알려져 있지 않습니다.</p>
					<p class="answer__info">감염병이 의심된다면, <a href="https://www.g-health.kr/portal/health/pubHealthSearch/list.do?rows=5&cpage=1&cl_cd=71&c_view=1&bbsId=U00198&menuNo=200452" target="_blank">관할 보건소</a> 또는 📞1339 혹은 📞지역번호+120로 상담을 문의해주시기 바랍니다.</p>
					<p class="answer__info">※ For more information on selected clinics : Call local Health centers or call at 1339 or your area code + 120</p>
					<p class="answer__info">※ 如疑似被感染，向所在地保健所咨询,或拨打 1339、区号+120电话咨询</p>
					<p class="answer__info"><a href="http://ncov.mohw.go.kr/baroView.do?brdId=4&brdGubun=&dataGubun=&ncvContSeq=&contSeq=&board_id=" target="_blank">코로나19 바이러스 란?</a></p>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div>

		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">코로나19 이슈</p>
			<p class="questioner__time">오후 10:50</p>
		</div>

		<!-- 코로나19 이슈 -->
		<div class="answer">
			<p class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask clinic">
					<p class="answer__info">코로나19 예방을 위해 중요한 것은 정확한 정보를 아는 것입니다.<br>
						질병관리본부에서는 코로나19에 대한 이슈를 확인하여 정보로 제공하고 있습니다. 아래 버튼을 선택하여 코로나19 이슈에 대한 사실 정보를 확인해보시기 바랍니다.</p>
					<p class="answer__info"><a href="http://ncov.mohw.go.kr/factBoardList.do" target="_blank">코로나19  팩트 & 이슈체크 확인하러 가기</a></p>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div>

		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">대상별 맞춤정보</p>
			<p class="questioner__time">오후 10:50</p>
		</div>

		<div class="answer">
			<p class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask">
					<p class="answer__info">질병관리본부에서는 대상에 따라 필요한 코로나19정보를 제공하고 있습니다. 대상을 선택하시면 해당 정보를 확인하실 수 있습니다</p>

					<div class="btn_wrap local">
						<div class="btn_cover">
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/Greeting_btn4.png">
								</div>
								<div class="greeting-contents">일반인<br>맞춤정보</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/Greeting_btn5.png">
								</div>
								<div class="greeting-contents">자가격리자<br>맞춤정보</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/Greeting_btn6.png">
								</div>
								<div class="greeting-contents">해외방문자<br>맞춤정보</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/Greeting_btn7.png">
								</div>
								<div class="greeting-contents">의료인<br>맞춤정보</div>
							</button>
							<button type="button" class="btn_box">
								<div class="greeting-img">
									<img src="https://answerny.ai/img/Greeting_btn8.png">
								</div>
								<div class="greeting-contents">집단시설<br>맞춤정보</div>
							</button>
						</div>
					</div>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div>

		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">일반인 맞춤정보</p>
			<p class="questioner__time">오후 10:50</p>
		</div>

		<!-- 일반인 맞춤정보 -->
		<div class="answer">
			<p class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask swiper-container info">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<p class="info__title">1. 코로나 바이러스 예방법</p>
							<p. class="info__text">손 씻기, 마스크 쓰기와 같은 코로나19 예방법을 확인할 수 있습니다.</p.>
							<!-- 19예방법 -->
							<div class="info__contant">
								<p class="info__subtitle">
									코로나19예방법
								</p>
								<p>코로나19 예방 국민행동 수칙을 안내해드리겠습니다.</p>
								<ul>
									<li>세정제로 물에 30초 이상 꼼꼼히 자주 손 씻기! ( 손바닥, 손등, 손가락 사이, 엄지손가락, 손톱 밑 등)</li>
									<li>기침이나 재채기 후에는 꼭 손을 씻으세요. (기침 등 호흡기 증상이 있을 경우 반드시 기침 예절 준수!)</li>
									<li>사람이 많이 모이는 장소 등을 방문 시 마스크를 착용하세요. (특히, 의료기관 방문 시 마스크 착용하세요.)</li>
									<li>마스크가 없으면 기침이나 재채기할 때 옷소매로 입과 코 가리세요. (단, 눈·코·입 만지지 않기!)</li>
								</ul>

								<p class="denger">
									중국 여행 후 14일 이내 발열 또는 호흡기 증상(기침, 인후통 등), 폐렴이 발생할 경우 보건소, 콜센터(☎지역번호+120 또는 ☎1339)로 문의
									<br> ※의료진에게 반드시 해외여행력을 알려주세요.
								</p>
								
								<p class="info__subtitle">
									손소독제는 효과 있나요
								</p>
								<p>손을 통한 감염을 예방하기 위해서는 흐르는 물에 30초 이상 비누를 사용하여 손 씻기를 권고합니다.<br>
									다만, 손을 씻을 수 없는 경우에는 식품의약품안전처에서 허가한 손소독제를 사용하시기 바랍니다.</p>
	
								<p class="link"><a href="http://ncov.mohw.go.kr/faqBoardList.do?brdId=3&brdGubun=38" target="_blank">코로나 바이러스 FAQ 보기</a></p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">2.  바이러스는 어떻게 전염 되나요?</p>
							<p. class="info__text">코로나바이러스의 전염 방식을 알려드리겠습니다.</p.>
							<div class="info__contant">
								<p class="info__subtitle">
									코로나 19 전염성
								</p>
								<p>코로나19의 전파경로는 비말(침방울) 및 호흡기 분비물(콧물, 가래 등)과의 접촉입니다. <br>
									코로나19에 감염된 사람이 기침, 재채기를 했을 때 공기 중으로 날아간 비말이 다른 사람의 호흡기로 들어가거나, <br>
									손에 묻은 바이러스가 눈·코·입 등을 만질 때 점막을 통해 바이러스가 침투하여 전염이 됩니다.</p>
								<ul>
									<li>인공호흡기나 그 외 호흡기 관련된 의료적 처치 등 밀폐된 공간에서 제한적으로 전파가 이루어질 가능성은 있습니다.</li>
									<li>WHO는 다음과 같이 공기전파 가능성에 대해 설명하고 있습니다.
										: 기침 또는 재채기를 하면 큰 침방울(droplets)이 뿌려질 수 있으나, 공기 중에 오랫동안 머무르지 않고 떨어집니다. 삽관(intubation)과 같은 의료적 처치 과정에서도 작은 침방울들이 공기 중으로 뿌려집니다. 공기 정화 시스템에서 메르스 바이러스 RNA가 검출되었던 보고는 있으나 살아있는 바이러스는 아니었습니다. 코로나19의 전파 방법에 대해서는 정보 분석을 통한 평가가 필요합니다.</li>
								</ul>
								<p class="info__subtitle">
									무증상자 전염
								</p>
								<p>국내의 코로나19 발생 사례 중 무증상에서 전파된 사례는 현재까지 명확히 확인된 바 없습니다.<br>
									무증상 감염인지 아니면 발병하였으나 경미하여 증상을 느끼지 못한 상태에서 전파된 것인지에 대한 판단은 코로나19 유행과 관련된 사례들에 대해 다각적 분석이 이루어진 후에 가능할 것입니다.</p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">3. 의사환자? 확진환자?</p>
							<p. class="info__text">의사환자 및 확진 환자의 분류 및 대응 절차를 안내해드리겠습니다.</p.>
							<div class="info__contant">
								<p class="info__subtitle">
									3-1 확진환자
								</p>
								<ul>
									<li>- 임상 양상에 관계없이 진단을 위한 검사 기준에 따라 감염병 병원체 감염이 확인된 자</li>
								</ul>
								<p class="info__subtitle">
									3-2 의사환자
								</p>
								<ul>
									<li>- 중국을 방문한 후 14일 이내에 발열 또는 호흡기 증상(기침, 인후통 등)이 나타난 자</li>
									<li>- 확진 환자의 증상 발생 기간 중 확진 환자와 밀접하게 접촉한 후 14일 이내에 발열 또는 호흡기 증상(기침, 인후통 등)이 나타난 자</li>
									<li>- 의사의 소견에 따라 신종 코로나바이러스감염증*이 의심되는 자* 신종 코로나바이러스감염증 지역사회 유행 국가를 여행한 후 14일 이내에 발열 또는 호흡기 증상(기침, 인후통 등)이 나타난 자 또는 기타 원인불명의 폐렴 등</li>
								</ul>
								<p class="info__subtitle">
									3-2 의사환자가 아닐경우
								</p>
								<ul>
									<li>- 의사환자가 아닌 것으로 확정될 경우, 최초 인지 보건소가 마스크 착용, 개인위생 등 보건교육을 실시합니다.</li>
								</ul>
								<p class="info__subtitle">
									3-2 의사환자인 경우
								</p>
								<ul>
									<li>- 의사환자는 자가 격리가 원칙이나, 폐렴 등 중증인 경우 국가지정 음압격리병상 이송이 가능합니다.</li>
								</ul>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">4. 해외여행 괜찮은 건가요?</p>
							<p. class="info__text">해외여행 자 준비사항 및 여행 중, 여행 후 유의사항을 알려드리겠습니다.</p.>
							<div class="info__contant">
								<p class="info__subtitle">
									4-1 여행 전
								</p>
								<ul>
									<li>한국발 입국자에 대한 조치사항 확인.</li>
									<li>외국에서 우리나라 여행객에 대하여 취하고 있는 조치사항을 필수 확인하여 해당국 방문 계획에 참고하시기 바랍니다(외교부 제공).</li>
									<li>여행 국가 감염병 발생정보 확인(해외감염병NOW, 질병관리본부 1339콜센터 전화)</li>
									<li>해외여행 전 위생용품(손소독제) 및 개인보호구(마스크) 등 준비</li>
								</ul>
								<p class="link"><a href="">한국발 입국자 조치 현황</a></p>
								<p class="link"><a href="">해외감염병NOW</a></p>

								<p class="info__subtitle">
									4-2 여행 중
								</p>
								<ul>
									<li>흐르는 물에 비누로 30초 이상 손 씻기 등 개인위생수칙 준수</li>
									<li>여행 중 가금류 및 야생동물 접촉 금지</li>
									<li>재래시장 방문 자제하기</li>
									<li>호흡기 증상(기침, 인후통, 호흡곤란 등)이 있는 사람과 접촉하지 않고 외출 시 마스크 착용</li>
								</ul>
								<p class="link"><a href="">예방 수칙 원문 확인하기</a></p>

								<p class="info__subtitle">
									4-3 여행 후
								</p>
								<ul>
									<li>입국 시 검역관에게 건강 상태질문서 제출</li>
									<li>귀가 후 14일 이내 발열과 호흡기 증상(기침, 인후통, 호흡곤란 등) 발생 시 질병관리본부 콜센터 (1339)신고</li>
									<li>호흡기 증상이 있을 경우 마스크 착용(외출 시 또는 의료기관 방문 시 반드시 착용)</li>
									<li>흐르는 물에 비누로 30초 이상 손 씻기 등 개인위생수칙 준수</li>
									<li>의료기관 방문 시 해외 여행력을 의료진에게 알리기</li>
								</ul>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">5. 소독방법을 알려주세요</p>
							<p class="info__text">확진 환자 방문 장소 및 가정 내 소독방법을 안내해드리겠습니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">
									중앙방역대책 본부에서 코로나19 감염 예방을 위한 소독 안내 지침을 제공하고 있습니다. <br>
									확진자가 발생한 가정이나 집단 및 다중이용시설은 소독 안내 지침을 사정에 맞게 적용하시어 감염 확산을 방지해주시기 바랍니다.
								</p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">6. 검사를 받고싶어요</p>
							<p class="info__text">바이러스 의심 신고방법 및 주요 증상에 관해 안내해드리겠습니다.</p>
							<div class="info__contant">
								<p class="answer__info"><a href="https://www.mohw.go.kr/react/popup_200128.html" target="_blank">선별 진료소</a>에 관한 안내입니다.</p>
								<p class="answer__info"><a href="https://www.mohw.go.kr/react/popup_200128_2.html" target="_blank">검체 채취가 가능한 선별 진료소</a>를 이용하여야 검사 가능<br>ㄴ 선별 진료소는, 안전하게 검체를 채취할 수 있는 환경과 의뢰 체계를 갖추고 있습니다!</p>
								<p class="answer__info">* <a href="https://www.mohw.go.kr/react/popup_200128.html" target="_blank">지역별 선별 진료소 목록</a> 및 <a href="https://www.mohw.go.kr/react/popup_200128_2.html" target="_blank">검체 채취 가능 진료소 목록</a>을 확인해보세요!</p>
								<p class="answer__info">*암, 심장질환 등 호흡기질환이 아닌 환자들께서는 코로나19에 대해서 안심하고 <a href="https://www.mohw.go.kr/react/popup_200128_3.html" target="_blank">국민안심병원</a>에서 진료받으실 수 있습니다.</p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">7. 치료제가 있나요?</p>
							<p class="info__text">코로나19 바이러스의 백신 및 현재 치료방법에 대해 확인해보세요.</p>
							<div class="info__contant">
								<p>바이러스 감염 시, 치료 방법에 관해 안내해드리겠습니다.</p>
								<p class="info__subtitle">치료비는요?</p>
								<p>ㄴ 감염병의 예방 및 관리에 관한 법률에 의해 국가에서 부담합니다.</p>
								<p class="info__subtitle">백신이 있나요?</p>
								<p>ㄴ 현재 알려져 있는 백신은 없습니다.</p>
								<p class="info__subtitle">그럼 어떻게 치료하나요?</p>
								<p>ㄴ 코로나19은 증상에 따른 대증치료(병의 증상에 대응하여 처치)를 하고 있습니다. <br>
									치료제가 없다는 것은, 특정한 병원균, 즉 코로나19나 병든 세포를 찾아서 치료하도록 만들어진 표적치료제(targeted therapy)가 없다는 뜻이며, 치료가 안된다는 뜻은 아닙니다.</p>
							</div>
						</div>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div>

		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">자가격리자 맞춤정보</p>
			<p class="questioner__time">오후 10:50</p>
		</div>

		<!-- 자가격리자 맞춤정보 -->
		<div class="answer">
			<p onclick="answerClick()" class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask info swiper-container2">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<p class="info__title">1. 자가격리자 생활수칙</p>
							<p class="info__text">코로나19 자가 격리자는 자가 격리 생활수칙과 모니터링 방법을 확인해야 합니다. 또한 자가 격리자의 가족, 동거인도 코로나19의 감염 위험을 감소하기 위한 생활수칙을 지키는 것이 필요합니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">중앙사고 수습본부, 중앙방역대책 본부에서 자가 격리 대상자를 위한 생활수칙을 안내하고 있습니다.</p>
								<ul>
									<li class="info__subtitle">자가 격리 대상자 생활수칙</li>
									<li>감염 전파 방지를 위해 격리 장소 바깥 외출금지</li>
									<li>독립된 공간에서 혼자 생활하기</li>
									<li>진료 등 외출이 불가피할 경우 반드시 관할 보건소에 먼저 연락하기</li>
									<li>가족 또는 함께 거주하는 분과 대화 등 접촉하지 않기</li>
									<li>개인 용품(개인용 수건, 식기류, 휴대전화 등)으로 사용하기</li>
									<li>건강수칙 지키기</li>
								</ul>
								<p class="info__text">질병관리본부에서 제공하는 자가 격리 안내문과 함께 아래 버튼을 눌러 생활수칙 안내 원문도 함께 확인하시기 바랍니다.</p>
								<p class="link"><a href="http://ncov.mohw.go.kr/shBoardView.do?brdId=2&brdGubun=22&ncvContSeq=6" target="_blank">자가 격리 대상자 생활수칙 확인하기</a></p>
								<p  class="link"><a href="http://www.cdc.go.kr/board.es?mid=a20507020000&bid=0019&act=view&list_no=366020" target="_blank">질병관리본부 자가 격리 안내문</a></p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">2.  가족/동거인 생활수칙</p>
							<p class="info__text">중앙사고 수습본부, 중앙방역대책 본부에서 제공하는 자가 격리 대상자의 가족, 동거인의 생활수칙을 알려드립니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">가족 및 동거인을 위한 생활수칙</p>
								<ul>
									<li>최대한 자가 격리 대상자와 접촉하지 않기</li>
									<li>자가 격리 대상자와 불가피하게 접촉할 경우 마스크 착용, 서로 2m이상 거리 두기</li>
									<li>자가 격리 대상자와 독립된 공간에서 생활, 공용 공간은 자주 환기 하기</li>
									<li>비누 또는 손 세정제로 흐르는 물에 30초 이상 자주 손 씻기</li>
									<li>생활용품을 구분하여 사용하기(식기, 물컵, 수건, 침구 등)</li>
									<li>손길이 많이 닿는 곳의 표면 자주 닦기</li>
									<li>자가 격리 대상자 건강 상태 주의 깊게 관찰하기</li>
								</ul>
								<p class="info__text">가족, 동거인을 위한 생활수칙의 자세한 내용은 원문을 통해 확인하시기 바랍니다.</p>
								<p class="link"><a href="http://ncov.mohw.go.kr/shBoardView.do?brdId=2&brdGubun=22&ncvContSeq=5" target="_blank">가족/동거인 생활수칙 원문 확인</a></p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">3. 자가 모니터링 방법</p>
							<p class="info__text">중앙사고 수습본부, 중앙방역대책 본부에서 자가 모니터링 방법을 안내하고 있습니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">가자가 모니터링 방법</p>
								<ul>
									<li>매일 아침, 저녁으로 체온을 측정하고 호흡기 증상 등 감염 증상이 나타나는지 스스로 건강 상태를 체크</li>
									<li>보건소에서 하루에 1회 이상 연락드리며, 이때 감염 증상이 있을 시 알림</li>
								</ul>
								<p class="info__subtitle">감염 증상</p>
								<p class="info__text">발열(37.5 ℃ 이상), 호흡기 증상(기침, 인후통 등), 폐렴이 주요 증상</p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">4. 자가격리 FAQ</p>
							<p class="info__text">코로나19로 인한 자가 격리에 대해 자주 묻는 질문을 안내해드립니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">Q: 자가격리를하면 생활지원을 해주나요?</p>
								<p class="info__text">A: 자가 격리에 따른 생활지원,유급휴가 등을 지원하고 있습니다.</p>

								<p class="info__subtitle">Q: 자가격리 중 외출한 사람들에 대한 법적 처벌기준이 있나요?</p>
								<p class="info__text">A:  자가 격리를 하는 경우 보건소, 읍면동사무소 공무원을 1:1로 담당자를 지정하여 관리 지원합니다. 격리에 협조하지 않을 경우 형사고발을 통한 벌칙(300만원 이하)을 부과합니다.</p>

								<p class="info__subtitle">Q: 자택내 독립된 공간이 확보되지 않을 경우 어떻게 격리하나요?</p>
								<p class="info__text">A:  자택 내 독립된 공간 확보가 안되거나 추가적인 보조가 필요할 경우에는 지자체 내에서 적절한 자가 격리 장소에 시설 또는 병원 격리를 하도록 하고 있습니다.</p>

								<p class="info__subtitle">Q: 외국인데, 자가격리 중이지만 증상도 없고, 본국으로 돌아가고 싶습니다. 출국할 수 있나요?</p>
								<p class="info__text">A:  보건소로부터 격리 통지서를 받은 경우, 증상과 관련 없이 격리 기간 동안 외부 활동 및 출국 등을 할 수 없습니다.</p>

								<p class="link"><a href="http://ncov.mohw.go.kr/faqBoardList.do?brdId=3&brdGubun=38" target="_blank">코로나 바이러스 FAQ 보기</a></p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">5. 접촉자 조치사항</p>
							<p class="info__text">접촉자로 분류되었을 경우, 확진 환자와 마지막 접촉일로부터 14일간 자가 격리 및 능동감시 대상자가 됩니다. 관련하여 자주 물어보는 질문들을 확인해보세요.</p>
							<p class="info__text">중앙방역대책 본부에서 코로나19 감염 예방을 위한 소독 안내 지침을 제공하고 있습니다.<br>
								확진자가 발생한 가정이나 집단 및 다중이용시설은 소독 안내 지침을 사정에 맞게 적용하시어 감염 확산을 방지해주시기 바랍니다.
							</p>
							<div class="info__contant">
								<p class="info__subtitle">Q: 접촉자가 되면 어쩐 조치가 이루어지나요?</p>
								<p class="info__text">A: 의학적 처치를 필요로 하는 상황이 아니면 자가 격리를 원칙으로 하나, 독립된 공간 확보가 어렵거나 추가적인 보조 등이 필요한 경우 접촉자 격리시설 또는 병원 격리를 하게 됩니다.
									<br>보건소장은 접촉자에게 자가 격리 통지서를 발부하고, 생활수칙을 안내하며, 보건소에서 능동감시를 하는데, 자가 격리 해제 시까지 매일 2회 유선 연락하여 발열 또는 호흡기 증상 여부를 확인합니다.</p>

								<p class="info__subtitle">Q: 접촉자 범위는 어쩧게 설정하나요?</p>
								<p class="info__text">A:접촉자는 항공기, 공항, 의료기관, 일상생활 등에서 환자와 접촉한 인원을 대상으로 환자의 증상 및 마스크 착용 여부, 노출력 등을 고려하여 증상 발생 1일 이전부터 접촉자 범위를 설정하고 있습니다.
									<br>항공기 내 접촉자 범위 기준은 탑승한 환자 중심 전후 3열의 승객을 접촉자로 분류하고 있습니다(해당 열 포함 총 7열).</p>

								<p class="info__subtitle">Q: 자택내 독립된 공간이 확보되지 않을경우 어떻게 격리하나요?</p>
								<p class="info__text">A:자택 내 독립된 공간 확보가 안되거나 추가적인 보조가 필요할 경우에는 지자체 내에서 적절한 자가 격리 장소에 시설 또는 병원 격리를 하도록 하고 있습니다.</p>

								<p class="link"><a href="http://ncov.mohw.go.kr/faqBoardList.do?brdId=3&brdGubun=38" target="_blank">코로나 바이러스 FAQ 보기</a></p>
							</div>	
						</div>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div>

		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">해외방문자 맞춤정보</p>
			<p class="questioner__time">오후 10:50</p>
		</div>

		<!-- 해외 방문자 맞춤정보 -->
		<div class="answer">
			<p class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask swiper-container3 info">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<p class="info__title">1. 여행 전</p>
							<p class="info__text">해외 방문자 및 방문 예정자를 위한 코로나 바이러스 예방 방법 및 검역 관련 정보를 안내해드리겠습니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">여행전 확인사항</p>
								<ul>
									<li>한국발 입국자에 대한 조치사항 확인.</li>
									<li>외국에서 우리나라 여행객에 대하여 취하고 있는 조치사항을 필수 확인하여 해당국 방문 계획에 참고하시기 바랍니다(외교부 제공).</li>
									<li>여행 국가 감염병 발생정보 확인(해외감염병NOW, 질병관리본부 1339콜센터 전화)</li>
									<li>해외여행 전 위생용품(손소독제) 및 개인보호구(마스크) 등 준비</li>
								</ul>
								<p class="link"><a href="">한국발 입국자 조치 현황</a></p>
								<p class="link"><a href="">해외감염병NOW</a></p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">2. 여행 중</p>
							<p class="info__text">해외 방문자 및 방문 예정자를 위한 코로나 바이러스 예방 방법 및 검역 관련 정보를 안내해드리겠습니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">여행 중 주의사항</p>
								<ul>
									<li>흐르는 물에 비누로 30초 이상 손 씻기 등 개인위생수칙 준수</li>
									<li>여행 중 가금류 및 야생동물 접촉 금지</li>
									<li>재래시장 방문 자제하기</li>
									<li>호흡기 증상(기침, 인후통, 호흡곤란 등)이 있는 사람과 접촉하지 않고 외출 시 마스크 착용</li>
								</ul>
								<p class="link"><a href="">예방 수칙 원문 확인하기</a></p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">3. 여행 후</p>
							<p class="info__text">해외 방문자 및 방문 예정자를 위한 코로나 바이러스 예방 방법 및 검역 관련 정보를 안내해드리겠습니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">여행 후 주의사항</p>
								<ul>
									<li>입국 시 검역관에게 건강 상태질문서 제출</li>
									<li>귀가 후 14일 이내 발열과 호흡기 증상(기침, 인후통, 호흡곤란 등) 발생 시 질병관리본부 콜센터 (1339)신고</li>
									<li>호흡기 증상이 있을 경우 마스크 착용(외출 시 또는 의료기관 방문 시 반드시 착용)</li>
									<li>흐르는 물에 비누로 30초 이상 손 씻기 등 개인위생수칙 준수</li>
									<li>의료기관 방문 시 해외 여행력을 의료진에게 알리기</li>
								</ul>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">4. 검역절차(중국에서 입국시)</p>
							<p class="info__text">해외 방문자 및 방문 예정자를 위한 코로나 바이러스 예방 방법 및 검역 관련 정보를 안내해드리겠습니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">중국에서 입국 시 검역 절차</p>
								<ul>
									<li>현재 중국 전역으로 오염지역을 확대하여 발열감시와 건강 상태질문서를 통해 건강 상태를 확인할 수 있습니다.</li>
									<li>특별검역을 통해 후베이성에서 입국하는 외국인은 입국을 금지하고 내국인의 입국은 허용하되, 입국 시 국내 거주자와 연락처를 확인한 후 14일간 자가 격리를 실시하게 됩니다.</li>
									<li>중국에서 들어오는 모든 내국인 및 외국인은 중국 전용 입국장을 별도로 설치하여, 국내 거주자의 연락처로 연락이 가능한지 확인한 후 입국을 허용하게 됩니다.</li>
								</ul>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">4. 검역절차(중국 외 지역에서 입국시)</p>
							<p class="info__text">해외 방문자 및 방문 예정자를 위한 코로나 바이러스 예방 방법 및 검역 관련 정보를 안내해드리겠습니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">중국 외 지역에서 입국 시 검역</p>
								<ul>
									<li>입국장에서 발열감시 카메라를 통한 발열감시를 시행하고 있습니다.</li>
									<li>또한 입국 시 증상이 있을 경우 자진신고로 건강 상태질문서 제출을 통해 건강 상태를 확인할 수 있도록 하고 있습니다.</li>
								</ul>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">4. 검역절차(항만)</p>
							<p class="info__text">해외 방문자 및 방문 예정자를 위한 코로나 바이러스 예방 방법 및 검역 관련 정보를 안내해드리겠습니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">항만에서 입국 시 검역</p>
								<ul>
									<li> 항만에서의 검역은 항공기 입국 검역과 동일하게 실시되고 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div>

		<!-- 질문자 -->
		<div class="questioner">
			<p class="questioner__text">의료인 맞춤정보</p>
			<p class="questioner__time">오후 10:50</p>
		</div>

		<!-- 의료인 맞춤정보 -->
		<div class="answer">
			<p onclick="answerClick()" class="answer__img"><img src="images/gui1.png" alt="""></p>
			<div class=" answer__content">
				<p class="answer__name">코로나알림이</p>
				<div class="answer__ask swiper-container4 info">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<p class="info__title">1. 의료인 맞춤정보</p>
							<p class="info__text">중앙방역대책본부에서 의료기관에서 취해야 하는 대응지침을 제시하고 있습니다. 필요한 대응지침의 내용을 확인 후 파일을 다운받아 자세한 내용을 확인하시기 바랍니다.</p>
							<div class="info__contant">
								<p class="info__subtitle">의료기관 대응지침</p>
								<ul>
									<li>실험실 생물안전 가이드</li>
									<li>감염성 물질 안전수송 지침</li>
									<li>의심 환자 내원 시 행동지침</li>
									<li>선별 진료소 운영 안내</li>
								</ul>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">2. 의심환자 내원시 행동지침</p>
							<div class="info__contant">
								<p class="info__subtitle"><b>의심환자 내원 시 행동지침 파일</b>을 다운받아 확인하시기 바랍니다.</p>
								<p class="link"><a href="http://ncov.mohw.go.kr/shBoardView.do?brdId=2&brdGubun=24&ncvContSeq=47" target="_blank">파일 다운받으러 가기</a></p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">3. 실험실생물안전 가이드 안전수송지침</p>
							<div class="info__contant">
								<p class="info__subtitle"><b>실험실 생물안전 가이드/감염성 물질 안전수송지침 파일</b>을 다운받아 확인해보시기 바랍니다.
								<p class="link"><a href="http://ncov.mohw.go.kr/shBoardView.do?brdId=2&brdGubun=24&ncvContSeq=128" target="_blank">파일 다운받으러 가기</a></p>
							</div>
						</div>
						<div class="swiper-slide">
							<p class="info__title">4. 선별진료소 운영안</p>
							<div class="info__contant">
								<p class="info__subtitle"><b>선별진료소 운영안 파일</b>을 다운받아 확인해보시기 바랍니다.</p>
								<p class="link"><a href="http://ncov.mohw.go.kr/shBoardView.do?brdId=2&brdGubun=24&ncvContSeq=46" target="_blank">파일 다운받으러 가기</a></p>
							</div>
						</div>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
				<p class="answer__time">오후 10:50</p>
			</div>
		</div>






	</div>

	<!-- </div> -->
	<div class="search">
		<form id="question_frm" name="question_frm" method="POST" action="javascript:doQuestion()">
			<div class="search__wrap">
				<input type="text" class="quesion_input" name="sentence" id="sentence"
					onkeypress="if(event.keyCode==13) {doQuestion(); return false;}">
				<input type="text" hidden="hidden" id="hidden_query">
				<button type="submit" class="btn_send_thema" onclick="javascript:doQuestion();">
					보내기
				</button>
			</div>
		</form>
	</div>
	</div>
	</div>

	<script>
		var swiper = new Swiper('.swiper-container', {
			autoHeight: true,
			pagination: {
				el: '.swiper-container .swiper-pagination',
			},
		});
		var swiper = new Swiper('.swiper-container2', {
			autoHeight: true,
			pagination: {
				el: '.swiper-container2 .swiper-pagination',
			},
		});
		var swiper = new Swiper('.swiper-container3', {
			autoHeight: true,
			pagination: {
				el: '.swiper-container3 .swiper-pagination',
			},
		});
		var swiper = new Swiper('.swiper-container4', {
			autoHeight: true,
			pagination: {
				el: '.swiper-container4 .swiper-pagination',
			},
		});
	  </script>
</body>
</html>