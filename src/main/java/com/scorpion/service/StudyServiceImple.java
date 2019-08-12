package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderReviewVO;
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
	public int getSTotal(Criteria cri, String memberId) {
		
		return mapper.getSTotalCount(cri, memberId);
	}

	@Override
	public int getTotal(Criteria cri, String memberId) {
		
		return mapper.getTotalCount(cri, memberId);
	}

	@Override
	public int getETotal(Criteria cri, String leaId) {
		return mapper.getETotalCount(cri, leaId);
	}

	@Override
	public List<StudyVO> getScheduleList(Criteria cri, String memberId) {
		
		return mapper.getSStudyListWithPaging(cri, memberId);
	}

	@Override
	public List<StudyVO> getStudyingList(Criteria cri, String memberId) {
		
		 return mapper.getStudyingListWithPaging(cri, memberId);
	}

	@Override
	public List<StudyVO> getEndList(Criteria cri, String leaId) {
		
		return mapper.getEStudyListWithPaging(cri, leaId);
	}

	@Override
	public List<StudyVO> getRecommendList(String level, Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void create(StudyVO study) {
		mapper.insertSelectKey(study);
		
	}

	@Override
	public StudyVO get(Long studyIndex) {
		
		return mapper.read(studyIndex);
	}

	@Override
	public boolean modify(StudyVO studyvo) {
		boolean result = mapper.update(studyvo) == 1;
		return result;
	}

	@Override
	public boolean remove(Long studyIndex) {
		
		return mapper.delete(studyIndex) == 1;
	}


	@Override
	public List<StudentVO> getStudentList(Long studyIndex) {
		
		return mapper.getStudentList(studyIndex);
	}

	@Override
	public List<StudyVO> stgetScheduleList(Criteria cri, String stuId) {
	
		return mapper.stgetSStudyListWithPaging(cri, stuId);
	}

	@Override
	public List<StudyVO> stgetStudyingList(Criteria cri, String stuId) {
		
		return mapper.stgetStudyingListWithPaging(cri, stuId);
	}

	@Override
	public List<StudyVO> stgetEndList(Criteria cri, String stuId) {
		
		return mapper.stgetEStudyListWithPaging(cri, stuId);
	}

	@Override
	public int stgetSTotal(Criteria cri, String stuId) {
		return mapper.stgetSTotalCount(cri, stuId);
	}

	@Override
	public int stgetTotal(Criteria cri, String stuId) {
		
		return mapper.stgetTotalCount(cri, stuId);
	}

	@Override
	public int stgetETotal(Criteria cri, String stuId) {
	
		return mapper.stgetETotalCount(cri, stuId);
	}

	@Override
	public List<PictureVO> getimage(String leaId) {
		
		return mapper.readimage(leaId);
	}

	@Override
	public LeaderReviewVO getlist(Long studyIndex) {
		
		return mapper.listread(studyIndex);
	}

}
