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
import com.scorpion.domain.QnaVO;
import com.scorpion.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@Log4j
@AllArgsConstructor
public class QnaController {
	
	private QnaService service;
	
	@GetMapping("/myQna")
	public void myQna(Model model, Criteria cri, @RequestParam("id") String id) {
		service.getMyList(cri, id);
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("qnano") Long qnano,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		service.get(qnano);
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("qnano") Long qnano,
            @ModelAttribute("cri") Criteria cri,
	 		     RedirectAttributes rttr) {
		
		service.remove(qnano);
		
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
		service.modify(qna);
		return "/qna/get";
	}
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		service.getList(cri);
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(QnaVO qna,
			   RedirectAttributes rttr) {
		service.register(qna);
		return "/qna/list";
	}
	
	@GetMapping("/answer")
	public void answer(@RequestParam("qnano") Long qnano,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@PostMapping("/answer")
	public String answer(@RequestParam("qnano") Long qnano,
			@RequestParam("answer") String answer) {
		service.replymodify(qnano, answer);
		return "/qna/get";
	}
}
