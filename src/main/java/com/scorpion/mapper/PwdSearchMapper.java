package com.scorpion.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.scorpion.domain.LeaderVO;

public interface PwdSearchMapper {

	public Integer check(@Param("name") String name, @Param("id") String id, @Param("phonenumber") String phonenumber);
	public Integer check2(@Param("name") String name, @Param("id") String id, @Param("phonenumber") String phonenumber);
	public int update1(@Param("pwd") String pwd, @Param("pwd2") String pwd2, @Param("id") String id);
	public int update2(@Param("pwd") String pwd, @Param("pwd2") String pwd2, @Param("id") String id);
	
}
