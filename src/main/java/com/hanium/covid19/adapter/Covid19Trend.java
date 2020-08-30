package com.hanium.covid19.adapter;

import java.io.IOException;

// 트렌드 추상화 클래스
public abstract class Covid19Trend {
  // API 호출 타입
  public int requsetType;

  public abstract String getTrend() throws IOException;
}
