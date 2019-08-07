package com.scorpion.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.scorpion.domain.LeaderVO;

import lombok.Getter;

@Getter
public class CustomUser extends User {

	private static final long serivalVersionUID = 1L;
	private LeaderVO leader;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(LeaderVO leaVO) {
		super(leaVO.getLeaId(), leaVO.getLeaPassword(), leaVO.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.leader = leaVO;
	}
}
