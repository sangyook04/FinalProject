package com.scorpion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.study.domain.Criteria;
import org.study.domain.StudentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/student/*")
@Log4j
@AllArgsConstructor
public class StudentController {

	
	
		@GetMapping("/join")
		public void join() {
			
		}
		
		@PostMapping("/join")
		public String join(StudentVO student) {
			
			return "/common/login";
		}
		
		@GetMapping("/info")
		public void info(@RequestParam("id") String id) {
			
		}
		
		@GetMapping("/modify")
		public void modify() {
			
		}
		
		@PostMapping("/modify")
		public String modify(StudentVO student, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			
			return "/student/info";
		}
		
		@GetMapping("/levelget")
		public void levelget(@RequestParam("id") String id) {
			
		}
		
		@GetMapping("/list")
		public void list() {
			
		}
}
