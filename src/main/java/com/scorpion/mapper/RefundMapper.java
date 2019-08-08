package com.scorpion.mapper;

import java.util.List;


import com.scorpion.domain.Criteria;
import com.scorpion.domain.RefundVO;

public interface RefundMapper {
	public int update(Long refIndex);
	public int delete(String leaderid);
	public RefundVO read(String leaderid);
	public Integer insertSelectKey(Long payIndex);
	public int getTotalCount(Criteria cri);
	public List<RefundVO> getListWithPaging(Criteria cri);
	public List<RefundVO> getList();
	public void insert(Long payIndex);
}
