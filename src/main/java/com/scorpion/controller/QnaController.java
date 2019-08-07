package com.scorpion.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.Iterator;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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
	//@PreAuthorize("isAuthenticated()")
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

	// 삭제 ㅇ
//	@PreAuthorize("principal.username == #qnaWriter")
	@PostMapping("/remove")
	public String remove(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {

		if (service.remove(qnaIndex)) {
			rttr.addAttribute("result", "삭제 성공!");
		}

		return "redirect:/qna/mylist";
	}
	
	// 수정 ㅇ

	@GetMapping("/modify")
	public String modify(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("qna", service.get(qnaIndex));
		return "qna/mainQnAModify";
	}

//	@PreAuthorize("principal.username == #qnaWriter")
	@PostMapping("/modify")
	public String modify(QnaVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, Model model) {

		if (service.modify(qna)) {
			rttr.addAttribute("result", "success");
		}
		return "redirect:/qna/get?qnaIndex=" + qna.getQnaIndex();
	}
///////////////////////////////////////////여기서부터 MY
	
	// 내가 등록한 QnA페이지 뿌려주는곳
	@GetMapping("/mylist")
	public String mylist(Model model, Criteria cri) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = auth.getName();
	    
	    //인증
		Collection<? extends GrantedAuthority> user_auth = auth.getAuthorities();
		Iterator<? extends GrantedAuthority> iter = user_auth.iterator();
		
	    model.addAttribute("list", service.getMyList(cri, user_id));
//		model.addAttribute("list", service.getMyList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));

//		while (iter.hasNext()) { 
//			GrantedAuthority authUser = iter.next(); 
//			
//			if(authUser.getAuthority().equals("ROLE_STUDENT")) {
//				return "/qna/myQnA?stuId=" + user_id;
//			} else if (authUser.getAuthority().equals("ROLE_LEADER")) {
//				return "/qna/myQnA?leaId=" + user_id;
//			}
//				
//		}//end while
		//http://localhost:8090/qna/mylist?stuId=amstar2
		return "/qna/myQnA";
	}
	
	// 마이QNA 목록 상세보기

	//@PreAuthorize("isAuthenticated()")
	@GetMapping("/myget")
	public String myget(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri, Model model) {
		//String user_id = principal.getName();
		
		//Authentication user_id = SecurityContextHolder.getContext().getAuthentication();
		//User user_id = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//user_id가 안먹힐경우 아래방법 2가지로 처리해보자
		
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//	    String user_id = auth.getName(); //get logged in username
			
		model.addAttribute("qna", service.myget(qnaIndex));

		return "/qna/myQnAGet";
	}
	
	// my 삭제 
//	@PreAuthorize("principal.username == #qnaWriter")
	@PostMapping("/myremove")
	public String myremove(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		Authentication authRole = SecurityContextHolder.getContext().getAuthentication();
//	    String user_id = auth.getName(); //get logged in username
		
		if (service.remove(qnaIndex)) {
			rttr.addAttribute("result", "삭제 성공!");
		}
		
		return "redirect:/qna/mylist";
		
	}
	
	// my 수정 
//	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mymodify")
	public String mymodify(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("qna", service.get(qnaIndex));
		return "qna/myQnAModify";
	}

//	@PreAuthorize("principal.username == #qnaWriter")
	@PostMapping("/mymodify")
	public String mymodify(QnaVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, Model model) {

		if (service.modify(qna)) {
			rttr.addAttribute("result", "success");
		}
		return "redirect:/qna/myget?qnaIndex=" + qna.getQnaIndex();
	}

}
