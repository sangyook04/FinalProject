package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PictureVO;
import com.scorpion.domain.StudyVO;

public interface StudyMapper {
	public int update(StudyVO study);
	public int delete(Long studyno);
	public StudyVO read(Long studyno);
	public Integer insertSelectKey(StudyVO study);
	public int getScheduleTotalCount(String id, String state, Criteria cri);
	public int getStudyingTotalCount(String id, String state, Criteria cri);
	public int getEndTotalCount(String id, String state, Criteria cri);
	public List<StudyVO> getScheduleList(String id, String state, Criteria cri); //시작 예정 스터디 리스트
	public List<StudyVO> getStudyingList(String id, String state, Criteria cri); //진행 중 스터디 리스트
	public List<StudyVO> getEndList(String id, String state, Criteria cri); //종료된 스터디 리스트
	public List<StudyVO> getRecommendList(String level, Criteria cri); //추천 스터디 리스트
}
