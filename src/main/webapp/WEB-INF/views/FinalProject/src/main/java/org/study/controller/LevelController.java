package org.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/level/*")
@Log4j
@AllArgsConstructor
public class LevelController {

	@GetMapping("/leaderTest")
	public void leaderTest() {
		
	}
	
	@PostMapping("/leaderTest")
	public String leaderTest(???) {
		
	}
	
	@GetMapping("/commonTest")
	public void commonTest() {
		
	}
	
	@PostMapping("/commonTest")
	public String commonTest(???) {
		
	}
	
	@GetMapping("/list")
	public void list() {
		
	}
	
	@GetMapping("/get")
	public void get() {
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(LevelTestVO levelTest,
			RedirectAttributes rttr) {
		return "/level/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("testindex") Long testindex,
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		return "/level/list";
	}
	
	@GetMapping("/modify")
	public void modify() {
		
	}
	
	@PostMapping("/modify")
	public String modify(LevelTestVO levelTest, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		return "/level/get";
	}
}
