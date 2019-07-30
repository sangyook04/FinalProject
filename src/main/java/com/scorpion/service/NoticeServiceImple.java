package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.NoticeVO;
import com.scorpion.mapper.NoticeMapper;

public class NoticeServiceImple implements NoticeService {
   private NoticeMapper mapper;

   @Override
   public List<NoticeVO> getList(Criteria cri) {
      
      return null;
   }

   @Override
   public void register(NoticeVO notice) {
      
      
   }

   @Override
   public NoticeVO get(Long notIndex) {
      
      return null;
   }

   @Override
   public boolean modify(NoticeVO notice) {
      
      return false;
   }

   @Override
   public boolean remove(Long notIndex) {
      
      return false;
   }

   @Override
   public int getTotal(Criteria cri) {
      
      return 0;
   }

}