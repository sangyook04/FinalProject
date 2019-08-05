package com.scorpion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/level/*")
@Log4j
public class LevelController {
	
	@Setter(onMethod_ = {@Autowired})
	private LevelTestService service;
	
	private int index = 0;	//인덱스
	private int cnt = 0;	//맞은 개수
	private int score = 0;	//점수
	private boolean pageFlag = true;
	private boolean lastExam = false;
	private String[] answerArr = new String[10];	//정답 저장 배열
	private List<LevelTestVO> testList;	//랜덤으로 뽑아온 10개의 테스트
	
	
	@GetMapping("/leaderTest")
	public void leaderTest() {
		
	}
	
	@PostMapping("/leaderTest")
	public String leaderTest(@RequestParam("testno") Long testno,
			@RequestParam("dap") String dap) {
		
		return null;
	}
	
	@GetMapping("/commonTest")
	public void commonTest(Model model) {
		if(pageFlag) {
			testList = service.getRandomExam();
			}
		model.addAttribute("TestOne", testList.get(index));
		model.addAttribute("dap", answerArr[index]);
		model.addAttribute("TestNum", index+1);
		if(lastExam) {
			model.addAttribute("score", score);
			lastExam = false;
		}
	}
	
	@PostMapping("/commonTest")
	public String commonTest(@RequestParam("dap") String dap, @RequestParam("state") String state) {
		pageFlag = false;
		//이전 버튼인 경우
		if(state.equals("prev")) {
			if(index == 0) {
//				pageFlag = false;
				//첫 문제임을 알림
			}else {
//				answerArr[index] = "";
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
				score = cnt * 5;
				System.out.println(score);
//				pageFlag = true;	문제 새로 갖고오기 가능처리
				lastExam = true;
				return "redirect:/level/commonTest"; //추천스터디 목록으로 경로 바꿔야함
			}
		}
		return "redirect:/level/commonTest";
	}
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,service.getTotal(cri)));
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("testIndex") Long testindex,
			@ModelAttribute("cri") Criteria cri,
	        Model model) {
		model.addAttribute("test", service.get(testindex));
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(LevelTestVO levelTest,
			RedirectAttributes rttr) {
		
		service.register(levelTest);
		
		rttr.addFlashAttribute("result", levelTest.getTestIndex());
		return "redirect:/level/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("testIndex") Long testindex,
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		if(service.remove(testindex)) {
			rttr.addAttribute("result","success");
		}
		return "redirect:/level/list";
	}
	
	@PostMapping("/modify")
	public String modify(LevelTestVO levelTest, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(service.modify(levelTest)) {
			rttr.addAttribute("result","success");
		}
		return "redirect:/level/get?testIndex="+levelTest.getTestIndex();
		
	}
}
