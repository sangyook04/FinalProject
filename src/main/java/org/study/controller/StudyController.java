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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/study/*")
@Log4j
@AllArgsConstructor
public class StudyController {
	
	@GetMapping("/recommend")
	public void recommend(@RequestParam("grade") String grade) {
		
	}
	
	@GetMapping("/search")
	public void search(@RequestParam("location") String location,
			@RequestParam("level") String level,
			@RequestParam("time") String time) {
		
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("studyindex") Long studyindex,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@GetMapping("/scheduleList")
	public void scheduleList(@RequestParam("id") String id) {
		
	}
	
	@PostMapping("/scheduleRemove")
	public String scheduleRemove(@RequestParam("studyindex") Long studyindex) {
		
		return "/study/scheduleList";
	}
	
	@GetMapping("/scheduleModify")
	public void scheduleModify(@RequestParam("studyindex") Long studyindex) {
		
	}
	
	@PostMapping("/scheduleModify")
	public String scheduleModify(StudyVO study, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		return "/study/scheduleList";
	}
	
	@GetMapping("/studyingList")
	public void studyingList(@RequestParam("id") String id) {
		
	}
	
	@GetMapping("/studyingStudentList")
	public void studyingStudentList(@RequestParam("studyindex") String studyindex) {
		
	}
	
	@GetMapping("/endStudyList")
	public void endStudyList(@RequestParam("id") String id) {
		
	}
	
	@GetMapping("/endStudyStudentList")
	public void endStudyStudentList(@RequestParam("studyindex") String studyindex) {
		
	}
	
	@GetMapping("/create")
	public void create() {
		
	}
	
	@PostMapping("/create")
	public String create(StudyVO study,
			   RedirectAttributes rttr) {
		
		return "/study/scheduleList";
	}
	
	@GetMapping("/zzimStudy")
	public void zzimStudy(@RequestParam("id") String id) {
		
	}
}
