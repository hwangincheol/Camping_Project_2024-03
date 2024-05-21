package com.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.NoticeVO;
import com.camping.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	
	private NoticeService service;
	
	@GetMapping("/noticelist")
	public void noticelist(Model model) {
		
		log.info("noticelist");
		
		//model.addAttribute("noticelist", service.getList());
		
	}

	@GetMapping("/noticeregister")
	public void noticegister() {
		
	}
	
	@PostMapping("/noticeregister")
	public String noticeregister(NoticeVO notice, RedirectAttributes rttr) {
		
		log.info("noticeregister: " + notice);
		
		service.noticeregister(notice);
		
		rttr.addFlashAttribute("result", notice.getBoard_no());
		
		return "redirect:/notice/noticelist";
		
	}	
	
	
	@GetMapping({"/noticeget" , "/noticemodify"})
	public String noticeget(@RequestParam("board_no") int board_no, Model model) {
		
		log.info("noticeget or noticemodify");
		
		service.plusCnt(board_no);
		
		model.addAttribute("notice", service.noticeget(board_no));

		return "notice/noticeget";
	}
	
	@PostMapping("/noticemodify")
	public String noticemodify(NoticeVO notice, RedirectAttributes rttr) {
		
		log.info("modify: " + notice);
		
		if (service.noticemodify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/noticelist";
	}

	@PostMapping("/noticeremove")
	public String noticeremove(@RequestParam("board_no") int board_no, RedirectAttributes rttr) {
		
		log.info("remove..." + board_no);
		if (service.noticeremove(board_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/noticelist";
	}
	
	
}
