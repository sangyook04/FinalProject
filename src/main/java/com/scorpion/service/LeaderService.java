package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.PictureVO;


public interface LeaderService {

	public List<PictureVO> getOldFiles();
	public int getTotal(Criteria cri);
	public List<LeaderVO> getList(Criteria cri);
	public List<LeaderVO> getHoldList(Criteria cri);
	public List<LeaderVO> getRejectList(Criteria cri);
	public void register(LeaderVO leader);
	public LeaderVO get(String leaderid);
	public boolean modify(LeaderVO leader);
	public boolean remove(String leaderid);
	
}
