package com.scorpion.mapper;

import java.util.Date;
import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PaymentVO;

public interface PaymentMapper {
	public List<PaymentVO> getPayDateList(Criteria cri, String id, Date start, Date end);
	public List<PaymentVO> getPayIdList(Criteria cri, String id);
	public List<PaymentVO> getBeforeDepositList(Criteria cri);
	public List<PaymentVO> getAfterDepositList(Criteria cri);
	public List<PaymentVO> getPayListWithDate(Criteria cri, Date start, Date end);
	public List<PaymentVO> getPayList(Criteria cri);
	public int delete (Long payno);
	public List<PaymentVO> readList(Criteria cri);
	public Integer insertSelectKey(PaymentVO payment);
	public int update(PaymentVO payment);
	public int getTotalCount(Criteria cri);
	
}
