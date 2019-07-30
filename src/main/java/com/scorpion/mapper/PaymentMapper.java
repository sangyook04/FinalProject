package com.scorpion.mapper;

import com.scorpion.domain.PaymentVO;

public interface PaymentMapper {
	public PaymentVO read(Long payIndex);
	public PaymentVO read(String payDate);
}
