package com.scorpion.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.PwdDTO;
import com.scorpion.mapper.LeaderMapper;
import com.scorpion.mapper.LeaderReviewMapper;
import com.scorpion.mapper.PwdSearchMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PwdSearchServiceImple implements PwdSearchService {
	
	@Setter(onMethod_ = @Autowired)
	private PwdSearchMapper mapper;

	@Setter (onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Override
	public boolean check(String name, String id, String phonenumber) {
		int i = 0;
		i= mapper.check(name, id, phonenumber) + mapper.check2(name, id, phonenumber);
		System.out.println("i : " + i);
		return i > 0;
	}

	@Override
	public boolean modify(String pwd, String pwd2, String id) {
		boolean res = false;
		String encPwd = pwencoder.encode(pwd);
		
		if(mapper.update1(encPwd, pwd2, id)==1 || mapper.update2(encPwd, pwd2, id) == 1) {
			res = true;
		}
		return res;
	}


}
