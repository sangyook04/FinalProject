package com.scorpion.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LeaderVO;
import com.scorpion.domain.LevelTestVO;
import com.scorpion.domain.PageDTO;
import com.scorpion.domain.QnaVO;
import com.scorpion.domain.StudentVO;
import com.scorpion.service.LeaderService;
import com.scorpion.service.LevelTestService;
import com.scorpion.service.NoticeService;
import com.scorpion.service.PwdSearchService;
import com.scorpion.service.StudentService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/common/*")
@Log4j
public class CommonController {
	@Setter(onMethod_ = {@Autowired})
   LeaderService service;
	
	@Setter(onMethod_ = {@Autowired})
   NoticeService notservice;
	
	@Setter(onMethod_ = {@Autowired})
   StudentService stuservice;
	
	@Setter(onMethod_ = {@Autowired})
   PwdSearchService pwdservice;
   
   @Setter(onMethod_ = {@Autowired})
	private LevelTestService levelservice;
	
	private int index = 0;	//인덱스
	private int cnt = 0;	//맞은 개수
	private int score = 0;	//점수
	private String grade;
	private boolean pageFlag = true;
	private boolean lastExam = false;
	private String[] answerArr = new String[10];	//정답 저장 배열
	private String[] answerArr2 = new String[20];	//정답 저장 배열
	private List<LevelTestVO> testList;	//랜덤으로 뽑아온 10개의 테스트
   
	@GetMapping("/leaderTest")
	public void leaderTest(Model model) {
		if(pageFlag) {
			testList = levelservice.getRandom20Exam();
			}
		model.addAttribute("TestOne", testList.get(index));
		model.addAttribute("dap", answerArr2[index]);
		model.addAttribute("TestNum", index+1);
		if(lastExam) {
			model.addAttribute("score", score);
			lastExam = false;
		}
	}
	
	@PostMapping("/leaderTest")
	public String leaderTest(@RequestParam("dap") String dap, @RequestParam("state") String state) {
		pageFlag = false;
		//이전 버튼인 경우
		if(state.equals("prev")) {
			if(index == 0) {
			}else {
				index--;
			}
		}else if(state.equals("next")){
			//마지막 문제가 아닌경우
			if(index != 19) {
				System.out.println("d" + index);
				System.out.println("dap"+dap);
				answerArr2[index] = dap;
				index++;
			}
			//마지막 문제인경우
			else {
				for(int i=0; i<answerArr2.length; i++) {
					if(testList.get(i).getTestAnswer().equals(answerArr2[i])) {
						cnt++;
					}
				}
				score = cnt * 5;
				System.out.println(score);
				lastExam = true;
				
				if(score >= 10) {//80점이상이면 합격
					return "redirect:/common/leaderJoin"; //리더회원가입 페ㅐ이지로
				}
			}
		}
		return "redirect:/common/leaderTest";
	}
	
   @PostMapping("/pwdCheck")
  	public String pwdCheck(HttpServletRequest request, Model model, RedirectAttributes rttr, 
  			@RequestParam("name") String name, @RequestParam("id") String id, 
  			@RequestParam("phonenumber") String phonenumber) {

	   if (pwdservice.check(name, id, phonenumber)) {
			return "redirect:/common/findPw2?id="+id;
		}else {
			return "redirect:/common/pwdCheck";
		}
  	}
      	
   	@GetMapping("/findPw2")
   	public String findPw2(@RequestParam("id") String id , Model model) {
   		model.addAttribute("result", id); 
		return "/common/findPw2";
   	}
   	
   	@PostMapping("/findPw2")
	public String modify(HttpServletRequest request, Model model, RedirectAttributes rttr,
  			@RequestParam("pwd") String pwd, @RequestParam("pwd2") String pwd2, @RequestParam("id") String id) {
   			
   		if (pwdservice.modify(pwd, pwd2, id)) {
			rttr.addAttribute("result", "success");
		}
   		
		return "redirect:/common/login";
	}
   	 
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
   
   @PreAuthorize("isAnonymous()")
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

   @PreAuthorize("isAnonymous()")
   @GetMapping("/findId")
   public void findId(String error, String logout, Model model) {
      if(error != null){
         model.addAttribute("msg", "입력하신 정보와 일치하는 회원이 없습니다.");
      }
   }


   @PreAuthorize("isAnonymous()")
   @PostMapping(value = "/findId")
   public String findIdPost(@RequestParam("name") String name, @RequestParam("phonenum") String tel, Model model) {
      
      model.addAttribute("find", service.findId(name, tel));
      
      return "/common/findId";
   }
   
   @GetMapping("/findPw")
   public void findPw() {
      
   }
   
   @PostMapping("/findPw")
   public String findPw(@RequestParam("name") String name, @RequestParam("id") String id, @RequestParam("tel") String tel, @RequestParam("pw") String pw) {
      
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
   public void leaderJoin(Model model) {
	   model.addAttribute("score", score);
   }

   @PreAuthorize("isAnonymous()")
   @PostMapping("/leaderJoin")
   public String leaderJoin(LeaderVO leader, RedirectAttributes rttr) {
	   
      log.info("register : " + leader);
      
      if(leader.getPictureList() != null) {
         leader.getPictureList().forEach(attach -> log.info(attach));
      }
      
      service.register(leader);
      rttr.addFlashAttribute("result", leader.getLeaId());
      
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
	@GetMapping( "/noticeList")
	public void list(Model model, Criteria cri) {
		

		model.addAttribute("noticeList", notservice.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, notservice.getTotal(cri)));

	}

   	@PreAuthorize("isAnonymous()")
	@GetMapping("/noticeView")
	public void get(@RequestParam("notIndex") Long notIndex, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("view", notservice.get(notIndex));
	}
  
  
   
    @ResponseBody
    @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
    public int postIdCheck(HttpServletRequest req) throws Exception {
       log.info("post idCheck");

       String stuId = req.getParameter("stuId");
       int idCheck = stuservice.idcheck(stuId);
       int idCheck2 = stuservice.idcheck2(stuId);

       int result = 0;

       if (idCheck != 0 || idCheck2 != 0) {
          result = 1;
       }

       log.info(result);

       return result;

    }
    

    
    @ResponseBody
    @RequestMapping(value = "/idCheck2", method = RequestMethod.POST)
    public int postIdCheck2(HttpServletRequest req) throws Exception {
       log.info("post idCheck");

       String leaId = req.getParameter("leaId");
       int idCheck = service.idcheck(leaId);
       int idCheck2 = service.idcheck2(leaId);

       int result = 0;

       if (idCheck != 0 || idCheck2 != 0) {
          result = 1;
       }

       log.info(result);

       return result;

    }



   
   
}