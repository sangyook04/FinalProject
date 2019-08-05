package com.scorpion.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import com.scorpion.domain.LevelTestVO;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.PaymentVO;
import com.scorpion.service.LeaderService;
import com.scorpion.service.PaymentService;
import com.scorpion.service.StudyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/pay/*")
@AllArgsConstructor
public class PayController {
   
	private PaymentService service;
	private StudyService studyservice;
	private LeaderService leaderservice;
	
	@GetMapping("/test")
	public void test() {}
	
   @GetMapping("/incomeList")
   public void get(Model model, Criteria cri,
		   @ModelAttribute("studentId") String studentId,
		   Date start, Date end) {
	   service.getIncomeList(cri, studentId, start, end);
   }
   
   @GetMapping("/refund")
   public void refund(@RequestParam("studyNum") Long studyNum, Model model) {
      
   }
   
   @PostMapping("/refund")
   public String refund(@ModelAttribute("payNum") Long payNum) {
	   service.remove(payNum);
      return "redirect:/pay/myMoneylist";
   }
   
   @GetMapping("/myMoneyList")
   public void myMoneyList(@ModelAttribute("studentId") String studentId, Model model, Criteria cri) {
      service.getMyMoneyList(cri, studentId);
   }
   
   @GetMapping("/payInfo")
   public void payInfo(/*@ModelAttribute("studyNum") Long studyNum, Model model */) {
//	   studyservice.get(studyNum);
   }
   
   @GetMapping("/paymentList")
   public void paymentList(Model model, Criteria cri) {
	   service.getPaymentList(cri);
   }
   
   @GetMapping("/beforeDeposit")
   public void beforeDeposit(Model model, Criteria cri, String deposit) {
//	   List<LeaderVO> leaderlist = new ArrayList<LeaderVO>();
//	   List<PaymentVO> paylist = service.getBeforeDeposit(cri);
//	   model.addAttribute("paylist", paylist);
//	   
//	   for (PaymentVO pay : paylist) {
//		   leaderlist.add(leaderservice.get(pay.getLeaId()));
//	   }
//	   model.addAttribute("leaderlist", leaderlist);
	   model.addAttribute("list", service.getBeforeDeposit(cri));
   }
   
   @PostMapping("/deposit")
   public String deposit(@RequestParam("payIndex") Long payindex, RedirectAttributes rttr) {
	   log.info(payindex);
      if(service.deposit(payindex)) {
    	  rttr.addAttribute("result","success");
      }
      return "redirect:/pay/afterDeposit";
   }
   
   @GetMapping("/afterDeposit")
   public void afterDeposit(Model model, Criteria cri) {
	   model.addAttribute("list", service.getAfterDeposit(cri));
   }
   
   @GetMapping("/manageList")
	public void manageList(Model model, Criteria cri) {
	   if(cri .getStart() != null && cri.getStart().length() == 0) {
		   cri.setStart(null);
		   cri.setEnd(null);
	   }
	   model.addAttribute("list", service.getPaymentList(cri));
	   model.addAttribute("pageMaker", new PageDTO(cri,service.getTotal(cri)));
   }
   
   @PostMapping("/payment")
	public String register(PaymentVO payment,
			RedirectAttributes rttr) {
		
		service.pay(payment);
		
		rttr.addFlashAttribute("result", "success");
		return "redirect:/";
	}

}