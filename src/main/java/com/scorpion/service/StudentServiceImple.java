package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.StudentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class StudentServiceImple implements StudentService {

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StudentVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void join(StudentVO student) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StudentVO info(String stuid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(StudentVO student) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(String stuid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String levelGet(String stuid) {
		// TODO Auto-generated method stub
		return null;
	}

}
