package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.StudentVO;

public interface StudentService {
	public int getTotal(Criteria cri);
	public List<StudentVO> getList(Criteria cri);
	public void join(StudentVO student);
	public StudentVO info(String stuid);
	public boolean modify(StudentVO student);
	public boolean remove(String stuid);
	public String levelGet(String stuid);
}
