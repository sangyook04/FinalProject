package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.InterestStudyVO;
import com.scorpion.domain.LeaderVO;

public interface InterestStudyMapper {
	public int getTotalCount(Criteria cri, String id);
	public List<LeaderVO> getListWithPaging(Criteria cri, String id);
	public int delete(Long intno);
}
