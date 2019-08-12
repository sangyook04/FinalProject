package com.scorpion.domain;

import lombok.Data;

@Data
public class StudyVO {
	
      private long studyIndex;
      private String studyName;
      private String leaId;
      private String studyPlace;
      private String studyLevel;
      private long studyPrice;
      private String studyIntroduce;
      private String studyStartdate;
      private String studyEnddate;
      private String studySTime;
      private String studyETime;
      private String studyState;
      private long studyPeople;
      private PictureVO picturevo;
      private LeaderVO leaderVO;
      private LeaderReviewVO leaderReviewVO;
}