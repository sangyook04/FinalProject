package com.scorpion.mapper;

import com.scorpion.domain.LeaderVO;

public interface LeaderMapper {
	public int update(LeaderVO leader);
	public int delete(String leaderid);
	public LeaderVO read(String leaderid);
	public Integer insertSelectKey(LeaderVO leader);
}
