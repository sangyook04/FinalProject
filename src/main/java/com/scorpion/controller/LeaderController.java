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
import com.scorpion.domain.LeaderVO;
import com.scorpion.service.LeaderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/leader/*")
@Log4j
@AllArgsConstructor
public class LeaderController {
	LeaderService service;
	
//	@GetMapping("/info")
//	public void info(@RequestParam("leaId") String leaderid, Model model) {
//		log.info("/get");
//		model.addAttribute("leader", service.get(leaderid));
//	}
	
	@GetMapping({"/info","/modify"})
	public void info(@RequestParam("leaId") String leaderid, Model model) {
		log.info("/get or /modify");
		
		model.addAttribute("leader", service.get(leaderid));
	}
	
	@GetMapping("/review")
	public void review() {
		
	}
	
	@PostMapping("/review")
	public void review(@RequestParam("studentid") String studentid, @RequestParam("leaderid") String leaderid) {
		
	}
	
	@GetMapping("/list")
	public void list() {
		
	}
	
	@GetMapping("/beforeJoin")
	public void beforeJoin() {
		
	}
	
	@GetMapping("/rejectJoin")
	public void rejectJoin() {
		
	}
	
	@PostMapping("/accept")
	public String accept(@RequestParam("id") String id) {
		
		return "/leader/beforeJoin";
	}
	
	@PostMapping("/reject")
	public String reject(@RequestParam("id") String id) {
		
		return "/leader/rejectJoin";
	}
	
}
