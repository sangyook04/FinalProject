package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LevelTestVO;

public interface LevelTestMapper {
	public int update(LevelTestVO test);
	public int delete(Long testno);
	public LevelTestVO read(Long testno);
	public Integer insertSelectKey(LevelTestVO test);
	public int getTotalCount(Criteria cri);
	public List<LevelTestVO> getListWithPaging(Criteria cri);
	public List<LevelTestVO> getList();
}
