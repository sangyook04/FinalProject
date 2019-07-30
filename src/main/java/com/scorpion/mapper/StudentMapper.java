package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.StudentVO;

public interface StudentMapper {
   public int update(StudentVO student);
   public int delete(String stuid);
   public StudentVO read(String stuid);
   public Integer insertSelectKey(StudentVO student);
   public int getTotalCount(Criteria cri);
   public List<StudentVO> getListWithPaging(Criteria cri);
   public String getLevel(String stuid);
}