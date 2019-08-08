package com.scorpion.service;

import java.util.Date;
import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PaymentVO;
import com.scorpion.domain.StudyVO;

public interface PaymentService {
	
//	public PaymentVO get(Long payIndex);
//	public PaymentVO get(String payDate);
	public List<PaymentVO> getIncomeList(Criteria cri, String id);
	public List<PaymentVO> getMyMoneyList(Criteria cri, String id);
	public List<PaymentVO> getMyRefundList(Criteria cri, String id);
	public boolean remove(Long payindex);
	public boolean refund(Long payindex);
	public List<PaymentVO> getPaymentList(Criteria cri);
	public List<PaymentVO> getPaymentListWithDate(Criteria cri, Date start, Date end);
	public List<PaymentVO> getBeforeDeposit(Criteria cri);
	public List<PaymentVO> getAfterDeposit(Criteria cri);
	public boolean modify(PaymentVO payment);
	public void pay(PaymentVO payment);
	public PaymentVO get(Long payindex);
	public int getTotal(Criteria cri);
	public int getTotalJoin(Criteria cri, String id);
	public boolean deposit(Long payindex);

}
