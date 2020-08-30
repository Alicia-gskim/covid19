package com.hanium.covid19.adapter;

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
  private String recoveredPercentage; // 국내 완치율
  private String deathPercentage; // 국내 사망률
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

  public void setResultCode(String resultCode) {
    this.resultCode = resultCode;
  }

  public void setTotalCase(String totalCase) {
    TotalCase = totalCase;
  }

  public void setTotalRecovered(String totalRecovered) {
    TotalRecovered = totalRecovered;
  }

  public void setTotalDeath(String totalDeath) {
    TotalDeath = totalDeath;
  }

  public void setNowCase(String nowCase) {
    NowCase = nowCase;
  }

  public void setCity1n(String city1n) {
    this.city1n = city1n;
  }

  public void setCity2n(String city2n) {
    this.city2n = city2n;
  }

  public void setCity3n(String city3n) {
    this.city3n = city3n;
  }

  public void setCity4n(String city4n) {
    this.city4n = city4n;
  }

  public void setCity5n(String city5n) {
    this.city5n = city5n;
  }

  public void setCity1p(String city1p) {
    this.city1p = city1p;
  }

  public void setCity2p(String city2p) {
    this.city2p = city2p;
  }

  public void setCity3p(String city3p) {
    this.city3p = city3p;
  }

  public void setCity4p(String city4p) {
    this.city4p = city4p;
  }

  public void setCity5p(String city5p) {
    this.city5p = city5p;
  }

  public void setRecoveredPercentage(String recoveredPercentage) {
    this.recoveredPercentage = recoveredPercentage;
  }

  public void setDeathPercentage(String deathPercentage) {
    this.deathPercentage = deathPercentage;
  }

  public void setCheckingCounter(String checkingCounter) {
    this.checkingCounter = checkingCounter;
  }

  public void setCheckingPercentage(String checkingPercentage) {
    this.checkingPercentage = checkingPercentage;
  }

  public void setCaseCount(String caseCount) {
    this.caseCount = caseCount;
  }

  public void setCasePercentage(String casePercentage) {
    this.casePercentage = casePercentage;
  }

  public void setNotcaseCount(String notcaseCount) {
    this.notcaseCount = notcaseCount;
  }

  public void setNotcasePercentage(String notcasePercentage) {
    this.notcasePercentage = notcasePercentage;
  }

  public void setTotalChecking(String totalChecking) {
    TotalChecking = totalChecking;
  }

  public void setTodayRecovered(String todayRecovered) {
    TodayRecovered = todayRecovered;
  }

  public void setTodayDeath(String todayDeath) {
    TodayDeath = todayDeath;
  }

  public void setTotalCaseBefore(String totalCaseBefore) {
    TotalCaseBefore = totalCaseBefore;
  }

  public void setUpdateTime(String updateTime) {
    this.updateTime = updateTime;
  }

  public void setResultMessage(String resultMessage) {
    this.resultMessage = resultMessage;
  }
}
