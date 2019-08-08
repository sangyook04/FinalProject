package com.scorpion.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderReviewVO;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.StudentVO;
import com.scorpion.service.LeaderReviewService;
import com.scorpion.service.StudentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/student/*")
@Log4j
@AllArgsConstructor
public class StudentController {

		private StudentService service;
		private LeaderReviewService revservice;
		
		
		
		
		
		@GetMapping("/studentDrop")
		public void drop(@RequestParam("stuId") String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
			model.addAttribute("stuMyInfo", service.info(stuId));
	
		}
		
		
		
		
		@PostMapping("/studentDrop") 
		public String drop(StudentVO student, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, Model model) {
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    String user_id = auth.getName();
		    
		    model.addAttribute("list", service.drop(user_id));
//			
//			if(service.drop(student)) {
//				rttr.addAttribute("result","success");
//			}
		
			 return "redirect:/common/login";
		}
		 
		
//		
//		@GetMapping("/studentDrop")
//		public void  remove(@RequestParam("stuId") String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
//			model.addAttribute("stuMyInfo", service.info(stuId));
//	
//		}
//		
//		
//		
//		
//		@PostMapping("/studentDrop") 
//		public String remove(StudentVO student, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//			if(service.remove(student)) {
//				rttr.addAttribute("result","success");
//			}
//		
//			 return "redirect:/common/main";
//		}
		 
		
		
		
		
		
		   @PreAuthorize("isAuthenticated()")
		   @GetMapping("/studentComment")
		   public void review() {
		      
		   }
		   
		   
		   @PreAuthorize("isAuthenticated()")
		   @PostMapping("/studentComment")
		   public String review(LeaderReviewVO review, RedirectAttributes rttr) {
		      
		      log.info("review register : " + review);
		      
		      revservice.register(review);
		      rttr.addFlashAttribute("review", review.getRevIndex());
		      return "redirect:/common/main";
		      
		      
		   }
		
	
	
	/*
	 * @GetMapping("/studentJoin") public void join() {
	 * 
	 * }
	 * 
	 * @PostMapping("/join") public String join(StudentVO student) {
	 * service.register(student); return "/common/login";
	 * 
	 * }
	 */
		
		
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
		 
			
		
		
	    @PreAuthorize("isAuthenticated()")
		@GetMapping({"/adminStudentInfo","/adminStudentMod"})
		public void get(@RequestParam("stuId") String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
			model.addAttribute("stuInfo", service.info(stuId));
		}

		
		
		
		@PreAuthorize("isAuthenticated()")
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
		@PreAuthorize("isAuthenticated()")
		@GetMapping({"/studentLevelGet"})
		public void levelget(@RequestParam("stuId") String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
			model.addAttribute("stuLevel", service.info(stuId));
			
		}

		
	    @PreAuthorize("isAuthenticated()")
		@GetMapping("/adminStudentList")
		public void list(Model model, Criteria cri) {
			
			model.addAttribute("studentList", service.getList(cri));
			model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
		}
}
