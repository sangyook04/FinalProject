package com.scorpion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
<<<<<<< HEAD

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
import com.scorpion.service.LeaderReviewService;
import com.scorpion.service.LeaderService;
=======
import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
>>>>>>> 60a9ce7a528fb33695d665998c20801d3dbbe5e0

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/leader/*")
@Log4j
@AllArgsConstructor
public class LeaderController {
	
	private LeaderService service;
	private LeaderReviewService reviewService;
	
	@GetMapping("/join")
	public void join(@RequestParam("leaScore") int leascore) {
		
	}
	
	@PostMapping("/join")
	public String join(LeaderVO leadervo) {
		
		return "/common/main";
	}
	
	@GetMapping("/info")
	public void info(@RequestParam("leaId") String leaid, Model model) {
		
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("leaId") String leaid, Model model) {
		
	}
	
	@PostMapping("/modify")
	public String modify(LeaderVO leadervo /*@ModelAttribute("cri") Criteria cri 확인필요 */) {
		
		return "/leader/info";
	}
	
	@GetMapping("/review")
	public void review(@RequestParam("leaId") String leaid) {
		
	}
	
	@PostMapping("/review")
	public String review(@RequestParam("stuId") String stuId, @RequestParam("leaId") String leaId) {
		
		return "/study/endStudyList";
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
