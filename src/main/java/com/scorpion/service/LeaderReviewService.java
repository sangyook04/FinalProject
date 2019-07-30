package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.LeaderReviewVO;

public interface LeaderReviewService {
	public List<LeaderReviewVO> getListPage(Long revIndex);
	public void register(LeaderReviewVO LeaderReview);
}
