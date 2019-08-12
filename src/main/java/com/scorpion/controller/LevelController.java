package com.scorpion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.scorpion.domain.Criteria;
import com.scorpion.domain.LevelTestVO;
import com.scorpion.domain.PageDTO;
import com.scorpion.service.LevelTestService;
import com.scorpion.service.StudentService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/level/*")
@Log4j
public class LevelController {
	
	@Setter(onMethod_ = {@Autowired})
	private LevelTestService service;
	
	@Setter(onMethod_ = {@Autowired})
	private StudentService stuservice;
	
	private int index = 0;	//인덱스
	private int cnt = 0;	//맞은 개수
	private int score = 0;	//점수
	private String grade;
	private boolean pageFlag = true;
	private boolean lastExam = false;
	private String[] answerArr = new String[10];	//정답 저장 배열
	private String[] answerArr2 = new String[20];	//정답 저장 배열
	private List<LevelTestVO> testList;	//랜덤으로 뽑아온 10개의 테스트
	
	@PreAuthorize("hasRole([ROLE_STUDENT])")
	@GetMapping("/commonTest")
	public void commonTest(@RequestParam("stuId") String stuId, Model model) {
		if(pageFlag) {
			testList = service.getRandomExam();
			}
		model.addAttribute("TestOne", testList.get(index));
		model.addAttribute("dap", answerArr[index]);
		model.addAttribute("TestNum", index+1);
		model.addAttribute("stuId", stuId);
		if(lastExam) {
			model.addAttribute("score", score);
			lastExam = false;
		}
	}
	
	@PreAuthorize("hasRole([ROLE_STUDENT])")
	@PostMapping("/commonTest")
	public String commonTest(@RequestParam("stuId") String stuId, @RequestParam("dap") String dap, @RequestParam("state") String state, Model model) {
		pageFlag = false;
		//이전 버튼인 경우
		if(state.equals("prev")) {
			if(index == 0) {
			}else {
				index--;
			}
		}else if(state.equals("next")){
			//마지막 문제가 아닌경우
			if(index != 9) {
				System.out.println("d" + index);
				System.out.println("dap"+dap);
				answerArr[index] = dap;
				index++;
			}
			//마지막 문제인경우
			else {
				for(int i=0; i<answerArr.length; i++) {
					if(testList.get(i).getTestAnswer().equals(answerArr[i])) {
						cnt++;
					}
				}
				score = cnt * 5; //채점인데 cnt 개수에 따라 grade(용원이형이 설정한 파라미터에 맞춰야함) 설정하는것으로 수정. grade를 넘기는것으로 수정
				if(cnt < 3) { //0~3 초급
					grade = "초급";
				} else if(cnt >= 4 && cnt <= 6) { //4~6 중급
					grade = "중급";
				} else { // 7~10 고급
					grade = "고급";
				}
				System.out.println(score);
				lastExam = true;
				System.out.println("stuid="+stuId);
				System.out.println("grade="+grade);
				//학생 레벨 설정
				if(stuservice.setLevel(stuId, grade)) {
					model.addAttribute("grade", grade);
					model.addAttribute("stuId", stuId);
					System.out.println("등급"+grade);
				}
				
				return "redirect:/level/commonTest?stuId="+stuId; //추천스터디 목록으로 경로 바꿔야함 grade(용원이형이 설정한 파라미터에 맞춰야함)를 넘기는거로 수정
			}
		}
		return "redirect:/level/commonTest?stuId="+stuId;
	}
	
	@PreAuthorize("hasRole([ROLE_ADMIN])")
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,service.getTotal(cri)));
	}
	
	@PreAuthorize("hasRole([ROLE_ADMIN])")
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("testIndex") Long testindex,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		model.addAttribute("test", service.get(testindex));
	}
	
	@PreAuthorize("hasRole([ROLE_ADMIN])")
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PreAuthorize("hasRole([ROLE_ADMIN])")
	@PostMapping("/register")
	public String register(LevelTestVO levelTest,
			RedirectAttributes rttr) {
		
		service.register(levelTest);
		
		rttr.addFlashAttribute("result", levelTest.getTestIndex());
		return "redirect:/level/list";
	}
	
	@PreAuthorize("hasRole([ROLE_ADMIN])")
	@PostMapping("/remove")
	public String remove(@RequestParam("testIndex") Long testindex,
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		if(service.remove(testindex)) {
			rttr.addAttribute("result","success");
		}
		return "redirect:/level/list";
	}
	
	@PreAuthorize("hasRole([ROLE_ADMIN])")
	@PostMapping("/modify")
	public String modify(LevelTestVO levelTest, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(service.modify(levelTest)) {
			rttr.addAttribute("result","success");
		}
		return "redirect:/level/get?testIndex="+levelTest.getTestIndex();
		
	}
}
