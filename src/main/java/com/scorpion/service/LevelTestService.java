package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LevelTestVO;

public interface LevelTestService {
   public List<LevelTestVO> getRandomExam();
   public List<LevelTestVO> getRandom20Exam();
   public List<LevelTestVO> getList(Criteria cri);
   public void register(LevelTestVO levelTest);
   public LevelTestVO get(Long testIndex);
   public boolean modify(LevelTestVO levelTest);
   public boolean remove(Long testIndex);
   public int getTotal(Criteria cri);
}