package com.scorpion.mapper;

import com.scorpion.domain.NoticeVO;

public interface NoticeMapper {
	public int update(NoticeVO notice);
	public int delete(Long noticeno);
	public NoticeVO read(Long noticeno);
	public Integer insertSelectKey(NoticeVO notice);
}
