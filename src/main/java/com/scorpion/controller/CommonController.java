package com.scorpion.controller;

import java.io.Console;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.StudentVO;
import com.scorpion.service.LeaderService;
import com.scorpion.service.NoticeService;
import com.scorpion.service.StudentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/common/*")
@Log4j
@AllArgsConstructor
public class CommonController {
   LeaderService service;
   NoticeService notservice;
   StudentService stuservice;

   @GetMapping("/main")
   public String main() {
      return "/index";
   }
   
   @GetMapping("/login")
   public void login(String error, String logout, Model model) {
      if(error != null) {
         model.addAttribute("msg", "아이디 또는 비밀번호를 다시 확인해주세요.");
      }
      
      if (logout != null) {
         model.addAttribute("logout", "로그아웃 완료");
      }
   }
   
   @PostMapping("/login")
   public String login(@RequestParam("id") String id, 
         @RequestParam("pw") String pw) {
      
      return "/common/main";
   }
   
   @PostMapping("/logout")
   public String logoutPost(Model model) {
      log.info("logout");
      
      model.addAttribute("logout", "로그아웃이 완료되었습니다.");
      
      return "/common/logout";
   }
   
   @GetMapping("/findId")
   public void findId(String error, String logout, Model model) {
      if(error != null){
         model.addAttribute("msg", "입력하신 정보와 일치하는 회원이 없습니다.");
      }
   }
   
   @PostMapping("/findId")
   public String findId(@RequestParam("id") String id, 
         @RequestParam("tel") String tel) {
      
      return "/common/login";
   }
   
   @GetMapping("/findPw")
   public void findPw() {
      
   }
   
   @PostMapping("/findPw")
   public String findPw(@RequestParam("name") String name, 
         @RequestParam("id") String id, 
         @RequestParam("tel") String tel, 
         @RequestParam("pw") String pw) {
      
      return "/common/login";
   }
   
   @GetMapping("/disable")
   public void disable() {
      
   }
   
   @PostMapping("/disable")
   public String disable(@RequestParam("id") String id) {
      
      return "/common/main";
   }
   

   @PreAuthorize("isAnonymous()")
   @GetMapping("/leaderJoin")
   public void leaderJoin() {
      
   }

   @PreAuthorize("isAnonymous()")
   @PostMapping("/leaderJoin")
   public String leaderJoin(LeaderVO leader, RedirectAttributes rttr) {
      log.info("register : " + leader);
      
      if(leader.getPictureList() != null) {
         leader.getPictureList().forEach(attach -> log.info(attach));
      }
      
      service.register(leader);
      
      return "redirect:/common/main";
   }
   
   
   @PreAuthorize("isAnonymous()")
   @GetMapping("/studentJoin")
   public void studentJoin() {
      
   }
   @PreAuthorize("isAnonymous()")
   @PostMapping("/studentJoin")
   public String studentJoin(StudentVO student) {
	   
	   stuservice.register(student);
      return "redirect:/common/main";
   }
   
   
   
   	@PreAuthorize("isAnonymous()")
	@GetMapping({ "/noticeList", "/adminNoticeManage" })
	public void list(Model model, Criteria cri) {
		

		model.addAttribute("noticeList", notservice.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, notservice.getTotal(cri)));

	}

   	@PreAuthorize("isAnonymous()")
	@GetMapping({"/noticeView","/adminNoticeDetail","/adminNoticeMod"})
	public void get(@RequestParam("notIndex") Long notIndex, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("view", notservice.get(notIndex));
	}
   
   
   
   
   
   
}