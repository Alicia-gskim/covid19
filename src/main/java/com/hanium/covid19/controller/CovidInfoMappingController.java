package com.hanium.covid19.controller;

import com.hanium.covid19.service.Covid19TrendCities;
import com.hanium.covid19.service.Covid19TrendOfKorea;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class CovidInfoMappingController {

	// 국내 전체 발생 동향
	@RequestMapping("/info/trend/korea")
	@ResponseBody
	public Object getTrendOfKorea() {
		Covid19TrendOfKorea trend = new Covid19TrendOfKorea();
		Map<String, Object> result = trend.getTrend();
		
		return result;
	}

	// 시도별 발생 동향
	@RequestMapping("/info/trend/cites")
	@ResponseBody
	public Map<String, Object> getTrendOfCities() {
		Covid19TrendCities trend = new Covid19TrendCities();
		Map<String, Object> result = trend.getTrend();
		
		return result;
	}
  
  
	@PostMapping("/tmp/request")
	public ResponseEntity<Map<String, Object>> getTrendOfCities(@RequestBody Map<String, Object> pMap) {
		Map<String, Object> rMap = new HashMap<String, Object>();
		String query = (String)pMap.get("query");
		
		boolean isBool = false;
		String pgname = "", url = "";
		if( "지역별".contains(query) ) {
			pgname = "region";
			url = "/caseByRegion";
			isBool = true;
		} else if( "서울".contains(query) ) {
			pgname = "seoul";
			url = "/region-seoul";
			isBool = true;
		}
		
		rMap.put("isBool", isBool);
		rMap.put("pgname", pgname);
		rMap.put("url", url);
		rMap.put("query", query);
		
		return ResponseEntity.ok(rMap);
	}
}
