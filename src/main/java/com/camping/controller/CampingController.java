package com.camping.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.CampingVO;
import com.camping.domain.Criteria;
import com.camping.domain.PageDTO;
import com.camping.service.CampingService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/camping/*")
@AllArgsConstructor
public class CampingController {
	
	private CampingService service;
	
	//@GetMapping("/list")
	//public void list(Model model) {
		
	//	log.info("list");
	//	model.addAttribute("list", service.getList());
	//}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 40));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(CampingVO camping, RedirectAttributes rttr) {
		
		log.info("register : " + camping);
		
		service.register(camping);
		
		rttr.addFlashAttribute("result", camping.getBoard_no());
		
		return "redirect:/camping/list" ;
		
	}
	
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("board_no")Long board_no, 
			@ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("camping", service.get(board_no));
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modify")
	public String modify(CampingVO camping,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + camping);
		
		if(service.modify(camping)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/camping/list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/remove")
	public String remove(@RequestParam("board_no")Long Board_no,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove......." + Board_no);
		if (service.remove(Board_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/camping/list";
	}
	
}
