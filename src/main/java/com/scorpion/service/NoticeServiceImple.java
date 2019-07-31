package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.NoticeVO;
import com.scorpion.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
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