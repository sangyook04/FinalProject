package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.FaqVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FaqServiceImple implements FaqService {

	@Override
	public boolean remove(Long fno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(FaqVO faq) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public FaqVO register(FaqVO faq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FaqVO get(Long fno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FaqVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
