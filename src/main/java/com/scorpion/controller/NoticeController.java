package com.scorpion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.NoticeVO;
import com.scorpion.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@Log4j
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		service.getList(cri);
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("noticeno") Long noticeno,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		service.get(noticeno);
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(NoticeVO notice,
			   RedirectAttributes rttr) {
		service.register(notice);
		return "/notice/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("noticeno") Long noticeno,
            @ModelAttribute("cri") Criteria cri,
	 		     RedirectAttributes rttr) {
		service.remove(noticeno);
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
		service.modify(notice);
		return "/notice/get";
	}
}
