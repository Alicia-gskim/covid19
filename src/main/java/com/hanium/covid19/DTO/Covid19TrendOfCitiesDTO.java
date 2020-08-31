package com.hanium.covid19.DTO;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Covid19TrendOfCitiesDTO {
  private Quarantine quarantine;
  private Jeju jeju;
  private Gyeongnam gyeongnam;
  private Gyeongbuk gyeongbuk;
  private Jeonnam jeonnam;
  private Jeonbuk jeonbuk;
  private Chungnam chungnam;
  private Chungbuk chungbuk;
  private Gangwon gangwon;
  private Gyeonggi gyeonggi;
  private Sejong sejong;
  private Ulsan ulsan;
  private Daejeon daejeon;
  private Gwangju gwangju;
  private Incheon incheon;
  private Daegu daegu;
  private Busan busan;
  private Seoul seoul;
  private Korea korea;
  private String resultMessage;
  private String resultCode;

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Quarantine {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Jeju {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Gyeongnam {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Gyeongbuk {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Jeonnam {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Jeonbuk {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Chungnam {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Chungbuk {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Gangwon {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Gyeonggi {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Sejong {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Ulsan {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Daejeon {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Gwangju {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Incheon {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Daegu {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Busan {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Seoul {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }

  @Data
  @JsonIgnoreProperties(ignoreUnknown = true)
  public static class Korea {
    private String newCcase;
    private String newFcase;
    private String percentage;
    private String death;
    private String recovered;
    private String totalCase;
    private String newCase;
    private String countryName;
  }
}