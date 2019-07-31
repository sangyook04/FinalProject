package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.InterestStudyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class InterestStudyServiceImple implements InterestStudyService {

	@Override
	public List<InterestStudyVO> getListPage(Criteria cri, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int remove(Long intIndex) {
		// TODO Auto-generated method stub
		return 0;
	}



}
