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
import com.scorpion.domain.NoticeVO;
import com.scorpion.domain.PageDTO;
import com.scorpion.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@Log4j
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;

//	@GetMapping("/list")
//	public void list(Model model, Criteria cri) {
//		service.getList(cri);
//	}

	/*
	 * @GetMapping("/noticeList") public void list(Model model, Criteria cri) {
	 * service.getList(cri);
	 * 
	 * model.addAttribute("noticeList", service.getList(cri));
	 * model.addAttribute("pageMaker", new PageDTO(cri,service.getTotal(cri)));
	 * 
	 * 
	 * 
	 * }
	 */

	@GetMapping({ "/noticeList", "/adminNoticeManage" })
	public void list(Model model, Criteria cri) {
		/* service.getList(cri); */

		model.addAttribute("noticeList", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));

	}

	@GetMapping({"/noticeView","/adminNoticeDetail"})
	public void get(@RequestParam("notIndex") Long notIndex, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("view", service.get(notIndex));
	}

//	
//	@GetMapping({"/get", "/modify"})
//	public void get(@RequestParam("notIndex") Long notIndex,
//			@ModelAttribute("cri") Criteria cri,
//	        Model model) {
//		model.addAttribute("noticeView", service.get(notIndex));
//	}

	@GetMapping("/adminNoticeRegister")
	public void register() {

	}

	
	@PostMapping("/adminNoticeRegister")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		service.register(notice);
		rttr.addFlashAttribute("content", notice.getNotIndex());
		return "redirect:/notice/adminNoticeManage";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("notIndex") Long notIndex, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		if(service.remove(notIndex)) {
			rttr.addAttribute("result","success");
		}
		return "redirect:/notice/adminNoticeManage";
	}

	@GetMapping("/modify")
	public void modify(@RequestParam("noticeno") Long noticeno, @ModelAttribute("cri") Criteria cri, Model model) {

	}

	@PostMapping("/modify")
	public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		service.modify(notice);
		return "/notice/get";
	}
}
