package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.NoticeVO;

public interface NoticeMapper {
	public int update(NoticeVO notice);
	public int delete(Long noticeno);
	public NoticeVO read(Long noticeno);
	public Integer insertSelectKey(NoticeVO notice);
	public int getTotalCount(Criteria cri);
	public List<NoticeVO> getListWithPaging(Criteria cri);
	public List<NoticeVO> getList();
}
