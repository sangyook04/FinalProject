package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LevelTestVO;
import com.scorpion.mapper.LevelTestMapper;

public class LevelTestServiceImple implements LevelTestService {
   private LevelTestMapper mapper;

   @Override
   public List<LevelTestVO> getList(Criteria cri) {
      
      return null;
   }

   @Override
   public void register(LevelTestVO levelTest) {
      
      
   }

   @Override
   public LevelTestVO get(Long testIndex) {
      
      return null;
   }

   @Override
   public boolean modify(LevelTestVO levelTest) {
      
      return false;
   }

   @Override
   public boolean remove(Long testIndex) {
      
      return false;
   }

   @Override
   public int getTotal(Criteria cri) {
      
      return 0;
   }

}