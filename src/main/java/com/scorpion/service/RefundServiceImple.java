package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.RefundVO;
import com.scorpion.mapper.RefundMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class RefundServiceImple implements RefundService {

	
	private RefundMapper mapper;
	
	@Override
	public int getTotal(Criteria cri) {
		
		return 0;
	}

	@Override
	public List<RefundVO> getList(Criteria cri) {
		
		return null;
	}

	@Override
	public List<RefundVO> getList() {
		
		return null;
	}

	@Override
	public void register(RefundVO refund) {
		
		
	}

	@Override
	public RefundVO get(String leaderid) {
		
		return null;
	}

	@Override
	public boolean modify(RefundVO refund) {
		
		return false;
	}

	@Override
	public boolean remove(String leaderid) {
		
		return false;
	}

}
