package com.scorpion.mapper;

import com.scorpion.domain.LevelTestVO;

public interface LevelTestMapper {
	public int update(LevelTestVO test);
	public int delete(Long testno);
	public LevelTestVO read(Long testno);
	public Integer insertSelectKey(LevelTestVO test);
}
