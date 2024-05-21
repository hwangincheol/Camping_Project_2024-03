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
@RequestMapping("/siseol/*")
public class SiseolController {

	@GetMapping("/siseol1")
	public void siseol1() {}
	
	@GetMapping("/siseol2")
	public void siseol2() {}
	
	@GetMapping("/siseol3")
	public void siseol3() {}
	
	@GetMapping("/siseol4")
	public void siseol4() {}
	
	@GetMapping("/siseol5")
	public void siseol5() {}

	
	
}
