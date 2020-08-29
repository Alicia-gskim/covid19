<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
	<meta property="og:image" content="https://answerny.ai/img/chatbot_corona19_2.png">
	<title>�ڷγ�19 ������ ���� ���� ê�� ����!</title>
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
			<h1>�ڷγ� �˸���</h1>
			<div class="header__guide">
				<button type="button">
					<img src="images/guide_btn.png" onclick="guideOpen()">
				</button>
			</div>
		</div>
		<div class="covid">
			<div class="total">
				���� ���� Ȯ��ȯ��
				<span class="total__number" id="notice_total">18,265</span>
				<span class="increase" id="notice_increase">(+320)</span>
				<span class="set_time" id="notice_time">20. 8. 26. (��) 00�� ����</span>
			</div>
			<div class="dashboard">
				<div class="covid__box ing">
					<p class="title">ġ����</p>
					<p class="number">4,210<span class="percent">(22.1%)</span></p>
					<div class="plusnumber">+278</div>
				</div>
				<div class="covid__box end">
					<p class="title">�ݸ�����</p>
					<p class="number">14,551<span class="percent">(76.3%)</span></p>
					<div class="plusnumber">+90</div>
				</div>
				<div class="covid__box deth">
					<p class="title">�����</p>
					<p class="number">316<span class="percent">(1.7%)</span></p>
					<div class="plusnumber">+3</div>
				</div>
			</div>
			<div class="inspection">
				<p>�˻� �� <span id="tests_number">52,795</span> <span id="tests_increase">(+2,433)</span></p>
			</div>
		</div>
		<p class="info" id="notice_text">
			*������������ ��ǥ �� 1-2�ð� �̳��� ������Ʈ�Ǹ�,�������� ���� 00�� ����Դϴ�.
		</p>
	</header>
	
	
	
	<div class="box_wrap">
		<div class="answer">
			<p class="answer__img">
				<img src="images/gui1.png" alt="" onclick="oneWayQuery(1)">
			</p>
			<div class="answer__content">
				<p class="answer__name">�ڷγ��˸���</p>
				<div class="answer__ask">
					�ȳ��ϼ���, �ڷγ�19�� ���� �ñ��� ������ �ȳ��ص帮�� ê���Դϴ�.<br>
					�ʿ��� ������ ��ư�� �����ϰų� ������ ���� �Է��Ͽ� Ȯ���Ͻ� �� �ֽ��ϴ�.
					<div class="btn_wrap">
						<div class="btn_cover">
							<div class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn11.png">
								</div>
								<div class="greeting-contents">������<br>Ȯ������Ȳ</div>
							</div>
							<div class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn9.png">
								</div>
								<div class="greeting-contents">�����ڷ�<br>���κ긮��</div>
							</div>
							<div class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn_factcheck.png">
								</div>
								<div class="greeting-contents">�����<br>�̷����ϴ�</div>
							</div>
							<div class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn10.png">
								</div>
								<div class="greeting-contents">���<br>��������</div>
							</div>
							<div class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn2.png">
								</div>
								<div class="greeting-contents">���������<br>����Ȯ��</div>
							</div>
							<div class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn12.png">
								</div>
								<div class="greeting-contents">��������ũ<br>���� ����</div>
							</div>
							<div class="btn_box">
								<div class="greeting-img">
									<img src="images/Greeting_btn1.png">
								</div>
								<div class="greeting-contents">������Ȳ<br>����Ȯ��</div>
							</div>
						</div>
					</div>
					<div>
						���� ��ó : 
						<a href="#" onclick="moveToUrl('http://www.cdc.go.kr/cdc/')"
							class="btn2 type_b" style="text-decoration:underline;color:#0040ff;">
							������������,
						</a>
						<a href="#" onclick="moveToUrl('http://ncov.mohw.go.kr/index_main.jsp')"
							class="btn2 type_b" style="text-decoration:underline;color:#0040ff;">
							�ڷγ����̷���������-19(COVID-19)
						</a>
					</div>
				</div>
				<p class="answer__time">���� 10:50</p>
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