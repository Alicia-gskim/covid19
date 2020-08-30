package com.hanium.covid19.adapter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Covid19TrendOfKorea extends Covid19Trend{

  public Covid19TrendOfKorea() {
    this.requsetType = 0;
  }

  @Override
  public String getTrend() throws IOException {
    URL serviceUrl = new URL("http://api.corona-19.kr/korea/country/new/?serviceKey=6f3a0574556fb04ab991535d4d7bffa6d");
    HttpURLConnection serviceConnection = (HttpURLConnection) serviceUrl.openConnection();

    serviceConnection.setRequestMethod("GET");

    int responseCode = serviceConnection.getResponseCode();
    BufferedReader inputStream = new BufferedReader(new InputStreamReader(serviceConnection.getInputStream()));
    String inputLine;
    StringBuffer response = new StringBuffer();

    while((inputLine = inputStream.readLine()) != null) {
      response.append(inputLine);
    }

    inputStream.close();
    serviceConnection.disconnect();

    return response.toString();
  }
}