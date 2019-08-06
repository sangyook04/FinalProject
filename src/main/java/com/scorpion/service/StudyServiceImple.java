package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PictureVO;
import com.scorpion.domain.StudentVO;
import com.scorpion.domain.StudyVO;
import com.scorpion.mapper.StudyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StudyServiceImple implements StudyService {

	private StudyMapper mapper;
	
	@Override
	public int getScheduleTotal(String leaderid, String state, Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getStudyingTotal(String leaderid, String state, Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getEndTotal(String leaderid, String state, Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StudyVO> getScheduleList(String leaderid, String state, Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StudyVO> getStudyingList(String leaderid, String state, Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StudyVO> getEndList(String leaderid, String state, Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StudyVO> getRecommendList(String level, Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void create(StudyVO study) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StudyVO get(Long studyno) {
		return mapper.read(studyno);
	}

	@Override
	public boolean modify(StudyVO study) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long studyno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PictureVO getImage(Long studyno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StudentVO> getStudentList(String stuid, Long studyno, Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

}
