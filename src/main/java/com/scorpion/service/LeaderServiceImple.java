package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.PictureVO;
import com.scorpion.mapper.LeaderMapper;
import com.scorpion.mapper.PictureMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LeaderServiceImple implements LeaderService {
	private LeaderMapper mapper;
	private PictureMapper picturemapper; 
	
	@Override
	public int getTotal(Criteria cri) {
		
		return 0;
	}

	@Override
	public List<LeaderVO> getList(Criteria cri) {
		
		return null;
	}

	@Override
	public List<LeaderVO> getHoldList(Criteria cri) {
		
		return null;
	}

	@Override
	public List<LeaderVO> getRejectList(Criteria cri) {
		
		return null;
	}

	@Override
	public void register(LeaderVO leader) {
		
		
	}

	@Override
	public LeaderVO get(String leaderid) {
		
		return null;
	}

	@Override
	public boolean modify(LeaderVO leader) {
		
		return false;
	}

	@Override
	public boolean remove(String leaderid) {
		
		return false;
	}

	@Override
	public List<PictureVO> getOldFiles() {
		// TODO Auto-generated method stub
		return null;
	}

}
