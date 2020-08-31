package com.hanium.covid19.adapter;

import java.io.IOException;
import java.util.Map;

// 트렌드 추상화 클래스
public abstract class Covid19Trend {
  // API 호출 추상함수
  public abstract Map<String, Object> getTrend() throws IOException;
}
