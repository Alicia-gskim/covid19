package com.hanium.covid19.service;

import com.hanium.covid19.DTO.Covid19TrendOfKoreaDTO;
import com.hanium.covid19.factory.Covid19RestTemplateFactory;
import com.hanium.covid19.adapter.Covid19Trend;
import com.hanium.covid19.common.CommonKeys;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * 국내발생동향 API 호출 클래스
 */
@Service
public class Covid19TrendOfKorea extends Covid19Trend {
  String serviceURI = CommonKeys.trendOfKoreaURL + CommonKeys.serviceAPIKey; // 국내발생동향 호출 주소

  /**
   * 국내발생동향 API 호출 결과를 리턴
   */
  @Override
  public Map<String, Object> getTrend() {
    Map<String, Object> trendMap = new HashMap<String, Object>(); // 결과

    // 코로나19 Open API를 호출하여 국내 발생동향을 받는다.
    // 호출결과를 Covid19TrendOfKoreaDTO로 매핑한다.
    try {
      // 싱글톤패턴으로 구현된 Rest API 호출 인스턴스를 가져옴.
      RestTemplate restTemplate = Covid19RestTemplateFactory.getRestTemplateInstance();
      // 시도별발생동향 결과를 DTO 오브젝트로 생성
      Object trend = restTemplate.getForObject(serviceURI, Covid19TrendOfKoreaDTO.class);
      trendMap.put("msg", "success");
      trendMap.put("json", trend); // 국내 코로나19 정보
    } catch(RestClientException e) {
      trendMap.put("msg", "fail");
    } catch(Exception e) {
    	trendMap.put("msg", "fail");
    }
    
    return trendMap;
  }
}
