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
import com.scorpion.domain.LevelTestVO;
import com.scorpion.service.LevelTestService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/level/*")
@Log4j
@AllArgsConstructor
public class LevelController {

	private LevelTestService service;
	
	@GetMapping("/leaderTest")
	public void leaderTest() {
		
	}
	
	@PostMapping("/leaderTest")
	public String leaderTest(@RequestParam("testno") Long testno,
			@RequestParam("dap") String dap) {
		
		return null;
	}
	
	@GetMapping("/commonTest")
	public void commonTest() {
		
	}
	
	@PostMapping("/commonTest")
	public String commonTest(@RequestParam("testno") Long testno,
			@RequestParam("dap") String dap) {
		
		return null;
	}
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
	}
	
	@GetMapping("/get")
	public void get(/*@RequestParam("testno") Long testno,
			@ModelAttribute("cri") Criteria cri,
	        Model model*/) {
//		service.get(testno);
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(LevelTestVO levelTest,
			RedirectAttributes rttr) {
		
		service.register(levelTest);
		
		rttr.addFlashAttribute("result", levelTest.getTestIndex());
		return "redirect:/level/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("testno") Long testno,
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		service.remove(testno);
		return "/level/list";
	}
	
	@GetMapping("/modify")
	public void modify() {
		
	}
	
	@PostMapping("/modify")
	public String modify(LevelTestVO levelTest, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		service.modify(levelTest);
		return "/level/get";
	}
}
