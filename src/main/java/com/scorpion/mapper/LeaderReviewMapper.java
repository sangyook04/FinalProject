package com.scorpion.mapper;

import com.scorpion.domain.LeaderReviewVO;

public interface LeaderReviewMapper {
   public Integer insertSelectKey(LeaderReviewVO leaderReview);
   public LeaderReviewVO read(Long revIndex);
}