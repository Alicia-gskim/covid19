package com.hanium.covid19.controller;

import java.util.Map;

import com.hanium.covid19.service.CallDialogflow;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hanium.covid19.service.Covid19TrendCities;
import com.hanium.covid19.service.Covid19TrendOfKorea;

/**
 * API 호출 컨트롤러
 */
@RestController
public class CovidInfoMappingController {
	
	// 국내 발생 동향 호출
	@RequestMapping("/info/trend/korea")
	@ResponseBody
	public Map<String, Object> getTrendOfKorea() {
		Covid19TrendOfKorea trend = new Covid19TrendOfKorea();
		Map<String, Object> result = trend.getTrend(); // API 호출 결과 리턴
		return result;
	}

	// 시도별 발생 동향 호출
	@RequestMapping("/info/trend/cites")
	@ResponseBody
	public Map<String, Object> getTrendOfCities() {
		Covid19TrendCities trend = new Covid19TrendCities();
		Map<String, Object> result = trend.getTrend(); // API 호출 결과 리턴
		return result;
	}

	@PostMapping("/info/dialogflow")
	public ResponseEntity<Map<String, Object>> getTrendOfCities(@RequestBody Map<String, Object> pMap) {
		String query = (String) pMap.get("query");
		CallDialogflow dialogflow = new CallDialogflow();
		Map<String, Object> result = dialogflow.getTrend(query); // API 호출 결과 리턴
		return ResponseEntity.ok(result);
	}
}