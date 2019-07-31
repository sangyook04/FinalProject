package com.scorpion.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.QnaReplyVO;
import com.scorpion.domain.QnaVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImple implements QnaService {

	@Override
	public PageDTO getListPage(Criteria cri, Long qno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QnaVO> getMyList(Criteria cri, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modify(QnaVO qnavo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int remove(Long qno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QnaVO get(Long qno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int register(QnaVO qnavo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replymodify(Long qno, String answer) {
		// TODO Auto-generated method stub
		return 0;
	}


}
