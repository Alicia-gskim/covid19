package com.hanium.covid19.service;

import com.google.api.gax.rpc.ApiException;
import com.google.cloud.dialogflow.v2.QueryResult;
import com.hanium.covid19.DTO.Covid19TrendOfCitiesDTO;
import com.hanium.covid19.common.CommonKeys;
import com.hanium.covid19.common.DetectIntentTexts;
import com.hanium.covid19.factory.Covid19RestTemplateFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class CallDialogflow {
  String serviceURI = CommonKeys.trendOfCitiesURL + CommonKeys.serviceAPIKey;

  public Map<String, Object> getTrend(String query) {
    Map<String, Object> trendMap = new HashMap<String, Object>();

    try {
      String sessionId = UUID.randomUUID().toString();
      QueryResult queryResult = null;

      queryResult = DetectIntentTexts.detectIntentTexts("covid-19-chatbot-epfe", query, sessionId, "ko");

      boolean isBool = false;
      String fulfillmentText = queryResult.getFulfillmentText();

      // 질문을 이해 못했을때
      if(fulfillmentText.equals("fail")) {
        trendMap.put("msg", "fail");
        trendMap.put("isBool", false);
        trendMap.put("query", query);
        trendMap.put("url", query);
        trendMap.put("pgname", fulfillmentText);
        trendMap.put("json", "");
        return trendMap;
      }
      // 질문을 이해 했을
      else {
        String splitText[] = fulfillmentText.split(",");

        if(splitText[1].equals("trend")) {
          RestTemplate restTemplate = Covid19RestTemplateFactory.getRestTemplateInstance();
          Object trend = restTemplate.getForObject(serviceURI, Covid19TrendOfCitiesDTO.class);

          trendMap.put("msg", "success");
          trendMap.put("isBool", true);
          trendMap.put("query", query);
          trendMap.put("url", query);
          trendMap.put("pgname", splitText[0]);
          trendMap.put("json", trend);
        }
        else {
          trendMap.put("msg", "success");
          trendMap.put("isBool", false);
          trendMap.put("query", query);
          trendMap.put("url", splitText[0]);
          trendMap.put("pgname", splitText[1]);
          trendMap.put("json", "");
        }

        return trendMap;
      }
    }
    catch(IOException | ApiException | RestClientException e) {
      trendMap.put("msg", "fail");
      trendMap.put("isBool", false);
      trendMap.put("query", "");
      trendMap.put("url", "");
      trendMap.put("pgname", "");
      trendMap.put("json", "");
    }
    catch(Exception e) {
      trendMap.put("msg", "fail");
      trendMap.put("isBool", false);
      trendMap.put("query", "");
      trendMap.put("url", "");
      trendMap.put("pgname", "");
      trendMap.put("json", "");
    }

    return trendMap;
  }
}
