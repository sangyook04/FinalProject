package com.scorpion.mapper;





import com.scorpion.domain.QnaReplyVO;

public interface QnaReplyMapper {
		
	public int update(QnaReplyVO reply);
	public int delete(Long bno);
	public QnaReplyVO read(Long bno);
	public int insert(QnaReplyVO vo);
}
