package com.hanium.covid19.controller;

import com.hanium.covid19.service.Covid19TrendCities;
import com.hanium.covid19.service.Covid19TrendOfKorea;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class CovidInfoMappingController {

  // 국내 전체 발생 동향
  @RequestMapping("/info/trend/korea")
  @ResponseBody
  public Object getTrendOfKorea() {
    Covid19TrendOfKorea trend = new Covid19TrendOfKorea();
    Map<String, Object> result = trend.getTrend();
    return result;
  }

  // 시도별 발생 동향
  @RequestMapping("/info/trend/cites")
  @ResponseBody
  public Map<String, Object> getTrendOfCities() {
    Covid19TrendCities trend = new Covid19TrendCities();
    Map<String, Object> result = trend.getTrend();
    return result;
  }
}
