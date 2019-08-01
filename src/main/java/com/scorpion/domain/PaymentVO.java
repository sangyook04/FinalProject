package com.scorpion.domain;

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
}
