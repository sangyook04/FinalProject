package com.scorpion.service;

import java.util.Date;
import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PaymentVO;
import com.scorpion.domain.StudyVO;

public interface PaymentService {
	
//	public PaymentVO get(Long payIndex);
//	public PaymentVO get(String payDate);
	public List<PaymentVO> getIncomeList(Criteria cri, String id, Date start, Date end);
	public List<PaymentVO> getMyMoneyList(Criteria cri, String id);
	public boolean remove(Long payno);
	public List<PaymentVO> getPaymentList(Criteria cri);
	public List<PaymentVO> getBeforeDeposit(Criteria cri, String deposit);
	public List<PaymentVO> getAfterDeposit(Criteria cri, String deposit);
	public boolean modify(PaymentVO payment);
	public void pay(PaymentVO payment);
	public PaymentVO get(Long payno);

}
