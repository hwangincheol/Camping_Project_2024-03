package com.camping.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.AttachFileDTO;
import com.camping.domain.BoardAttachVO;
import com.camping.domain.BoardVO;
import com.camping.domain.Criteria;
import com.camping.domain.PageDTO;
import com.camping.service.ReviewBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j2
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewBoardController {

	private ReviewBoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) { // BoardVO board : form에서 넘어온 객체
		// RedirectAttributes rttr 일회용으로 값 저장용

		log.info("등록 : " + board);

		service.register(board);
		rttr.addFlashAttribute("result", "후기를 작성했습니다.");

		return "redirect:/review/list";
		// 메서드 실행 후 경로를 지정(리스트화면으로 감)
	}

	@ResponseBody
	@GetMapping(value = "/get", produces = MediaType.APPLICATION_JSON_VALUE)
	public BoardVO get(@RequestParam("boardNo") int board_no) {
	    BoardVO board = service.get(board_no);   
	    return board;
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		
		return "redirect:/review/list";
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/remove")
	public String remove(@RequestParam("board_no") int board_no, RedirectAttributes rttr) {
		log.info("삭제중" + board_no);
		if (service.remove(board_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/review/list";
	}

	
	
}
