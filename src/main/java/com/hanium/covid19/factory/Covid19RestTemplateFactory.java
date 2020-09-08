package com.hanium.covid19.factory;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

/**
 * Rest Template 싱글톤 구현
 * Rest 호출을 위한 팩토리로
 * 인스턴스 하나만 생성
 */
public class Covid19RestTemplateFactory {
  private volatile static RestTemplate restTemplate = null;

/**
 * Rest Template 싱글톤
 *
 * @return Rest Template 인스턴스
 */
public static RestTemplate getRestTemplateInstance() {
    if(null == restTemplate) {
      synchronized(RestTemplate.class) {
        if(null == restTemplate) {
          HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
          factory.setReadTimeout(5000);
          factory.setConnectTimeout(3000);
          HttpClient httpClient = HttpClientBuilder.create().setMaxConnTotal(100).setMaxConnPerRoute(5).build();
          factory.setHttpClient(httpClient);

          restTemplate = new RestTemplate(factory);
        }
      }
    }

    return restTemplate;
  }
}
