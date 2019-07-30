package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PictureVO;
import com.scorpion.domain.StudentVO;
import com.scorpion.domain.StudyVO;


public interface StudyService {
	public int getScheduleTotal(String leaderid, String state, Criteria cri);	//시작예정스터디 총 개수
	public int getStudyingTotal(String leaderid, String state, Criteria cri);	//진행중스터디 총 개수
	public int getEndTotal(String leaderid, String state, Criteria cri);	//종료된스터디 총 개수
	public List<StudyVO> getScheduleList(String leaderid, String state, Criteria cri); //시작예정 스터디 리스트
	public List<StudyVO> getStudyingList(String leaderid, String state, Criteria cri); //진행중 스터디 리스트
	public List<StudyVO> getEndList(String leaderid, String state, Criteria cri); //종료된 스터디 리스트
	public List<StudyVO> getRecommendList(String level, Criteria cri); //추천 스터디 리스트
	public void create(StudyVO study);
	public StudyVO get(Long studyno);
	public boolean modify(StudyVO study);
	public boolean remove(Long studyno);
	public PictureVO getImage(Long studyno); //스터디 사진
	public List<StudentVO> getStudentList(String stuid, Long studyno, Criteria cri); //학생 목록
	
}
