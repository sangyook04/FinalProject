package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.InterestStudyVO;

public interface InterestStudyService {
	public List<InterestStudyVO> getListPage(Long intIndex);
	public int remove(Long intIndex);
}
