package com.scorpion.mapper;

import com.scorpion.domain.FaqVO;

public interface FaqMapper {
	public int update(FaqVO faq);
	public int delete(Long faqno);
	public FaqVO read(Long faqno);
	public Integer insertSelectKey(FaqVO faq);
}
