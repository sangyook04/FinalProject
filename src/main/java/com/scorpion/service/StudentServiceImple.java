package com.scorpion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.StudentVO;
import com.scorpion.mapper.LeaderMapper;
import com.scorpion.mapper.StudentMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class StudentServiceImple implements StudentService {
	
	

	@Setter(onMethod_ = @Autowired) 
	private StudentMapper mapper;
	
	@Setter (onMethod_ = @Autowired)
	  private PasswordEncoder pwencoder;
	
	 @Override
	public int getTotal(Criteria cri) {
		 return mapper.getTotalCount(cri);
	}

	 
	 @Override
		public boolean setLevel(String stuid, String level) {
			return mapper.setLevel(stuid, level) == 1;
		}
	 
	@Override
	public List<StudentVO> getList(Criteria cri) {
		  return mapper.getListWithPaging(cri);
		  
	}


	@Override
	public StudentVO info(String stuid) {
		 return mapper.read(stuid);
	}

	@Override
	public boolean modify(StudentVO student) {
		 return mapper.update(student)==1;
	}

	@Override
	public boolean remove(StudentVO student) {
		
		 return mapper.delete(student)==1;
	}

	@Override
	public StudentVO levelGet(String stuid) {
		
		 return mapper.read(stuid);
	
	}

	@Override
	public StudentVO get(String stuid) {
		
		return null;
	}

	@Override
	public void register(StudentVO student) {
		
		log.info("student register......" + student);
	
	    String encPassword = pwencoder.encode(student.getStuPassword());
	    student.setStuPassword(encPassword);
		
		mapper.insertSelectKey(student);
	}

	@Override
	public boolean stuModify(StudentVO student) {
		
		 String encPassword = pwencoder.encode(student.getStuPassword());
		student.setStuPassword(encPassword);
		
		 return mapper.update(student)==1;
	}

	@Override
	public boolean drop(String user_id) {
		 return mapper.drop(user_id)==1;
	}

	@Override
	public int idcheck(String stuid) {
	
		/* return mapper.idcheck(stuid); */
		return mapper.idcheck(stuid);

}

	@Override
	public int idcheck2(String stuid) {
		// TODO Auto-generated method stub
		return mapper.idcheck2(stuid);
	}
	

	
}
