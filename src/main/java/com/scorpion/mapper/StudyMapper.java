package com.scorpion.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderReviewVO;
import com.scorpion.domain.PictureVO;
import com.scorpion.domain.StudentVO;
import com.scorpion.domain.StudyVO;

public interface StudyMapper {
	public int update(StudyVO studyvo);
	public int delete(Long studyIndex);
	public StudyVO read(Long studyIndex);
	public Integer insertSelectKey(StudyVO study);
	public List<StudyVO> getRecommendList( String level,  Criteria cri); //추천 스터디 리스트
	public List<StudentVO> getStudentList(Long studyIndex);
	public List<PictureVO> readimage(String leaId);
	public LeaderReviewVO listread(Long studyIndex);
	
	
	public int getSTotalCount(@Param("cri") Criteria cri, @Param("leaId") String leaId);
	public List<StudyVO> getSStudyListWithPaging(@Param("cri") Criteria cri, @Param("leaId") String leaId); //시작 예정 스터디 리스트
	
	public int getTotalCount(@Param("cri") Criteria cri, @Param("leaId") String leaId);
	public List<StudyVO> getStudyingListWithPaging(@Param("cri") Criteria cri, @Param("leaId") String leaId); //진행 중 스터디 리스트
	
	public int getETotalCount(@Param("cri") Criteria cri, @Param("leaId") String leaId);
	public List<StudyVO> getEStudyListWithPaging(@Param("cri") Criteria cri, @Param("leaId") String leaId); //종료 스터디 리스트


	public int stgetSTotalCount(@Param("cri") Criteria cri, @Param("stuId") String stuId);
	public List<StudyVO> stgetSStudyListWithPaging(@Param("cri") Criteria cri, @Param("stuId") String stuId); //시작 예정 스터디 리스트
	
	public int stgetTotalCount(@Param("cri") Criteria cri, @Param("stuId") String stuId);
	public List<StudyVO> stgetStudyingListWithPaging(@Param("cri") Criteria cri, @Param("stuId") String stuId); //진행 중 스터디 리스트
	
	public int stgetETotalCount(@Param("cri") Criteria cri, @Param("stuId") String stuId);
	public List<StudyVO> stgetEStudyListWithPaging(@Param("cri") Criteria cri, @Param("stuId") String stuId); //종료 스터디 리스트



}
