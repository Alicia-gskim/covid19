package com.hanium.covid19.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanium.covid19.DTO.Covid19TrendOfKoreaDTO;

public class CommonKeys {
  public static String trendOfKoreaURL = "http://api.corona-19.kr/korea/?serviceKey=";
  public static String trendOfCitiesURL = "http://api.corona-19.kr/korea/country/new/?serviceKey=";
  public static String serviceAPIKey = "6f3a0574556fb04ab991535d4d7bffa6d";
}
