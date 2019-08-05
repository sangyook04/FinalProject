package com.scorpion.domain;

import java.util.List;

import lombok.Data;

@Data
public class LeaderVO {
   private String leaId;
   private String leaPassword;
   private String leaName;
   private String leaAddress;
   private char leaGender;
   private String leaPhonenum;
   private String leaEmail;
   private long leaScore;
   private long leaAccount;
   private String leaBank;
   private String leaIntroduce;
   private String leaImage;
   private String leaState;
   private String auth;
   
   private List<PictureVO> pictureList;
}