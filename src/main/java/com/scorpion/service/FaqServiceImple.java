package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.FaqVO;
import com.scorpion.mapper.FaqMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FaqServiceImple implements FaqService {

      private FaqMapper mapper;
      
   @Override
   public boolean remove(Long faqindex) {
      
      return mapper.delete(faqindex) == 1;
      
   }

   @Override
   public boolean modify(FaqVO faqvo) {
      
      boolean modifyResult = mapper.update(faqvo) == 1;
      
      return modifyResult;
   }

   @Override
   public void register(FaqVO faqvo) {
      mapper.insertSelectKey(faqvo);
      
   }

   @Override
   public FaqVO get(Long faqIndex) {
      return mapper.read(faqIndex);
   }

   @Override
   public int getTotal(Criteria cri) {
      
      return mapper.getTotalCount(cri);
   
   }

   @Override
   public List<FaqVO> getList(Criteria cri) {
      return mapper.getListWithPaging(cri);
      
   }

   
}