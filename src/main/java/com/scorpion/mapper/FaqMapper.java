package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.FaqVO;


public interface FaqMapper {
   public int update(FaqVO faqvo);
   public int delete(Long faqindex);
   public FaqVO read(Long faqIndex);
   public Integer insertSelectKey(FaqVO faqvo);
   public List<FaqVO> getList();
   public int getTotalCount(Criteria cri);
   public List<FaqVO> getListWithPaging(Criteria cri);
}