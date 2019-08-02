package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.QnaReplyVO;
import com.scorpion.domain.QnaVO;



public interface QnaService {
	
	public PageDTO getListPage(Criteria cri, Long qnaIndex);
	public List<QnaVO> getList(Criteria cri); 
	public List<QnaVO> getMyList(Criteria cri, String id); //myQna id는 나중에 수정
	public boolean modify(QnaVO qnavo);
	public boolean remove(Long qnaIndex);
	public QnaVO get(Long qnaIndex);
	public void register(QnaVO qnavo);
	
	
	public int replymodify(Long qnaIndex, String qnaAnswer);
	public int getTotal(Criteria cri);

}
