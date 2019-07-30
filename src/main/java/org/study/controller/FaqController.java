package org.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.study.domain.Criteria;
import org.study.domain.FaqVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/faq/*")
@Log4j
@AllArgsConstructor
public class FaqController {

	@GetMapping("/view")
	public void view() {
		
	}
	
	@GetMapping("/list")
	public void list() {
		
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("faqno") Long faqno,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(FaqVO faq,
			   RedirectAttributes rttr) {
		
		return "/faq/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("faqno") Long faqno,
            @ModelAttribute("cri") Criteria cri,
	 		     RedirectAttributes rttr) {
		return "/faq/list";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("faqno") Long faqno,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@PostMapping("/modify")
	public String modify(FaqVO faq, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "/faq/get";
	}
}
