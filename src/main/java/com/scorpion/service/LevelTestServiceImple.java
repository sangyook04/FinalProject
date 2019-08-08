package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LevelTestVO;
import com.scorpion.mapper.LevelTestMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LevelTestServiceImple implements LevelTestService {
   private LevelTestMapper mapper;

   @Override
   public List<LevelTestVO> getList(Criteria cri) {
      
      return mapper.getListWithPaging(cri);
//	   return mapper.getList();
   }

   @Override
   public void register(LevelTestVO levelTest) {
	   mapper.insertSelectKey(levelTest);
      
   }

   @Override
   public LevelTestVO get(Long testIndex) {
      
      return mapper.read(testIndex);
   }

   @Override
   public boolean modify(LevelTestVO levelTest) {
      
      return mapper.update(levelTest)==1;
   }

   @Override
   public boolean remove(Long testIndex) {
      
      return mapper.delete(testIndex)==1;
   }

   @Override
   public int getTotal(Criteria cri) {
      
      return mapper.getTotalCount(cri);
   }

	@Override
	public List<LevelTestVO> getRandomExam() {
		return mapper.getRandomExam();
	}

	@Override
	public List<LevelTestVO> getRandom20Exam() {
		return mapper.getRandom20Exam();
	}

}