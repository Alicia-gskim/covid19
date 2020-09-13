package com.hanium.covid19.DTO;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
//import lombok.Data;

/**
 * 시도별 동향(http://api.corona-19.kr/korea/contry/new/) 호출 결과 매핑 DTO
 * 프론트에서 이 객채를 리턴 받음
 */
//@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Covid19TrendOfCitiesDTO {
  private Items quarantine; // 검역
  private Items jeju; // 제주
  private Items gyeongnam; // 경남
  private Items gyeongbuk; // 경북
  private Items jeonnam; // 전남
  private Items jeonbuk; // 전북
  private Items chungnam; // 충남
  private Items chungbuk; // 충북
  private Items gangwon; // 강원
  private Items gyeonggi; //경
  private Items sejong; // 세종
  private Items ulsan; // 울산
  private Items daejeon; // 대전
  private Items gwangju; // 광주
  private Items incheon; // 인천
  private Items daegu; // 대구
  private Items busan; // 부산
  private Items seoul; // 서울
  private Items korea; // 한국
  private String resultMessage; // 정상처리: (정상 처리되었습니다.) / 오류(권한이 없거나 잘못된 키 입니다. "github.com/dhlife09/Corona-19-API"에 방문하세요.)
  private String resultCode; // 응답코드, 정상 0, 비정상 401

  //@Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public class Items {
    private String newCcase; // 전일 대비 증감 - 지역 발생
    private String newFcase; // 전일 대비 증감 - 해외 유입
    private String percentage; // 발생률
    private String death; // 사망자
    private String recovered; // 완치자 수
    private String totalCase; // 확진자 수
    private String newCase; // 신규확진자 수
    private String countryName; // 시도명(지역명)

    public String getNewCcase() {
      return newCcase;
    }

    public String getNewFcase() {
      return newFcase;
    }

    public String getPercentage() {
      return percentage;
    }

    public String getDeath() {
      return death;
    }

    public String getRecovered() {
      return recovered;
    }

    public String getTotalCase() {
      return totalCase;
    }

    public String getNewCase() {
      return newCase;
    }

    public String getCountryName() {
      return countryName;
    }
  }

  public Items getQuarantine() {
    return quarantine;
  }

  public Items getJeju() {
    return jeju;
  }

  public Items getGyeongnam() {
    return gyeongnam;
  }

  public Items getGyeongbuk() {
    return gyeongbuk;
  }

  public Items getJeonnam() {
    return jeonnam;
  }

  public Items getJeonbuk() {
    return jeonbuk;
  }

  public Items getChungnam() {
    return chungnam;
  }

  public Items getChungbuk() {
    return chungbuk;
  }

  public Items getGangwon() {
    return gangwon;
  }

  public Items getGyeonggi() {
    return gyeonggi;
  }

  public Items getSejong() {
    return sejong;
  }

  public Items getUlsan() {
    return ulsan;
  }

  public Items getDaejeon() {
    return daejeon;
  }

  public Items getGwangju() {
    return gwangju;
  }

  public Items getIncheon() {
    return incheon;
  }

  public Items getDaegu() {
    return daegu;
  }

  public Items getBusan() {
    return busan;
  }

  public Items getSeoul() {
    return seoul;
  }

  public Items getKorea() {
    return korea;
  }

  public String getResultMessage() {
    return resultMessage;
  }

  public String getResultCode() {
    return resultCode;
  }
}