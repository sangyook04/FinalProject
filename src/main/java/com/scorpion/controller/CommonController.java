package com.scorpion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.StudentVO;
import com.scorpion.service.LeaderService;
import com.scorpion.service.StudentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/common/*")
@Log4j
@AllArgsConstructor
public class CommonController {
	StudentService stuservice;
	LeaderService service;
	

	@GetMapping("/main")
	public String main() {
		return "/index";
	}
	
	@GetMapping("/login")
	public void login(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("msg", "아이디 또는 비밀번호를 다시 확인해주세요.");
		}
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("id") String id, 
			@RequestParam("pw") String pw) {
		
		return "/common/main";
	}
	
	@GetMapping("/findId")
	public void findId(String error, String logout, Model model) {
		if(error != null){
			model.addAttribute("msg", "입력하신 정보와 일치하는 회원이 없습니다.");
		}
	}
	
	@PostMapping("/findId")
	public String findId(@RequestParam("id") String id, 
			@RequestParam("tel") String tel) {
		
		return "/common/login";
	}
	
	@GetMapping("/findPw")
	public void findPw() {
		
	}
	
	@PostMapping("/findPw")
	public String findPw(@RequestParam("name") String name, 
			@RequestParam("id") String id, 
			@RequestParam("tel") String tel, 
			@RequestParam("pw") String pw) {
		
		return "/common/login";
	}
	
	@GetMapping("/disable")
	public void disable() {
		
	}
	
	@PostMapping("/disable")
	public String disable(@RequestParam("id") String id) {
		
		return "/common/main";
	}
	
	@GetMapping("/leaderJoin")
	public void leaderJoin() {
		
	}
	
	@PostMapping("/leaderJoin")
	public String leaderJoin(LeaderVO leader, RedirectAttributes rttr) {
		log.info("register : " + leader);
		
		if(leader.getPictureList() != null) {
			leader.getPictureList().forEach(attach -> log.info(attach));
		}
		
		
		
		service.register(leader);
		
		return "redirect:/common/main";
	}
	
	
	@GetMapping("/studentJoin")
	public void studentJoin() {
		
	}
	
	@PostMapping("/studentJoin")
	public String studentJoin(StudentVO student, RedirectAttributes rttr) {

		log.info("register : " + student);

		
			
		stuservice.register(student);

		
		
		return "redirect:/common/main";
	}
	
}
