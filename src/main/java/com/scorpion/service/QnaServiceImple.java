package com.scorpion.service;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.QnaReplyVO;
import com.scorpion.domain.QnaVO;
import com.scorpion.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImple implements QnaService {

	private QnaMapper mapper;
	
	@Override
	public PageDTO getListPage(Criteria cri, Long qnaIndex) {
		return null;
	}

	/*
	 * @Override public List<QnaVO> getList(Criteria cri) { return
	 * mapper.getListWithPaging(cri); }
	 */

	@Override
	public List<QnaVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	
	//myQNA
	@Override 
	public List<QnaVO> getMyList(Criteria cri, String user_id) {
		return mapper.getMyListWithPaging(cri, user_id);
	}

	@Override
	public boolean modify(QnaVO qnavo) {
		return mapper.update(qnavo)==1;
	}
	
	@Override
	public boolean modifyAnswer(QnaVO qnavo) {
		return mapper.updateAnswer(qnavo)==1;
	}

	@Override
	public boolean remove(Long qnaIndex) {
		return mapper.delete(qnaIndex)==1;
	}

	@Override
	public QnaVO get(Long qnaIndex) {
		return mapper.read(qnaIndex);
	}

	@Override
	public void register(QnaVO qnavo) {
		mapper.insertSelectKey(qnavo);
	}

	@Override
	public int replymodify(Long qnaIndex, String qnaAnswer) {
		return 0;
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public QnaVO myget(Long qnaIndex) {
		return mapper.myread(qnaIndex);
	}
	
}
