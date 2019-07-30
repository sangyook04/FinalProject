package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.FaqVO;

public interface FaqService {

	public boolean remove(Long fno);
	public boolean modify(FaqVO faq);
	public FaqVO register(Long fno);
	public FaqVO get(Long fno);
	public int getTotal(Criteria cri);
	public List<FaqVO> getList(Criteria cri);
	
	
}
