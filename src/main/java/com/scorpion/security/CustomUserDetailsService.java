package com.scorpion.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.scorpion.domain.LeaderVO;
import com.scorpion.mapper.LeaderMapper;
import com.scorpion.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Setter(onMethod_ = { @Autowired })
	private LeaderMapper leaderMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + username);
		
		LeaderVO leaVO = leaderMapper.read(username);
		
		log.warn("queried by member mapper : " + leaVO);
		
		return leaVO == null ? null : new CustomUser(leaVO);
	}


}
