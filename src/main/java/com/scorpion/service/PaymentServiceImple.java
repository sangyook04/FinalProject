package com.scorpion.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PaymentVO;
import com.scorpion.mapper.LeaderMapper;
import com.scorpion.mapper.PaymentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PaymentServiceImple implements PaymentService {

	private PaymentMapper mapper;
	
	@Override
	public PaymentVO get(Long payIndex) {
		
		return null;
	}

	@Override
	public List<PaymentVO> getIncomeList(Criteria cri, String id, Date start, Date end) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PaymentVO> getMyMoneyList(Criteria cri, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(Long payno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<PaymentVO> getPaymentList(Criteria cri) {
		
		return mapper.getPayList(cri);
	}

	@Override
	public List<PaymentVO> getPaymentListWithDate(Criteria cri, Date start, Date end) {
		return mapper.getPayListWithDate(cri, start, end);
	}
	
	@Override
	public List<PaymentVO> getBeforeDeposit(Criteria cri) {
//		return mapper.getBeforeDepositList(cri);
		return mapper.beforeList(cri);
	}

	@Override
	public List<PaymentVO> getAfterDeposit(Criteria cri) {
		return mapper.afterList(cri);
	}

	@Override
	public boolean modify(PaymentVO payment) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void pay(PaymentVO payment) {
		mapper.insertSelectKey(payment);
		
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public boolean deposit(Long payindex) {
		return mapper.deposit(payindex) == 1;
	}


}
