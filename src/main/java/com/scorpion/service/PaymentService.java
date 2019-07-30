package com.scorpion.service;

import com.scorpion.domain.PaymentVO;

public interface PaymentService {
	
	public PaymentVO get(Long payIndex);
	public PaymentVO get(String payDate);
	

}
