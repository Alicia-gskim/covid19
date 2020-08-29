package com.hanium.covid19.adapter;

import java.io.IOException;

public abstract class Covid19Trend {
  public int requsetType;

  public abstract String getTrend() throws IOException;
}
