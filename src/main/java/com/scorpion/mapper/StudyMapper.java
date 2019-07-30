package com.scorpion.mapper;

import com.scorpion.domain.StudyVO;

public interface StudyMapper {
	public int update(StudyVO study);
	public int delete(Long studyno);
	public StudyVO read(Long studyno);
	public Integer insertSelectKey(StudyVO study);
}
