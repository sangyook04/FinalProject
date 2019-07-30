package com.scorpion.mapper;

import java.util.Date;
import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PaymentVO;

public interface PaymentMapper {
//	public PaymentVO read(Long payIndex);
//	public PaymentVO read(String payDate);
	public List<PaymentVO> getPayDateList(Criteria cri, String id, Date start, Date end);
	public List<PaymentVO> getPayIdList(Criteria cri, String id);
	public List<PaymentVO> getPayDepositList(Criteria cri, String deposit);
	public List<PaymentVO> getPayList(Criteria cri);
	public int delete (Long payno);
	public PaymentVO read(Long payno);
	public Integer insertSelectKey(PaymentVO payment);
	public int update(PaymentVO payment);
	
}
