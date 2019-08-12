package com.scorpion.controller;

import java.io.Console;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.scorpion.domain.Criteria;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.PictureVO;
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
	@PreAuthorize("anonymous()")
	@GetMapping("/select")
	public void select() {
		
	}
	
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
	public void get( @RequestParam("studyIndex") Long studyIndex, @ModelAttribute("cri") Criteria cri, Model model ) {
	    model.addAttribute("list", service.get(studyIndex));
	   // model.addAttribute("reviewlist", service.getlist(studyIndex));
	}
	@PreAuthorize("hasRole('ROLE_LEADER')")
	@GetMapping("/scheduleList")
	public void scheduleList(@ModelAttribute("cri") Criteria cri, Model model , String leaId ) {
		  leaId = "host";
		  model.addAttribute("list", service.getScheduleList(cri, leaId));
		  
		  int total  = service.getSTotal(cri, leaId); 
		  model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	@PreAuthorize("hasRole('ROLE_LEADER')")
	@PostMapping("/scheduleRemove")
	public String scheduleRemove(@RequestParam("studyIndex") Long studyIndex, RedirectAttributes rttr) {
		
		  if(service.remove(studyIndex))
		   { rttr.addFlashAttribute("result", "success");
		  }
		 
		return "redirect:/study/scheduleList";
	}
	@PreAuthorize("hasRole('ROLE_LEADER')")
	@GetMapping("/scheduleModify")
	public void scheduleModify(@RequestParam("studyIndex") Long studyIndex, Model model) {
		model.addAttribute("list", service.get(studyIndex));
		
	}
	@PreAuthorize("hasRole('ROLE_LEADER')")
	@PostMapping("/scheduleModify")
	public String scheduleModify(StudyVO studyvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if(service.modify(studyvo)) {
			rttr.addFlashAttribute("result", "변경 성공!");
			rttr.addFlashAttribute("leaId", "host");
		}
		return "redirect:/study/scheduleList";
	}
	@PreAuthorize("hasRole('ROLE_LEADER')")
	@GetMapping("/studyingList")
	public void studyingList(String leaId, @ModelAttribute("cri") Criteria cri, Model model) {
		
		leaId = "host";
		model.addAttribute("List", service.getStudyingList(cri, leaId));
		int total = service.getTotal(cri, leaId);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		
		
		
	}
	
	@GetMapping("/studyingStudentList")
	public void studyingStudentList(@RequestParam("studyIndex") Long studyIndex, @ModelAttribute("cri") Criteria cri,  Model model) {
	model.addAttribute("studentlist", service.getStudentList(studyIndex));
	
	}
	@PreAuthorize("hasRole('ROLE_LEADER')")
	@GetMapping("/endStudyList")
	public void endStudyList( String leaid, @ModelAttribute("cri") Criteria cri, Model model) {
		leaid = "host";
		model.addAttribute("eList", service.getEndList(cri, leaid));
		int total = service.getETotal(cri, leaid);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	
	}
	
	
	@GetMapping("/create")
	public void create() {
	
	}
	@PreAuthorize("hasRole('ROLE_LEADER')")
	@PostMapping("/create")
	public String create(StudyVO study, RedirectAttributes rttr) {
	
		service.create(study);
		rttr.addFlashAttribute("result", "스터디 개설 성공!!");
		rttr.addAttribute("leaId", "host");
		return "redirect:/study/scheduleList";
	}
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/zzimStudy")
	public void zzimStudy( String stuId, Model model) {
		stuId ="stuid1";
		model.addAttribute("stuid", service.getimage(stuId));
	}
	
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@PostMapping("/zzimStudyRemove")
	public void zzimStudy(@RequestParam("intno") Long intno) {
		interservice.remove(intno);
	}
	
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/stendStudyList")
	public void stendStudyList(String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
		stuId = "stuid1";
		model.addAttribute("eList", service.stgetEndList(cri, stuId)); 
	    int total = service.stgetETotal(cri, stuId); 
	    model.addAttribute("pageMaker",  new PageDTO(cri,total));
		 
	}
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/stStudyingList")
	public void stStudyingList(String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
		stuId = "stuid3";
		model.addAttribute("eList", service.stgetStudyingList(cri, stuId)); 
	    int total = service.stgetTotal(cri, stuId); 
	    model.addAttribute("pageMaker",  new PageDTO(cri,total));
	}
	@PreAuthorize("hasRole('ROLE_STUDENT')")
	@GetMapping("/stscheduleList")
	public void stscheduleList(String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
		stuId = "stuid3";
		model.addAttribute("eList", service.stgetScheduleList(cri, stuId)); 
	    int total = service.stgetSTotal(cri, stuId); 
	    model.addAttribute("pageMaker",  new PageDTO(cri,total));
	}
	
	
}
