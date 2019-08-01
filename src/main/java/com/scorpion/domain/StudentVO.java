package com.scorpion.domain;

import lombok.Data;

@Data
public class StudentVO {
	
	private String stuId;
	private long stuPassword;
	private String stuName;
	private String stuAddress;
	private char stuGender;
	private String stuPhonenum;
	private String stuEmail;
	private String stuLevel;
	private String auth;
 	

}
