package com.scorpion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
public class LeaderServiceImple implements LeaderService {
	
	@Setter(onMethod_ = @Autowired)
	private LeaderMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PictureMapper picturemapper; 
	
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
		
		mapper.insertSelectKey(leader);
		
		if(leader.getPictureList() == null || leader.getPictureList().size() <= 0 ) {
			return;
		}
		
		leader.getPictureList().forEach(attach -> {
			attach.setLeaId(leader.getLeaId());
			picturemapper.insert(attach);
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

}
