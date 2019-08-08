package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.StudentVO;

public interface StudentService {
	public int getTotal(Criteria cri);
	public List<StudentVO> getList(Criteria cri);
	public StudentVO info(String stuid);
	public boolean modify(StudentVO student);
	public boolean stuModify(StudentVO student);
	public boolean remove(StudentVO student);
	
	public StudentVO levelGet(String stuid);
	public StudentVO get(String stuid);
	public void register(StudentVO student);
	public boolean drop(String user_id);
//	public boolean drop(String stuid);

	
	
	
}
