package com.hanium.covid19.service;

import com.google.api.gax.rpc.ApiException;
import com.google.cloud.dialogflow.v2.DetectIntentResponse;
import com.google.cloud.dialogflow.v2.QueryInput;
import com.google.cloud.dialogflow.v2.QueryResult;
import com.google.cloud.dialogflow.v2.SessionName;
import com.google.cloud.dialogflow.v2.SessionsClient;
import com.google.cloud.dialogflow.v2.TextInput;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class DetectIntentTexts {

  public static QueryResult detectIntentTexts(
      String projectId, String texts, String sessionId, String languageCode) throws IOException, ApiException {
    QueryResult queryResult = null;

    try(SessionsClient sessionsClient = SessionsClient.create()) {
      SessionName session = SessionName.of(projectId, sessionId);
        TextInput.Builder textInput = TextInput.newBuilder().setText(texts).setLanguageCode(languageCode);
        QueryInput queryInput = QueryInput.newBuilder().setText(textInput).build();
        DetectIntentResponse response = sessionsClient.detectIntent(session, queryInput);
        queryResult = response.getQueryResult();
      }

    return queryResult;
  }
}
