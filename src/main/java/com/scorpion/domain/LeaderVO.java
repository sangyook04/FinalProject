package com.scorpion.domain;

import java.util.List;

import lombok.Data;

@Data
public class LeaderVO{
   private String leaId;
   private String leaPassword;
   private String leaName;
   private String leaImage;
   private String leaAddress;
   private char leaGender;
   private String leaPhonenum;
   private String leaEmail;
   private String leaEmail2;
   private long leaScore;
   private long leaAccount;
   private String leaBank;
   private String leaIntroduce;
   private String leaState;
   private String leaReqDate;
   private boolean enabled;

   private List<StudentVO> studentList;
   private List<AuthorityVO> authList;
   private List<PictureVO> pictureList;

}