package com.scorpion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.study.domain.Criteria;
import org.study.domain.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@Log4j
@AllArgsConstructor
public class NoticeController {

	@GetMapping("/list")
	public void list() {
		
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("noticeno") Long noticeno,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(NoticeVO notice,
			   RedirectAttributes rttr) {
		
		return "/notice/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("noticeno") Long noticeno,
            @ModelAttribute("cri") Criteria cri,
	 		     RedirectAttributes rttr) {
		
		return "/notice/list";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("noticeno") Long noticeno,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@PostMapping("/modify")
	public String modify(NoticeVO notice, 
			@ModelAttribute("cri") Criteria cri, 
			RedirectAttributes rttr) {
		
		return "/notice/get";
	}
}
