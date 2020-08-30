package com.hanium.covid19.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContentsMappingController {

	/**
	 * 코로나 알리미 - 메인 안내문
	 * @return
	 */
	@RequestMapping("/mainAnswer")
	public String mainAnswer() {
		return "answer/mainAnswer";
	}
	
	/**
	 * 코로나 알리미 - 지역별 확진자 현황
	 * @return
	 */
	@RequestMapping("/caseByRegion")
	public String caseByRegion() {
		return "answer/caseByRegion";
	}
	
	/**
	 * 코로나 알리미 - 서울특별시 확진자 현황
	 * @return
	 */
	@RequestMapping("/region-seoul")
	public String seoul() {
		return "answer/region/seoul";
	}
	
	/**
	 * 코로나 알리미 - 보도자료 정부 브리핑
	 * @return
	 */
	@RequestMapping("/governmentBriefing")
	public String governmentBriefing() {
		return "answer/governmentBriefing";
	}
	
	/**
	 * 코로나 알리미 - 선별 진료소 정보 확인
	 * @return
	 */
	@RequestMapping("/screeningClinic")
	public String screeningClinic() {
		return "answer/screeningClinic";
	}
	
	/**
	 * 코로나 알리미 - 의심증상 확인하기
	 * @return
	 */
	@RequestMapping("/suspectedSymptoms")
	public String suspectedSymptoms() {
		return "answer/suspectedSymptoms";
	}
	
	/**
	 * 코로나 알리미 - 코로나19 이슈
	 * @return
	 */
	@RequestMapping("/covid19Issue")
	public String covid19Issue() {
		return "answer/covid19Issue";
	}
	
	/**
	 * 코로나 알리미 - 대상별 맞춤정보
	 * @return
	 */
	@RequestMapping("/customizedByTarget")
	public String customizedByTarget() {
		return "answer/customizedByTarget";
	}
	
	/**
	 * 코로나 알리미 - 일반인 맞춤정보
	 * @return
	 */
	@RequestMapping("/personalizedInformation")
	public String personalizedInformation() {
		return "answer/personalizedInformation";
	}
	
	/**
	 * 코로나 알리미 - 자가격리자 맞춤정보
	 * @return
	 */
	@RequestMapping("/personalQuarantine")
	public String personalQuarantine() {
		return "answer/personalQuarantine";
	}
	
	/**
	 * 코로나 알리미 - 해외방문자 맞춤정보
	 * @return
	 */
	@RequestMapping("/overseasVisitors")
	public String overseasVisitors() {
		return "answer/overseasVisitors";
	}
	
	/**
	 * 코로나 알리미 - 의료인 맞춤정보
	 * @return
	 */
	@RequestMapping("/medicalPersonnel")
	public String medicalPersonnel() {
		return "answer/medicalPersonnel";
	}
}
