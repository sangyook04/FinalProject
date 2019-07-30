package com.scorpion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/common/*")
@Log4j
@AllArgsConstructor
public class CommonController {

	@GetMapping("/main")
	public void main() {
		
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("id") String id, 
			@RequestParam("pw") String pw) {
		
		return "/common/main";
	}
	
	@GetMapping("/findId")
	public void findId() {
		
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
}
