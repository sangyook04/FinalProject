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
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.QnaVO;
import com.scorpion.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor
public class AdminController {

	private QnaService service;

	@GetMapping("/main")
	public void main() {

	}

	// 처음 QnA페이지 뿌려주는 곳
	// QNA 전체 목록 가져오기 ㅇ
	@GetMapping("/QnAlist")
	public String list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));

		return "/qna/adminList";
	}

	// QNA 목록 상세보기
	@GetMapping("/QnAget")
	public String get(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("qna", service.get(qnaIndex));

		return "/qna/adminQnAGet";
	}

	// QNA 삭제
	@PostMapping("/QnAremove")
	public String remove(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {

		if (service.remove(qnaIndex)) {
			rttr.addAttribute("result", "success");
		}

		return "redirect:/admin/QnAlist";
	}

	// QNA 답변(수정)
	@GetMapping("/QnAmodify")
	public String modifyAnswer(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri,
			Model model) {
		model.addAttribute("qna", service.get(qnaIndex));
		return "qna/adminQnAAnswer";
	}

	@PostMapping("/QnAmodify")
	public String modifyAnswer(QnaVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, Model model) {

		if (service.modifyAnswer(qna)) {
			rttr.addAttribute("result", "success");
		}
		return "redirect:/admin/QnAget?qnaIndex=" + qna.getQnaIndex();

	}

	@GetMapping("/adminLeader")
	public void adminLeader(Model model, Criteria cri) {
		model.addAttribute("leaderList", leaService.getList(cri));
//	      model.addAttribute("pageMaker", new PageDTO(cri, 123));

		int total = leaService.getTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping({ "/adminLeaderInfo", "/adminLeaderModify" })
	public void adminLeaderInfo(@RequestParam("leaId") String leaderid, @ModelAttribute("cri") Criteria cri,
			Model model) {
		log.info("/adminLeaderInfo");

		model.addAttribute("leader", leaService.get(leaderid));
	}

	@PostMapping("/adminLeaderModify")
	public String adminLeaderModify(LeaderVO leader, RedirectAttributes rttr) {
		log.info("modify : " + leader);

		if (leaService.modify(leader)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/admin/adminLeader";
	}

	@GetMapping("/adminRefusalLeader")
	public void adminRefusalLeader(Model model, Criteria cri) {
		model.addAttribute("leaderList", leaService.getRejectList(cri));

		int total = leaService.getTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/adminWaitLeader")
	public void adminWaitLeader(Model model, Criteria cri) {
		model.addAttribute("leaderList", leaService.getHoldList(cri));

		int total = leaService.getTotal(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
}
