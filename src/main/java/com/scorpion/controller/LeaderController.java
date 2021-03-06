package com.scorpion.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.scorpion.domain.LeaderReviewVO;
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.NoticeVO;
import com.scorpion.domain.PictureVO;
import com.scorpion.domain.StudentVO;
import com.scorpion.service.LeaderReviewService;
import com.scorpion.service.LeaderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/leader/*")
@Log4j
@AllArgsConstructor
public class LeaderController {
   LeaderService service;
   LeaderReviewService revservice;
   
//   @GetMapping("/info")
//   public void info(@RequestParam("leaId") String leaderid, Model model) {
//      log.info("/get");
//      model.addAttribute("leader", service.get(leaderid));
//   }
   
   //회원정보, 수정 출력
   @GetMapping({"/info","/modify"})
   public void info(@RequestParam("leaId") String leaderid, Model model) {
      log.info("/get or /modify");
      
      model.addAttribute("leader", service.get(leaderid));
   }
   
   //회원 사진 정보 출력
   @GetMapping(value = "/getPictureList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
   @ResponseBody
   public ResponseEntity<List<PictureVO>> getPictureList(@RequestParam("leaId") String leaid){
	   log.info("getPictureList" + leaid);
	   
	   return new ResponseEntity<> (service.getPictureList(leaid), HttpStatus.OK);
   }
   
   //회원 정보 수정
   @PostMapping("/modify")
   public String modify(LeaderVO leader, RedirectAttributes rttr) {
	   log.info("modify : " + leader);
	   
	   if(service.modify(leader)) {
		   rttr.addFlashAttribute("result", "success");
	   }
	   
	   return "redirect:/leader/info?leaId="+leader.getLeaId();
   }
   
   //리더 탈퇴 화면 출력
   @GetMapping("/leaderDrop")
	public void drop(@RequestParam("leaId") String leaId, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("leaMyInfo", service.get(leaId));

	}
   
   //리더 탈퇴 처리
	@PostMapping("/leaderDrop") 
	public String drop(LeaderVO leader, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, Model model) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String user_id = auth.getName();
	    
	    model.addAttribute("list", service.drop(user_id));
//		
//		if(service.drop(student)) {
//			rttr.addAttribute("result","success");
//		}
	
		 return "redirect:/common/login";
	}

	   
	   //학생의 리더평가
	   @PostMapping("/studentComment")
	   public String review(LeaderReviewVO review, RedirectAttributes rttr) {
	      
	      log.info("review register : " + review);
	      
	      revservice.register(review);
	      rttr.addFlashAttribute("review", review.getRevIndex());
	      return "redirect:/common/main";
	   }
	   
	//학생의 리더 평가 출력
   @GetMapping("/studentComment")
   public void review() {
      
   }
   
   @GetMapping("/list")
   public void list() {
      
   }
   
   @GetMapping("/beforeJoin")
   public void beforeJoin() {
      
   }
   
   @GetMapping("/rejectJoin")
   public void rejectJoin() {
      
   }
   
   @PostMapping("/accept")
   public String accept(@RequestParam("id") String id) {
      
      return "/leader/beforeJoin";
   }
   
   @PostMapping("/reject")
   public String reject(@RequestParam("id") String id) {
      
      return "/leader/rejectJoin";
   }
   
}