package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.LeaderReviewVO;
import com.scorpion.mapper.LeaderReviewMapper;
import com.scorpion.mapper.StudentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LeaderReviewServiceImple implements LeaderReviewService {

	private LeaderReviewMapper mapper;
	
	
	@Override
	public List<LeaderReviewVO> getListPage(Long revIndex) {
		
		return null;
	}

	@Override
	public void register(LeaderReviewVO leaderReview) {
		log.info("LeaderReview register......" + leaderReview);
		
		mapper.insertSelectKey(leaderReview);
		
	}

}
