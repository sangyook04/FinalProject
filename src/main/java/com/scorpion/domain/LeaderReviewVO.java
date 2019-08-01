package com.scorpion.domain;

import lombok.Data;

@Data
public class LeaderReviewVO {
   private long revIndex;
   private String leaId;
   private String stuId;
   private long revGrade;
   private String revComment;
}