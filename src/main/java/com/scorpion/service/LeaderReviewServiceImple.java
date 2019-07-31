package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.LeaderReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LeaderReviewServiceImple implements LeaderReviewService {

	@Override
	public List<LeaderReviewVO> getListPage(Long revIndex) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(LeaderReviewVO LeaderReview) {
		// TODO Auto-generated method stub
		
	}

}
