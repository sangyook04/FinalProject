package com.scorpion.controller;

import org.springframework.security.access.prepost.PreAuthorize;
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
import com.scorpion.domain.FaqVO;
import com.scorpion.domain.PageDTO;
import com.scorpion.service.FaqService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/faq/*")
@Log4j
@AllArgsConstructor
public class FaqController {

   private FaqService service;
   
   @PreAuthorize("anonymous()")
   @GetMapping("/view")
   public void view(Model model, Criteria cri) {
      model.addAttribute("list", service.getList(cri));
      int total = service.getTotal(cri);
      model.addAttribute("pageMaker", new PageDTO(cri, total));
   }
   
   
   
   
   
   @PreAuthorize("hasRole('ROLE_ADMIN')")
   @GetMapping("/list")
   public void list(Model model, Criteria cri) {
      model.addAttribute("list", service.getList(cri));
      int total = service.getTotal(cri);
      model.addAttribute("pageMaker", new PageDTO(cri, total));
      
      
   }
   @PreAuthorize("hasRole('ROLE_ADMIN')")
   @GetMapping("/get")
   public void get(@RequestParam("faqIndex") Long faqindex, @ModelAttribute("cri") Criteria cri, Model model){
      model.addAttribute("faqget", service.get(faqindex));
      
   }

   @GetMapping("/register")
   public void register() {
      
   }
   @PreAuthorize("hasRole('ROLE_ADMIN')")
   @PostMapping("/register")
   public String register(FaqVO faq,  RedirectAttributes rttr) {
      service.register(faq);
      rttr.addFlashAttribute("result", faq.getFaqIndex());
      return "redirect:/faq/list";
   }
   
   @PreAuthorize("hasRole('ROLE_ADMIN')")
   @PostMapping("/remove")
   public String remove(@RequestParam("faqIndex") Long faqindex, @ModelAttribute("cri") Criteria cri,
               RedirectAttributes rttr) {
      
      if(service.remove(faqindex)) {
         rttr.addFlashAttribute("reresult", faqindex);
      };
      return "redirect:/faq/list";
   }
   
   @GetMapping("/modify")
   public void modify(@RequestParam("faqIndex") Long faqIndex, @ModelAttribute("cri") Criteria cri, Model model) {
      model.addAttribute("faqget", service.get(faqIndex));  
   }
   @PreAuthorize("hasRole('ROLE_ADMIN')")
   @PostMapping("/modify")
   public String modify(FaqVO faqvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
      
      if(service.modify(faqvo)) {
         rttr.addFlashAttribute("moresult", faqvo.getFaqIndex());
      }
      
      return "redirect:/faq/list";
   }
}