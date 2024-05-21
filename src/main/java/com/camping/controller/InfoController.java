package com.camping.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/info/*")
public class InfoController {

	@GetMapping("/info1")
	public void info1() {}
	
	@GetMapping("/info2")
	public void info2() {}
	
	@GetMapping("/info3")
	public void info3() {}
	
	@GetMapping("/info4")
	public void info4() {}
	
	
	
	
}
