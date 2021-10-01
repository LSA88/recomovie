package com.argos.r_recommender.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.argos.r_recommender.dao.Description_DAO;
import com.argos.r_recommender.service.Description_Service;
import com.argos.r_recommender.service.Recommend_Service;
import org.bson.Document;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViewController {
	org.slf4j.Logger logger = LoggerFactory.getLogger(ViewController.class);

	@Autowired
	Description_Service description_service;
	@Autowired
	private Recommend_Service recommend_service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		System.out.println("/index");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/index");
		mv.addObject("movie_list",recommend_service.select_movie_list());

		return mv;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		System.out.println("/member/login_resist_form");
		return "/member/login_resist_form";

	}

	@RequestMapping(value = "/description", method = RequestMethod.GET)
	public ModelAndView description(HttpServletResponse response, HttpServletRequest request, @RequestParam String movieid)
			throws Exception {
		System.out.println("movieid : "+movieid);
		Document movie_info = description_service.select_movie(movieid);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/movie/description");
		mv.addObject("movie_info",movie_info);

		System.out.println("/movie/description");
		return mv;

	}


}