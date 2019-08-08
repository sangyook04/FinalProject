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
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<RefundVO> getList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public void register(Long payIndex) {
//		mapper.insertSelectKey(payIndex);
		mapper.insert(payIndex);
	}

	@Override
	public RefundVO get(String leaderid) {
		
		return null;
	}

	@Override
	public boolean modify(Long refIndex) {
		
		return mapper.update(refIndex) == 1;
	}

	@Override
	public boolean remove(String leaderid) {
		
		return false;
	}

}
