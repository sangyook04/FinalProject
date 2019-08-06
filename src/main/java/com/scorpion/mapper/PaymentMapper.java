package com.scorpion.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PaymentVO;

public interface PaymentMapper {
	public List<PaymentVO> getPayIdListPaging(@Param("cri") Criteria cri, @Param("id") String id);
	public List<PaymentVO> getPayIdList(@Param("cri") Criteria cri, @Param("id") String id);
	public List<PaymentVO> getRefundIdList(@Param("cri") Criteria cri, @Param("id") String id);
	public List<PaymentVO> getPayList(Criteria cri);
	public int delete (Long payindex);
	public List<PaymentVO> beforeList(Criteria cri);
	public List<PaymentVO> afterList(Criteria cri);
	public Integer insertSelectKey(PaymentVO payment);
	public int update(PaymentVO payment);
	public int getTotalCount(Criteria cri);
	public int deposit(Long payindex);
	public int getTotalCountJoin(@Param("cri") Criteria cri, @Param("id") String id);
}
