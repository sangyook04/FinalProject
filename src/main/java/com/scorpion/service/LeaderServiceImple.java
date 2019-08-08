package com.scorpion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.PictureVO;
import com.scorpion.mapper.LeaderMapper;
import com.scorpion.mapper.PictureMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class LeaderServiceImple implements LeaderService {
	
	@Setter(onMethod_ = @Autowired)
	private LeaderMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PictureMapper picturemapper; 
	
	@Setter (onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<LeaderVO> getList(Criteria cri) {
		log.info("list........" + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<LeaderVO> getHoldList(Criteria cri) {
		log.info("hold list........" + cri);
		
		return mapper.getHoldListWithPaging(cri);
	}

	@Override
	public List<LeaderVO> getRejectList(Criteria cri) {
		log.info("Regect list........" + cri);
		
		return mapper.getRejectListWithPaging(cri);
	}

	@Override
	public void register(LeaderVO leader) {
		log.info("register......" + leader);
		
		String encPassword = pwencoder.encode(leader.getLeaPassword());
		leader.setLeaPassword(encPassword);
		
		mapper.insertSelectKey(leader);
		
		if(leader.getPictureList() == null || leader.getPictureList().size() <= 0 ) {
			return;
		}
		
		leader.getPictureList().forEach(attach -> { attach.setLeaId(leader.getLeaId());
			picturemapper.insertLeader(attach);
		});
	}

	@Override
	public LeaderVO get(String leaderid) {
		log.info("get......" + leaderid);
		
		return mapper.read(leaderid);
	}

	@Override
	public boolean modify(LeaderVO leader) {
		log.info("modify......" + leader);
		
		String encPassword = pwencoder.encode(leader.getLeaPassword());
		leader.setLeaPassword(encPassword);
		
		return mapper.update(leader) == 1;
	}

	@Override
	public boolean remove(String leaderid) {
		
		return false;
	}

	@Override
	public List<PictureVO> getOldFiles() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean refusal(String leaderid) {
		return mapper.updateRefusal(leaderid) == 1;
	}

	@Override
	public boolean leaderUpdate(String leaderid) {
		return mapper.updateLeader(leaderid) == 1;
	}

	@Override
	public List<PictureVO> getPictureList(String leaderid) {
		log.info("get Picture List by leaderId " + leaderid);
		return picturemapper.findByLeaId(leaderid);
	}

	@Override
	public LeaderVO findId(String leaName, String leaPhonenum) {
		
		return mapper.findId(leaName, leaPhonenum);
	}

}
