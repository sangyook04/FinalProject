package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.PictureVO;


public interface LeaderService {

	public List<PictureVO> getPictureList(String leaderid);
	public List<PictureVO> getOldFiles();
	public int getTotal(Criteria cri);
	public List<LeaderVO> getList(Criteria cri);
	public List<LeaderVO> getHoldList(Criteria cri);
	public List<LeaderVO> getRejectList(Criteria cri);
	public void register(LeaderVO leader);
	public LeaderVO get(String leaderid);
	public boolean modify(LeaderVO leader);
	public boolean refusal(String leaderid);
	public boolean leaderUpdate(String leaderid);
	public boolean remove(String leaderid);
	public LeaderVO findId(String leaName, String leaPhonenum);
	
}
