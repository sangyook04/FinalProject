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
import com.scorpion.domain.StudyVO;
import com.scorpion.service.InterestStudyService;
import com.scorpion.service.StudyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/study/*")
@Log4j
@AllArgsConstructor
public class StudyController {
	
	private StudyService service;
	private InterestStudyService interservice;
	@GetMapping("/recommend")
	public void recommend(/*@RequestParam("level") String level, @ModelAttribute("cri") Criteria cri*/) {
		//service.getRecommendList(level, cri);
	}
	
	@GetMapping("/search")
	public void search(/*@RequestParam("location") String location,
			@RequestParam("level") String level,
			@RequestParam("time") String time*/) {
		
	}
	
	@GetMapping("/get")
	public void get(/*@RequestParam("studyno") Long studyno,
			@ModelAttribute("cri") Criteria cri,
	        Model model*/) {
		//service.get(studyno);
	}
	
	@GetMapping("/scheduleList")
	public void scheduleList(/*@RequestParam("id") String id, @RequestParam("state") String state,
			 @ModelAttribute("cri") Criteria cri*/) {
		//service.getScheduleList(id, state, cri);
	}
	
	@PostMapping("/scheduleRemove")
	public String scheduleRemove(@RequestParam("studyno") Long studyno) {
		service.remove(studyno);
		return "/study/scheduleList";
	}
	
	@GetMapping("/scheduleModify")
	public void scheduleModify(/*@RequestParam("studyno") Long studyno*/) {
		
	}
	
	/*@PostMapping("/scheduleModify")
	public String scheduleModify(StudyVO study, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		//service.modify(study);
		return "/study/scheduleModify";
	}*/
	
	@GetMapping("/studyingList")
	public void studyingList(/*@RequestParam("id") String id, @RequestParam("state") String state, @ModelAttribute("cri") Criteria cri*/
			Model model, Criteria cri) {
		model.addAttribute("list", cri);
		//service.getStudyingList(id, state, cri);
	}
	
	@GetMapping("/studyingStudentList")
	public void studyingStudentList(/*@RequestParam("id") String id, @RequestParam("studyno") Long studyno,
			@ModelAttribute("cri") Criteria cri*/) {
	//	service.getStudentList(id, studyno, cri);
	}
	
	@GetMapping("/endStudyList")
	public void endStudyList(/*@RequestParam("id") String id, @RequestParam("state") String state,
			 @ModelAttribute("cri") Criteria cri*/) {
		//service.getEndList(id, state, cri);
	}
	
	@GetMapping("/endStudyStudentList")
	public void endStudyStudentList(/*@RequestParam("id") String id, @RequestParam("studyno") Long studyno,
			@ModelAttribute("cri") Criteria cri*/) {
		//service.getStudentList(id, studyno, cri);
	}
	
	@GetMapping("/create")
	public void create() {
		
	}
	
	@PostMapping("/create")
	public String create(StudyVO study,
			   RedirectAttributes rttr) {
		service.create(study);
		return "/study/scheduleList";
	}
	
	@GetMapping("/zzimStudy")
	public void zzimStudy(/*@ModelAttribute("cri") Criteria cri, 
			@RequestParam("id") String id*/) {
		//interservice.getListPage(cri, id);
	}
	
	@PostMapping("/zzimStudyRemove")
	public void zzimStudy(@RequestParam("intno") Long intno) {
		interservice.remove(intno);
	}
}
