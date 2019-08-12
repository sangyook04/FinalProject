package com.scorpion.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.scorpion.domain.LeaderVO;


public interface PwdSearchService {


	public boolean check(String name, String id, String phonenumber);

	public boolean modify(String pwd, String pwd2, String id);
	

	
}
