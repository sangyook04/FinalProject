package com.scorpion.service;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.QnaPageDTO;
import com.scorpion.domain.QnaReplyVO;
import com.scorpion.domain.QnaVO;



public interface QnaService {
	
	public QnaPageDTO getListPage(Criteria cri, Long qno);
	public List<QnaVO> getList(Criteria cri, Long qno); 
	public int modify(QnaVO reply);
	public int remove(Long qno);
	public QnaVO get(Long qno);
	public int register(QnaVO qnavo);
	
	public int replymodify(QnaReplyVO reply);
	public int replyremove(Long qno);
	public QnaReplyVO replyget(Long qno);
	public int replyregister(QnaReplyVO qnavo);

}
