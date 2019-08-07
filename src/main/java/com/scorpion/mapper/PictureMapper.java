package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.PictureVO;

public interface PictureMapper {
   public List<PictureVO> getOldFiles();
   public void deleteAllStudy(Long studyIndex);
   public void deleteAllLeader(String leaId);
   public void insertLeader(PictureVO vo);
   public void delete(String uuid);
   public List<PictureVO> findByLeaId(String leaId);
   public List<PictureVO> findByStudyIndex(Long StudyIndex);
}