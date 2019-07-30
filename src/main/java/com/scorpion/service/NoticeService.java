package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.NoticeVO;

public interface NoticeService {
   public List<NoticeVO> getList(Criteria cri);
   public void register(NoticeVO notice);
   public NoticeVO get(Long notIndex);
   public boolean modify(NoticeVO notice);
   public boolean remove(Long notIndex);
   public int getTotal(Criteria cri);
}