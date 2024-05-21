package com.camping.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping("/sample/*")
@Controller
public class SampleController {
	
	@GetMapping("/all")
	public void doAll() {
		log.info("do all can access everybody");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("멤버만 사용 가능");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("관리자 전용");
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')") //표현식으로 hasAnyRole을 사용해 체크
	@GetMapping("/annoMember")
	public void doMember2() {
		
		log.info("logined annotation member");
		
	}
	
	@Secured({"ROLE_ADMIN"}) //단순히 값만 추가 가능
	@GetMapping("/annoAdmin")
	public void doAdmin2() {
		
		log.info("admin annotation only");
	}
}
