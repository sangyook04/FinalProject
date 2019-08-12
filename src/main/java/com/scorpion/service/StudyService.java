package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderReviewVO;
import com.scorpion.domain.PictureVO;
import com.scorpion.domain.StudentVO;
import com.scorpion.domain.StudyVO;


public interface StudyService {
	public int getSTotal(Criteria cri, String leaId);	//시작예정스터디 총 개수
	public int getTotal(Criteria cri, String leaId);	//진행중스터디 총 개수
	public int getETotal(Criteria cri, String leaId);	//종료된스터디 총 개수
	
	public int stgetSTotal(Criteria cri, String stuId);	//시작예정스터디 총 개수
	public int stgetTotal(Criteria cri, String stuId);	//진행중스터디 총 개수
	public int stgetETotal(Criteria cri, String stuId);	//종료된스터디 총 개수
	
	
	public List<StudyVO> getScheduleList(Criteria cri, String leaId); //시작예정 스터디 리스트
	public List<StudyVO> getStudyingList(Criteria cri, String leaId); //진행중 스터디 리스트
	public List<StudyVO> getEndList(Criteria cri, String leaId); //종료된 스터디 리스트
	public List<StudyVO> getRecommendList(String level, Criteria cri); //추천 스터디 리스트
	
	
	public List<StudyVO> stgetScheduleList(Criteria cri, String stuId); //시작예정 스터디 리스트
	public List<StudyVO> stgetStudyingList(Criteria cri, String stuId); //진행중 스터디 리스트
	public List<StudyVO> stgetEndList(Criteria cri, String stuId); //종료된 스터디 리스트
	
	
	public void create(StudyVO study);
	public StudyVO get(Long studyIndex);
	public boolean modify(StudyVO studyvo);
	public boolean remove(Long studyIndex);
	public LeaderReviewVO getlist(Long studyIndex);
	
	public List<StudentVO> getStudentList(Long studyIndex); //학생 목록
	public List<PictureVO> getimage(String stuId);
	
	
	
	
	
	
}
