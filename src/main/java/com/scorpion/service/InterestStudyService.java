package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.InterestStudyVO;

public interface InterestStudyService {
	public List<InterestStudyVO> getListPage(Criteria cri, String id);
	public int remove(Long intIndex);
}
