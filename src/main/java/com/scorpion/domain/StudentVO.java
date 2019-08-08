package com.scorpion.domain;

import java.util.List;

import lombok.Data;

@Data
public class StudentVO {
	
	private String stuId;
	private String stuPassword;
	private String stuName;
	private String stuAddress;
	private String stuGender;
	private String stuPhonenum;
	private String stuEmail;
	private String stuEmail2;
	private String stuLevel;	
	private boolean enabled;
	
	private List<AuthorityVO> authList;

	
 	

}
