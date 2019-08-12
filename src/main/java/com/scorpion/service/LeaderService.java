package com.scorpion.service;

import java.util.ArrayList;
import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.PictureVO;


public interface LeaderService {

	public List<PictureVO> getPictureList(String leaderid);
	public List<PictureVO> getOldFiles();
	public int getTotalA(Criteria cri);
	public int getTotalR(Criteria cri);
	public int getTotalB(Criteria cri);
	public List<LeaderVO> getList(Criteria cri);
	public List<LeaderVO> getHoldList(Criteria cri);
	public List<LeaderVO> getRejectList(Criteria cri);
	public void register(LeaderVO leader);
	public LeaderVO get(String leaderid);
	public boolean modify(LeaderVO leader);
	public boolean refusal(String leaderid);
	public boolean leaderUpdate(String leaderid);
	public boolean remove(String leaderid);
	public List<LeaderVO> findId(String name, String phonenum);
	public boolean drop(String leaId);

	public int idcheck(String stuid);
	public int idcheck2(String stuid);
	
}
