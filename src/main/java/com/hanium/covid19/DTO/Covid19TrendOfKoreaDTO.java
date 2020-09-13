package com.hanium.covid19.DTO;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 국내 동향(http://api.corona-19.kr/korea/) 호출 결과 매핑 DTO
 * 프론트에서 이 객채를 리턴 받음
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class Covid19TrendOfKoreaDTO {
  private String resultCode; // 응답코드, 정상 0, 비정상 401
  @JsonProperty("TotalCase")
  private String TotalCase; // 국내 확진자 수
  @JsonProperty("TotalRecovered")
  private String TotalRecovered; // 국내 완지자 수
  @JsonProperty("TotalDeath")
  private String totalDeath; // 국내 사망자 수
  @JsonProperty("NowCase")
  private String nowCase; // 국내 격리자 수
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
  @JsonProperty("TotalChecking")
  private String TotalChecking; // 총 완료된 검사 수
  @JsonProperty("TodayRecovered")
  private String TodayRecovered; // 오늘 하루 완치자 수
  @JsonProperty("TodayDeath")
  private String TodayDeath; // 오늘 하루 사망자 수
  @JsonProperty("TotalCaseBefore")
  private String TotalCaseBefore; // 전날 대비 환자수
  private String updateTime; // 정보 업데이트 기준(코로나바이러스감염증-19 국내 발생현황 (4.5. 00시 기준))
  private String resultMessage; // API 처리결과(정상처리: (정상 처리되었습니다.) / 오류(권한이 없거나 잘못된 키 입니다. "github.com/dhlife09/Corona-19-API"에 방문하세요.))
  
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getTotalCase() {
		return TotalCase;
	}
	public void setTotalCase(String totalCase) {
		TotalCase = totalCase;
	}
	public String getTotalRecovered() {
		return TotalRecovered;
	}
	public void setTotalRecovered(String totalRecovered) {
		TotalRecovered = totalRecovered;
	}
	public String getTotalDeath() {
		return totalDeath;
	}
	public void setTotalDeath(String totalDeath) {
		this.totalDeath = totalDeath;
	}
	public String getNowCase() {
		return nowCase;
	}
	public void setNowCase(String nowCase) {
		this.nowCase = nowCase;
	}
	public String getCity1n() {
		return city1n;
	}
	public void setCity1n(String city1n) {
		this.city1n = city1n;
	}
	public String getCity2n() {
		return city2n;
	}
	public void setCity2n(String city2n) {
		this.city2n = city2n;
	}
	public String getCity3n() {
		return city3n;
	}
	public void setCity3n(String city3n) {
		this.city3n = city3n;
	}
	public String getCity4n() {
		return city4n;
	}
	public void setCity4n(String city4n) {
		this.city4n = city4n;
	}
	public String getCity5n() {
		return city5n;
	}
	public void setCity5n(String city5n) {
		this.city5n = city5n;
	}
	public String getCity1p() {
		return city1p;
	}
	public void setCity1p(String city1p) {
		this.city1p = city1p;
	}
	public String getCity2p() {
		return city2p;
	}
	public void setCity2p(String city2p) {
		this.city2p = city2p;
	}
	public String getCity3p() {
		return city3p;
	}
	public void setCity3p(String city3p) {
		this.city3p = city3p;
	}
	public String getCity4p() {
		return city4p;
	}
	public void setCity4p(String city4p) {
		this.city4p = city4p;
	}
	public String getCity5p() {
		return city5p;
	}
	public void setCity5p(String city5p) {
		this.city5p = city5p;
	}
	public double getRecoveredPercentage() {
		return recoveredPercentage;
	}
	public void setRecoveredPercentage(double recoveredPercentage) {
		this.recoveredPercentage = recoveredPercentage;
	}
	public double getDeathPercentage() {
		return deathPercentage;
	}
	public void setDeathPercentage(double deathPercentage) {
		this.deathPercentage = deathPercentage;
	}
	public String getCheckingCounter() {
		return checkingCounter;
	}
	public void setCheckingCounter(String checkingCounter) {
		this.checkingCounter = checkingCounter;
	}
	public String getCheckingPercentage() {
		return checkingPercentage;
	}
	public void setCheckingPercentage(String checkingPercentage) {
		this.checkingPercentage = checkingPercentage;
	}
	public String getCaseCount() {
		return caseCount;
	}
	public void setCaseCount(String caseCount) {
		this.caseCount = caseCount;
	}
	public String getCasePercentage() {
		return casePercentage;
	}
	public void setCasePercentage(String casePercentage) {
		this.casePercentage = casePercentage;
	}
	public String getNotcaseCount() {
		return notcaseCount;
	}
	public void setNotcaseCount(String notcaseCount) {
		this.notcaseCount = notcaseCount;
	}
	public String getNotcasePercentage() {
		return notcasePercentage;
	}
	public void setNotcasePercentage(String notcasePercentage) {
		this.notcasePercentage = notcasePercentage;
	}
	public String getTotalChecking() {
		return TotalChecking;
	}
	public void setTotalChecking(String totalChecking) {
		TotalChecking = totalChecking;
	}
	public String getTodayRecovered() {
		return TodayRecovered;
	}
	public void setTodayRecovered(String todayRecovered) {
		TodayRecovered = todayRecovered;
	}
	public String getTodayDeath() {
		return TodayDeath;
	}
	public void setTodayDeath(String todayDeath) {
		TodayDeath = todayDeath;
	}
	public String getTotalCaseBefore() {
		return TotalCaseBefore;
	}
	public void setTotalCaseBefore(String totalCaseBefore) {
		TotalCaseBefore = totalCaseBefore;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getResultMessage() {
		return resultMessage;
	}
	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}
}
