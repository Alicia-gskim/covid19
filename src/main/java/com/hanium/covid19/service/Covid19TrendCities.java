package com.hanium.covid19.service;

import com.google.api.gax.rpc.ApiException;
import com.google.cloud.dialogflow.v2.QueryResult;
import com.hanium.covid19.DTO.Covid19TrendOfCitiesDTO;
import com.hanium.covid19.factory.Covid19RestTemplateFactory;
import com.hanium.covid19.adapter.Covid19Trend;
import com.hanium.covid19.common.CommonKeys;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class Covid19TrendCities extends Covid19Trend {
  String serviceURI = CommonKeys.trendOfCitiesURL + CommonKeys.serviceAPIKey;

  @Override
  public Map<String, Object> getTrend() {
    Map<String, Object> trendMap = new HashMap<String, Object>();

    try {
      RestTemplate restTemplate = Covid19RestTemplateFactory.getRestTemplateInstance();
      Object trend = restTemplate.getForObject(serviceURI, Covid19TrendOfCitiesDTO.class);
      trendMap.put("msg", "success");
      trendMap.put("json", trend);
    } catch(RestClientException e) {
      trendMap.put("msg", "fail");
    } catch(Exception e) {
    	trendMap.put("msg", "fail");
    }
    
    return trendMap;
  }

  public Map<String, Object> getTrend(String query) {
    Map<String, Object> trendMap = new HashMap<String, Object>();

    try {
      String sessionId = UUID.randomUUID().toString();
      QueryResult queryResult = null;

      queryResult = DetectIntentTexts.detectIntentTexts("covid-19-chatbot-epfe", query, sessionId, "ko");

      RestTemplate restTemplate = Covid19RestTemplateFactory.getRestTemplateInstance();
      Object trend = restTemplate.getForObject(serviceURI, Covid19TrendOfCitiesDTO.class);
      trendMap.put("msg", "success");
      trendMap.put("json", trend);
      trendMap.put("query", query);
      trendMap.put("url", query);
      trendMap.put("isBool", true);
      trendMap.put("pgname", queryResult.getFulfillmentText());
    } catch(IOException | ApiException | RestClientException e) {
      trendMap.put("msg", "fail");
    } catch(Exception e) {
    	trendMap.put("msg", "fail");
    }
    
    return trendMap;
  }
}
