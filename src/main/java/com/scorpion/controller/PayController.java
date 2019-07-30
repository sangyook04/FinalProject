package com.scorpion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.study.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/pay")
@AllArgsConstructor
public class PayController {
   
   @GetMapping("/incomeList")
   public void get(Model model, Criteria cri) {
      
   }
   
   @GetMapping("/refund")
   public void refund(@RequestParam("studyNum") int studyNum, Model model) {
      
   }
   
   @PostMapping("/refund")
   public String refund(@ModelAttribute("payNum") int payNum) {
      
      return "redirect:/pay/myMoneylist";
   }
   
   @GetMapping("/myMoneyList")
   public void myMoneyList(@ModelAttribute("studentId") Long studentId, Model model, Criteria cri) {
      
   }
   
   @GetMapping("/payInfo")
   public void payInfo(@ModelAttribute("studyNum") Long studyNum, Criteria cri, Model model ) {
      
   }
   
   @GetMapping("/paymentList")
   public void paymentList(Model model, Criteria cri) {
      
   }
   
   @GetMapping("/beforeDeposit")
   public void beforeDeposit(Model model, Criteria cri) {
      
   }
   
   @PostMapping("/deposit")
   public String deposit(@RequestParam("payNum") int payNum ) {
      
      return "redirect:/pay/afterDeposit";
   }
   
   @GetMapping("/afterDeposit")
   public void afterDeposit(Model model, Criteria cri) {
      
   }
   
   @GetMapping("/manageList")
   public void manageList(Model model, Criteria cri) {
      
   }
   

}