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

/**
 * Dialogflow를 통해 질문에 대한 답을 찾고
 * 그에 따른 코로나19 정보를 조회하는 클래스
 */
@Service
public class CallDialogflow {
  String serviceURI = CommonKeys.trendOfCitiesURL + CommonKeys.serviceAPIKey;

  /**
   * 질문에 대한 코로나19정보를 리턴
   *
   * @param query UI에서 사용자가 입력한 질문 텍스트
   *
   * @return 성공/실패, 코로나정보/일반정보, 쿼리, UI에서 불러올 URL, UI에서 불러올 페이지 이름을 가진 Map
   */
  public Map<String, Object> getTrend(String query) {
    Map<String, Object> trendMap = new HashMap<String, Object>(); // 프론트에 리턴할 결과 Map

    try {
      String sessionId = UUID.randomUUID().toString(); // Dialogflow 요청 시 세션 ID 랜덤 생성
      QueryResult queryResult = null; // Dialogflow 쿼리 결과

      // 질문에 해당하는 Intent를 가져옴
      queryResult = DetectIntentTexts.detectIntentTexts("covid-19-chatbot-epfe", query, sessionId, "ko");

      boolean isBool = false; // 코로나정보 true, 그외 정보 false
      String fulfillmentText = queryResult.getFulfillmentText();

      // 질문을 이해 못했을때, 즉 실패일 경우
      if(fulfillmentText.equals("fail")) {
        trendMap.put("msg", "fail");
        trendMap.put("isBool", false);
        trendMap.put("query", query);
        trendMap.put("url", query);
        trendMap.put("pgname", fulfillmentText);
        trendMap.put("json", "");
        return trendMap;
      }
      // 질문을 이해 했을때
      // 질문이 답이 코로나19정보와 관련이 있을 경우 그에 대한 정보를 조회함.
      else {
        String splitText[] = fulfillmentText.split(","); // 질문의 답을 , 로 자름

        // 코로나19 정보 조회일 경우
        if(splitText[1].equals("trend")) {
          // 코로나19 Open API를 호출
          RestTemplate restTemplate = Covid19RestTemplateFactory.getRestTemplateInstance();
          // API 호출 결과를 DTO를 사용하여 오브젝트로 생성
          Object trend = restTemplate.getForObject(serviceURI, Covid19TrendOfCitiesDTO.class);

          // Map에 결과를 추가
          trendMap.put("msg", "success");
          trendMap.put("isBool", true);
          trendMap.put("query", query);
          trendMap.put("url", query);
          trendMap.put("pgname", splitText[0]); // UI에서 매칭될 페이지 이름
          trendMap.put("json", trend); // 코로나19 정보
        }
        // 일반 정보 조회일 경우
        else {
          trendMap.put("msg", "success");
          trendMap.put("isBool", false);
          trendMap.put("query", query);
          trendMap.put("url", splitText[0]); // UI에서 매칭도리 URL
          trendMap.put("pgname", splitText[1]); // UI에서 매칭될 페이지 이름
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
