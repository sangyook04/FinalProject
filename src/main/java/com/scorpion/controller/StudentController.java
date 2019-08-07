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
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.StudentVO;
import com.scorpion.service.StudentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/student/*")
@Log4j
@AllArgsConstructor
public class StudentController {

		private StudentService service;
	
		@GetMapping("/studentJoin")
		public void join() {
			
		}
		
		@PostMapping("/join")
		public String join(StudentVO student) {
			service.register(student);
			return "/common/login";
			
		}
		
	
		@GetMapping({"/studentMyInfo","/studentInfoMod"})
		public void info(@RequestParam("stuId") String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
			model.addAttribute("stuMyInfo", service.info(stuId));
	
		}
		

		@PostMapping("/studentInfoMod") 
		public String stuModify(StudentVO student, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			if(service.stuModify(student)) {
				rttr.addAttribute("result","success");
			}
		
			return "redirect:/student/studentMyInfo?stuId="+student.getStuId();
		}
		 
			
		
		
		
		@GetMapping({"/adminStudentInfo","/adminStudentMod"})
		public void get(@RequestParam("stuId") String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
			model.addAttribute("stuInfo", service.info(stuId));
		}

		
		
		
	
		@PostMapping("/adminStudentMod")
		public String modify(StudentVO student, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			if(service.modify(student)) {
				rttr.addAttribute("result","success");
			}
			//return "redirect:/student/adminStudentInfo";
			return "redirect:/student/adminStudentInfo?stuId="+student.getStuId();
		}
		
//		@GetMapping("/studentLevelGet")
//		public void levelget(@RequestParam("stuId") String stuId) {
//			service.levelGet(stuId);
//		}
		
		@GetMapping({"/studentLevelGet"})
		public void levelget(@RequestParam("stuId") String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
			model.addAttribute("stuLevel", service.info(stuId));
			
		}

		
		
		@GetMapping("/adminStudentList")
		public void list(Model model, Criteria cri) {
			
			model.addAttribute("studentList", service.getList(cri));
			model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
		}
}
