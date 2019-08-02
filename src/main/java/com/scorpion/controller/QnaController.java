package com.scorpion.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.scorpion.domain.QnaDTO;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LevelTestVO;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.QnaVO;
import com.scorpion.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@Log4j
@AllArgsConstructor
public class QnaController {

	private QnaService service;

	// 처음 QnA페이지 뿌려주는 곳
	// 전체 목록 가져오기 ㅇ
	@GetMapping("/list")
	public String list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));

		return "/qna/mainQnA";
	}

	// 목록 상세보기 ㅇ
	@GetMapping("/get")
	public String get(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("qna", service.get(qnaIndex));

		return "/qna/mainQnAGet";
	}

	// register 등록기능 ㅇ
	@GetMapping("/register")
	public String register() {
		return "/qna/mainQnARegister";
	}
//	@PreAuthorize("isAuthenticated()") 사용자 권한때 사용 (시큐리티 먼저)
	@PostMapping("/register")
	public String register(QnaVO qna, RedirectAttributes rttr) {
		service.register(qna);
		rttr.addFlashAttribute("result", qna.getQnaIndex());
		return "redirect:/qna/list";
	}

	//삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
	
		if(service.remove(qnaIndex)) { rttr.addAttribute("result","success"); }

		return "redirect:/qna/list";
	}
	
	//수정
	@GetMapping("/modify") 
	public String modify(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri, Model model) { 
		return "qna/mainQnAModify"; 
	}
	
	@PostMapping("/modify")
	public String modify(QnaVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(service.modify(qna)) {
			rttr.addAttribute("result","success");
		}
		return "redirect:/qna/get?qnaIndex="+qna.getQnaIndex();
		
	}
	
	/*
	 * @GetMapping("/modify") public String modify(@RequestParam("qnano") Long
	 * qnaIndex, @ModelAttribute("cri") Criteria cri, Model model) { return
	 * "qna/mainQnAModify"; }
	 * 
	 * @PostMapping("/modify") public String modify(QnaVO
	 * qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	 * if(service.modify(qna)) { rttr.addAttribute("result","success"); } return
	 * "redirect:/level/get?testIndex="+qna.getQnaIndex(); }
	 * 
	 * @GetMapping("/myQna") public void myQna(Model model, Criteria
	 * cri, @RequestParam("id") String id) { service.getMyList(cri, id); }
	 * 
	 * @GetMapping("/answer") public void answer(@RequestParam("qnano") Long
	 * qnano, @ModelAttribute("cri") Criteria cri, Model model) {
	 * 
	 * }
	 * 
	 * @PostMapping("/answer") public String answer(@RequestParam("qnano") Long
	 * qnano, @RequestParam("answer") String answer) { service.replymodify(qnano,
	 * answer); return "/qna/get"; }
	 */
}
