package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.StudentVO;
import com.scorpion.mapper.StudentMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StudentServiceImple implements StudentService {
	 private StudentMapper mapper;
	
	 @Override
	public int getTotal(Criteria cri) {
		 return mapper.getTotalCount(cri);
	}

	@Override
	public List<StudentVO> getList(Criteria cri) {
		  return mapper.getListWithPaging(cri);
		   // return mapper.getList();
	}

	@Override
	public void join(StudentVO student) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StudentVO info(String stuid) {
		 return mapper.read(stuid);
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
