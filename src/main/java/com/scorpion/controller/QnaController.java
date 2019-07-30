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
import org.study.domain.QnaVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@Log4j
@AllArgsConstructor
public class QnaController {
	
	@GetMapping("/myQna")
	public void myQna(@RequestParam("id") Long id) {
		
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("qnano") Long qnano,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("qnano") Long qnano,
            @ModelAttribute("cri") Criteria cri,
	 		     RedirectAttributes rttr) {
		
		return "/qna/list";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("qnano") Long qnano,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@PostMapping("/modify")
	public String modify(QnaVO qna, 
			@ModelAttribute("cri") Criteria cri, 
			RedirectAttributes rttr) {
		
		return "/qna/get";
	}
	
	@GetMapping("/list")
	public void list() {
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(QnaVO qna,
			   RedirectAttributes rttr) {
		
		return "/qna/list";
	}
	
	@GetMapping("/answer")
	public void answer(@RequestParam("qnano") Long qnano,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@PostMapping("/answer")
	public String answer(@RequestParam("qnano") Long qnano,
			@RequestParam("answer") String answer,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
		return "/qna/get";
	}
}
