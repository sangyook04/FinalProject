package com.scorpion.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.NoticeVO;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.PictureVO;
import com.scorpion.domain.QnaVO;
import com.scorpion.service.LeaderService;
import com.scorpion.domain.StudentVO;
import com.scorpion.service.NoticeService;
import com.scorpion.service.QnaService;
import com.scorpion.service.StudentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor
public class AdminController {

	private QnaService service;
	private LeaderService leaService;
	private NoticeService notservice;
	private StudentService stuservice;

	@GetMapping("/main")
	public void main() {

	}

	// 처음 QnA페이지 뿌려주는 곳
	// QNA 전체 목록 가져오기 ㅇ
	@GetMapping("/QnAlist")
	public String list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));

		return "/admin/adminList";
	}

	// QNA 목록 상세보기
	@GetMapping("/QnAget")
	public String get(@RequestParam("qnaIndex") Long qnaIndex, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("qna", service.get(qnaIndex));

		return "/admin/adminQnAGet";
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
		return "admin/adminQnAAnswer";
	}

	@PostMapping("/QnAmodify")
	public String modifyAnswer(QnaVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, Model model) {

		if (service.modifyAnswer(qna)) {
			rttr.addAttribute("result", "success");
		}
		return "redirect:/admin/QnAget?qnaIndex=" + qna.getQnaIndex();

	}
	
	/*-----------리더 관리------------------*/
	
	//리더 관리
	@GetMapping("/adminLeader")
	public void adminLeader(Model model, Criteria cri) {
		model.addAttribute("leaderList", leaService.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = leaService.getTotalA(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//리더 상세 정보, 리더 수정
	@GetMapping({"/adminLeaderInfo", "/adminLeaderModify"})
	public void adminLeaderInfo(@RequestParam("leaId") String leaderid, @ModelAttribute("cri") Criteria cri, Model model, @ModelAttribute("list") String list) {
		log.info("/adminLeaderInfo");
		
		model.addAttribute("leader", leaService.get(leaderid));
	}
	
	//리더 사진 정보
	@GetMapping(value = "/getPictureList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	   @ResponseBody
	   public ResponseEntity<List<PictureVO>> getPictureList(@RequestParam("leaId") String leaid){
		   log.info("getPictureList" + leaid);
		   
		   return new ResponseEntity<> (leaService.getPictureList(leaid), HttpStatus.OK);
	   }
	
	//리더 수정 완료
	@PostMapping("/adminLeaderModify")
	public String adminLeaderModify(LeaderVO leader, RedirectAttributes rttr, @ModelAttribute("list") String list) {
		log.info("modify : " + leader);
		
		if(leaService.modify(leader)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/admin/adminLeaderInfo?leaId=" + leader.getLeaId() + "&list=" + list;
	}
	
	//리더 가입 거부 목록
	@GetMapping("/rejectJoin")
	public void adminRefusalLeader(Model model, Criteria cri) {
		model.addAttribute("leaderList", leaService.getRejectList(cri));
		
		int total = leaService.getTotalR(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//리더 가입 대기 목록
	@GetMapping("/beforeJoin")
	public void adminWaitLeader(Model model, Criteria cri) {
		model.addAttribute("leaderList", leaService.getHoldList(cri));
		
		int total = leaService.getTotalB(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//리더 가입 거부 버튼
	@PostMapping("/reject")
	public String adminLeaderRefusal(@RequestParam("leaId") String leaId, RedirectAttributes rttr) {
		if(leaService.refusal(leaId)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/admin/beforeJoin";
	}
	
	//리더 가입 승인 버튼
	@PostMapping("/accept")
	public String adminLeaderUpdate(@RequestParam("leaId") String leaId, RedirectAttributes rttr) {
		if(leaService.leaderUpdate(leaId)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/admin/adminLeader";
	}
	
	/* ------------------------------------공지사항 관리 ------------------------------------------*/


	  @GetMapping("/adminNoticeManage") 
	  public void notlist(Model model, Criteria cri) { notservice.getList(cri);
	  
	  model.addAttribute("noticeList", notservice.getList(cri));
	  model.addAttribute("pageMaker", new PageDTO(cri, notservice.getTotal(cri)));
	  
	  }
	  
	  @GetMapping({"/adminNoticeDetail","/adminNoticeMod"}) 
	  public
	  void notget(@RequestParam("notIndex") Long notIndex, @ModelAttribute("cri")
	  Criteria cri, Model model) { model.addAttribute("view",
			  notservice.get(notIndex)); }
	 

	@GetMapping("/adminNoticeRegister")
	public void register() {

	}

	@PostMapping("/adminNoticeRegister")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		notservice.register(notice);
		rttr.addFlashAttribute("content", notice.getNotIndex());
		return "redirect:/admin/adminNoticeManage";
	}

	
	  @PostMapping("/remove") 
	  public String notremove(@RequestParam("notIndex") Long
	    notIndex, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) { if
	  (notservice.remove(notIndex)) { rttr.addAttribute("result", "success"); } return
	  "redirect:/admin/adminNoticeManage"; }
	  
	  
	  
	  @PostMapping("/adminNoticeMod") 
	  public String modify(NoticeVO
	  notice, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) { 
		  if
	  (notservice.modify(notice)) 
	  { rttr.addAttribute("result", "success"); }
		  // return "redirect:/notice/get?notIndex="+notice.getNotIndex(); 
		  return  "redirect:/admin/adminNoticeManage"; 
		  }
	 
	  
	/* ----------------------------------학생관리--------------------------------------------- */
	  
			
		
		@GetMapping({"/adminStudentInfo","/adminStudentMod"})
		public void get(@RequestParam("stuId") String stuId, @ModelAttribute("cri") Criteria cri, Model model) {
			model.addAttribute("stuInfo", stuservice.info(stuId));
		}

		
	
		@PostMapping("/adminStudentMod")
		public String modify(StudentVO student, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			if(stuservice.modify(student)) {
				rttr.addAttribute("result","success");
			}
			
			return "redirect:/admin/adminStudentInfo?stuId="+student.getStuId();
		}
		

		
		@GetMapping("/adminStudentList")
		public void stulist(Model model, Criteria cri) {
			
			model.addAttribute("studentList", stuservice.getList(cri));
			model.addAttribute("pageMaker", new PageDTO(cri, stuservice.getTotal(cri)));
		}
}
