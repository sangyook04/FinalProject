package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.StudentVO;

public interface StudentMapper {
	
   public int update(StudentVO student);
  public int drop(String user_id);
  // public int drop(String stuid);
   public int delete(StudentVO student);
   public StudentVO read(String stuid);
   public Integer insertSelectKey(StudentVO student);
   public int getTotalCount(Criteria cri);
   public List<StudentVO> getListWithPaging(Criteria cri);
    
}