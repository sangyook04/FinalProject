package com.scorpion.domain;

import lombok.Data;

@Data
public class RefundVO {
	
	private Long refIndex;
	private Long payIndex;
	private String refRequest;
	private String refSuccess;
	private String refState;

}
