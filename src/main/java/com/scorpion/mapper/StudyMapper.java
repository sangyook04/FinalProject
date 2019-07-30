package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.StudyVO;

public interface StudyMapper {
	public int update(StudyVO study);
	public int delete(Long studyno);
	public StudyVO read(Long studyno);
	public Integer insertSelectKey(StudyVO study);
	public int getTotalCount(Criteria cri);
	public List<StudyVO> getListWithPaging(Criteria cri);
}
