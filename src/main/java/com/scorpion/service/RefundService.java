package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.RefundVO;

public interface RefundService {

	
	public int getTotal(Criteria cri);
	public List<RefundVO> getList(Criteria cri);
	public void register(Long payIndex);
	public RefundVO get(String leaderid);
	public boolean modify(Long refIndex);
	public boolean remove(String leaderid);
	
	
}
