package com.scorpion.service;

import com.scorpion.mapper.PwdSearchMapper;

public class PwdSearchServiceImple implements PwdSearchService {

	private PwdSearchMapper mapper;
	
	@Override
	public String search(String name, String id) {
		return mapper.search(name, id);
	}

}
