<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="answer">
	<p onclick="answerClick('/mainAnswer', 'korea', '', 'click')" class="answer__img"><img src="images/gui1.png" alt=""></p>
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