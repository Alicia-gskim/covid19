/**
 * 
 */
$(function() {
	console.log("start common js");
	
	$(document).ready(function() {
		if ($.cookie('popup') == 'corona') {
			$(".mainguide").hide();
		}
		$('#noticeOnOff').click(function () {
			if ($(this).hasClass('close')) {
				$(this).removeClass('close');
				$(this).addClass('open');
				$(this).find('img').attr("src", "img/dropdown_down.png");
				$('#notice_list').hide();
				$('.search_boxs').css('margin-top', '51px');
			} else {
				$(this).removeClass('open');
				$(this).addClass('close');
				$(this).find('img').attr("src", "img/dropdown_up.png");
				$('#notice_list').show();
				$('.search_boxs').css('margin-top', '203px');
			}
		});
	});
	
	$('#sendBtn').on('click', function() {
		console.log("click SEND MSG Button ---");
	});
});

function guideOpen() {
	$(".mainguide").show();
}

function guideClose() {
	$(".mainguide").hide();
}

function guideNever() {
	if ($.cookie('popup') == 'corona') {
		$(".mainguide").hide();
	} else {
		$.cookie('popup', 'corona', {
			expires: 1
		});
		$(".mainguide").hide();
	}
}

function moveToUrl(url) {
	console.log(url);
	var bottomButtonE1 = $('.swiper-container.bottom');
	if(bottomButtonE1) {
		bottomButtonE1.remove();
	}
	
	window.open(url, '_blank');
}