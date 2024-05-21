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
import com.camping.domain.BoardVO;
import com.camping.domain.Criteria;
import com.camping.domain.PageDTO;
import com.camping.service.FreeBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

 

@Controller
@Log4j2
@RequestMapping("/free/*")
@AllArgsConstructor
public class FreeBoardController {

	private FreeBoardService service;

	@GetMapping("/register") // 등록
	public void register() {

	}


	@GetMapping("/list") // 목록가져오기
	public void list(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register") // 작성
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("register: " + board);

		service.register(board);

		rttr.addFlashAttribute("result", board.getBoard_no());

		return "redirect:/free/list";
	}


	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("board_no") int board_no, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		
	       BoardVO board = service.get(board_no);
	       service.increaseViewCount(board_no); // 조회수 증가
	        
		model.addAttribute("board", service.get(board_no));
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/free/list";
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/remove")
	public String remove(@RequestParam("board_no") int board_no, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + board_no);
		if (service.remove(board_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/free/list";
	}

}