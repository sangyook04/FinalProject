package com.scorpion.mapper;

import com.scorpion.domain.StudentVO;

public interface StudentMapper {
	public int update(StudentVO student);
	public int delete(String studentid);
	public StudentVO read(String studentid);
	public Integer insertSelectKey(StudentVO student);
}
