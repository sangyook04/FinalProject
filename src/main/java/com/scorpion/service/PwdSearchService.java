package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.LeaderVO;

public interface PwdSearchService {
	
	public List<LeaderVO> search(String name, String id); 
	
}
