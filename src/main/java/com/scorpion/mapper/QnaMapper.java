package com.scorpion.mapper;

import com.scorpion.domain.QnaVO;

public interface QnaMapper {
	public int update(QnaVO qna);
	public int delete(Long qnano);
	public QnaVO read(Long qnano);
	public Integer insertSelectKey(QnaVO qna);
}
