package com.hanium.covid19.common;

import com.google.api.gax.rpc.ApiException;
import com.google.cloud.dialogflow.v2.DetectIntentResponse;
import com.google.cloud.dialogflow.v2.QueryInput;
import com.google.cloud.dialogflow.v2.QueryResult;
import com.google.cloud.dialogflow.v2.SessionName;
import com.google.cloud.dialogflow.v2.SessionsClient;
import com.google.cloud.dialogflow.v2.TextInput;
import org.springframework.stereotype.Service;

import java.io.IOException;

/**
 * Dialogflow API 호출 클래스
 */
@Service
public class DetectIntentTexts {

  /**
   * Dialogflow API 호출
   *
   * @param projectId Dialogflow 프로젝트 ID
   * @param texts UI에서 사용자가 입력한 질문
   * @param sessionId 세션 ID
   * @param languageCode 언어코드
   *
   * @return 쿼리 결과
   */
  public static QueryResult detectIntentTexts(
      String projectId, String texts, String sessionId, String languageCode) throws IOException, ApiException {
    QueryResult queryResult = null; // Dialogflow 분석 결과

    // 클라이어트 세션 생성
    try(SessionsClient sessionsClient = SessionsClient.create()) {
      SessionName session = SessionName.of(projectId, sessionId); // 세션 이름
      // 언어코드를 한국어로 지정하여 Dialogflow 텍스트 형식으로 변환한다.
      TextInput.Builder textInput = TextInput.newBuilder().setText(texts).setLanguageCode(languageCode);
      // Dialogflow 텍스트를 Dialogflow 쿼리 형식으로 변환한다.
      QueryInput queryInput = QueryInput.newBuilder().setText(textInput).build();
      // Dialogflowd에 요청하여 결과를 응답 받는다.
      DetectIntentResponse response = sessionsClient.detectIntent(session, queryInput);
      queryResult = response.getQueryResult();
      }

    return queryResult;
  }
}
