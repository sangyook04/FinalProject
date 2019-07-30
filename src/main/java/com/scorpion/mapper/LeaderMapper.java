package com.scorpion.mapper;

import java.util.List;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;

public interface LeaderMapper {
	public int update(LeaderVO leader);
	public int delete(String leaderid);
	public LeaderVO read(String leaderid);
	public Integer insertSelectKey(LeaderVO leader);
	public int getTotalCount(Criteria cri);
	public List<LeaderVO> getListWithPaging(Criteria cri);
	public int join(LeaderVO leader); //가입상태 수정 메소드
	public List<LeaderVO> getHoldListWithPaging(Criteria cri); //가입승인대기 페이징출력 메소드
	public List<LeaderVO> getRejectListWithPaging(Criteria cri); //가입거부대기 페이징출력 메소드
}
