package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.QnaReplyVO;
import com.scorpion.domain.QnaVO;



public interface QnaService {
	
	public PageDTO getListPage(Criteria cri, Long qno);
	public List<QnaVO> getList(Criteria cri); 
	public List<QnaVO> getMyList(Criteria cri, String id); //myQna
	public int modify(QnaVO qnavo);
	public int remove(Long qno);
	public QnaVO get(Long qno);
	public int register(QnaVO qnavo);
	
	public int replymodify(Long qno, String answer);

}
