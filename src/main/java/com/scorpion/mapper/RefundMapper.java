package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.RefundVO;

public interface RefundMapper {
	public int update(RefundVO refund);
	public int delete(String leaderid);
	public RefundVO read(String leaderid);
	public Integer insertSelectKey(RefundVO refund);
	public int getTotalCount(Criteria cri);
	public List<RefundVO> getListWithPaging(Criteria cri);
	public List<RefundVO> getList();
}
