package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.QnaVO;

public interface QnaMapper {
	public int reply(Long qnano, String answer);
	public int update(QnaVO qna);
	public int delete(Long qnano);
	public QnaVO read(Long qnano);
	public Integer insertSelectKey(QnaVO qna);
	public int getTotalCount(Criteria cri);
	public List<QnaVO> getListWithPaging(Criteria cri);
	public List<QnaVO> getMyListWithPaging(Criteria cri, String id);
}
