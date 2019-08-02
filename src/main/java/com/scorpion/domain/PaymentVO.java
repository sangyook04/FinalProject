package com.scorpion.domain;

import java.util.List;

import lombok.Data;

@Data
public class PaymentVO {
	private Long payIndex;
	private String stuId;
	private String leaId;
	private Long studyIndex;
	private String paySendDate;
	private String payDate;
	private Long payMoney;
	
	private LeaderVO leader;
}
