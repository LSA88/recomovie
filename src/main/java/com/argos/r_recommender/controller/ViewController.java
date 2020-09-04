package com.argos.r_recommender.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewController {
	org.slf4j.Logger logger = LoggerFactory.getLogger(ViewController.class);
    
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		System.out.println("/index");
		return "/index";

	}
	
}
