package com.hanium.covid19.adapter;

import java.io.IOException;
import java.util.Map;

/**
 * API 호출 추상 클래스
 * 어댑터 패턴 사용
 */
public abstract class Covid19Trend {
  public abstract Map<String, Object> getTrend() throws IOException; // API 호출
}
