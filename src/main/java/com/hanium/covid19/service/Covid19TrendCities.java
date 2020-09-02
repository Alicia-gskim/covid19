package com.hanium.covid19.service;

import com.hanium.covid19.DTO.Covid19TrendOfCitiesDTO;
import com.hanium.covid19.factory.Covid19RestTemplateFactory;
import com.hanium.covid19.adapter.Covid19Trend;
import com.hanium.covid19.common.CommonKeys;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class Covid19TrendCities extends Covid19Trend {

  @Override
  public Map<String, Object> getTrend() {
    String serviceURI = CommonKeys.trendOfCitiesURL + CommonKeys.serviceAPIKey;

    Map<String, Object> trendMap = new HashMap<String, Object>();

    try {
      RestTemplate restTemplate = Covid19RestTemplateFactory.getRestTemplateInstance();
      Object trend = restTemplate.getForObject(serviceURI, Covid19TrendOfCitiesDTO.class);
      trendMap.put("msg", "success");
      trendMap.put("json", trend);
    }
    catch(RestClientException e) {
      trendMap.put("msg", "fail");
    }
    finally {
      return trendMap;
    }
  }

  public Map<String, Object> getTrend(String query) {
    String serviceURI = CommonKeys.trendOfCitiesURL + CommonKeys.serviceAPIKey;

    Map<String, Object> trendMap = new HashMap<String, Object>();

    try {
      RestTemplate restTemplate = Covid19RestTemplateFactory.getRestTemplateInstance();
      Object trend = restTemplate.getForObject(serviceURI, Covid19TrendOfCitiesDTO.class);
      trendMap.put("msg", "success");
      trendMap.put("json", trend);
    }
    catch(RestClientException e) {
      trendMap.put("msg", "fail");
    }
    finally {
      return trendMap;
    }
  }
}
