package com.scorpion.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;

public interface LeaderMapper {
	public LeaderVO read(String leaderid);
	
	public List<LeaderVO> findId(@Param("name") String name, @Param("phonenum") String phonenum);
	public int update(LeaderVO leader);
	public int updateRefusal(String leaderid);
	public int updateLeader(String leaderid);
	public int delete(String leaderid);
	public Integer insertSelectKey(LeaderVO leader);
	public int getTotalCountA(Criteria cri); //리더 목록
	public int getTotalCountR(Criteria cri); //가입거부 리더 목록
	public int getTotalCountB(Criteria cri); //가입대기 리더 목록
	public List<LeaderVO> getListWithPaging(Criteria cri);
	public int join(LeaderVO leader); //가입상태 수정 메소드
	public List<LeaderVO> getHoldListWithPaging(Criteria cri); //가입승인대기 페이징출력 메소드
	public List<LeaderVO> getRejectListWithPaging(Criteria cri); //가입거부대기 페이징출력 메소드
	public int drop(String user_id);
	public int idcheck(String stuid);
	public int idcheck2(String stuid);
}