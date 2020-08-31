package com.hanium.covid19.DTO;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Covid19TrendOfKoreaDTO {
  private String resultCode; // 응답코드, 정상 0, 비정상 401
  private String TotalCase; // 국내 확진자 수
  private String TotalRecovered; // 국내 완지자 수
  private String TotalDeath; // 국내 사망자 수
  private String NowCase; // 국내 격리자 수
  // 시도별 확진자 현황에서 n번째로 많은 확진자가 있는 시도의 이름
  private String city1n;
  private String city2n;
  private String city3n;
  private String city4n;
  private String city5n;
  //시도별 확지자 현황에서 n번째로 많은 확진작 있는 시도의 퍼센트율
  private String city1p;
  private String city2p;
  private String city3p;
  private String city4p;
  private String city5p;
  private double recoveredPercentage; // 국내 완치율
  private double deathPercentage; // 국내 사망률
  private String checkingCounter; // 국내 검사중인 수
  private String checkingPercentage; // 국내 검사중인 퍼센트
  private String caseCount; // 국내검사 양성 수
  private String casePercentage; // 국내검사 양성 퍼센트
  private String notcaseCount; // 국내검사 음성 수
  private String notcasePercentage; // 국내검사 음성 퍼센
  private String TotalChecking; // 총 완료된 검사 수
  private String TodayRecovered; // 오늘 하루 완치자 수
  private String TodayDeath; // 오늘 하루 사망자 수
  private String TotalCaseBefore; // 전날 대비 환자수
  private String updateTime; // 정보 업데이트 기준(코로나바이러스감염증-19 국내 발생현황 (4.5. 00시 기준))
  private String resultMessage; // API 처리결과(정상처리: (정상 처리되었습니다.) / 오류(권한이 없거나 잘못된 키 입니다. "github.com/dhlife09/Corona-19-API"에 방문하세요.))
}
