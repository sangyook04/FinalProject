package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.QnaPageDTO;
import com.scorpion.domain.QnaReplyVO;
import com.scorpion.domain.QnaVO;

public class QnaServiceImple implements QnaService {

	@Override
	public QnaPageDTO getListPage(Criteria cri, Long qno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QnaVO> getList(Criteria cri, Long qno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modify(QnaVO reply) {
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
	public int replymodify(QnaReplyVO reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyremove(Long qno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public QnaReplyVO replyget(Long qno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyregister(QnaReplyVO qnavo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
