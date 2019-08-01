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
	
	//처음 QnA페이지 뿌려주는 곳
	//전체 목록 가져오기
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
//			model.addAttribute("list", service.getList());
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new QnaDTO(cri, 123));
									   //전체 데이터 수는 임의로 123으로 지정
		//전체 데이터 개수를 가지고 와서 total에 저장
		int total = service.getTotal(cri);
		log.info("total count : " + total);	//전체 데이터 개수 로그로 기록
		//모델 객체 pageMaker의 값을 실제 총 데이터 개수로 지정해서 저장
		model.addAttribute("pageMaker", new QnaDTO(cri, total));
		
	}	

//	@GetMapping("/list")
//	public void list(Model model, Criteria cri) {
//		service.getList(cri);
//	}
	
	
	@GetMapping("/myQna")
	public void myQna(Model model, Criteria cri, @RequestParam("id") String id) {
		service.getMyList(cri, id);
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("qnano") Long qnano,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		service.get(qnano);
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("qnano") Long qnano,
            @ModelAttribute("cri") Criteria cri,
	 		     RedirectAttributes rttr) {
		
		service.remove(qnano);
		
		return "/qna/list";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("qnano") Long qnano,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@PostMapping("/modify")
	public String modify(QnaVO qna, 
			@ModelAttribute("cri") Criteria cri, 
			RedirectAttributes rttr) {
		service.modify(qna);
		return "/qna/get";
	}
	
	//register 등록기능
	@GetMapping("/register")
	public String register() {
		return "/qna/mainQnARegister";
	}
	
	@PostMapping("/register")
//	@PreAuthorize("isAuthenticated()") 사용자 권한때 사용 (시큐리티 먼저)
	public String register(QnaVO qna,
			   RedirectAttributes rttr) {
		service.register(qna);
		rttr.addFlashAttribute("result", qna.getQnaIndex());
		return "redirect:/qna/mainQnA";
	}
	
//	//게시물 등록하기
//		@PostMapping("/register")
//		@PreAuthorize("isAuthenticated()")
//		public String register(BoardVO board,
//							   RedirectAttributes rttr) {
//			log.info("register : " + board);
//			service.register(board);
//			rttr.addFlashAttribute("result", board.getBno());
//			return "redirect:/board/list";
//		}
	
	@GetMapping("/answer")
	public void answer(@RequestParam("qnano") Long qnano,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		
	}
	
	@PostMapping("/answer")
	public String answer(@RequestParam("qnano") Long qnano,
			@RequestParam("answer") String answer) {
		service.replymodify(qnano, answer);
		return "/qna/get";
	}
}
