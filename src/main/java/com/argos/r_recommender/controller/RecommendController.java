package com.argos.r_recommender.controller;

import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.argos.r_recommender.dao.R_analysisDAO;
import com.argos.r_recommender.service.Recommend_Service;

@Controller
public class RecommendController {


	@Resource(name = "r_analysisDAO")
	private R_analysisDAO r_analysisDAO;

	@Autowired
	private Recommend_Service recommend_service;
	Logger logger = LoggerFactory.getLogger(RecommendController.class);

	@RequestMapping(value = "/recommend_item_by_user", method = RequestMethod.POST)
	@ResponseBody
	public Map recommend_item_by_user(@RequestBody Map<String,Object> request_map ) {
		Map response_map = r_analysisDAO.recommend_item_by_user(request_map);
		return response_map;
	}
	@RequestMapping(value = "/insert_movie_rating", method = RequestMethod.POST)
	@ResponseBody
	public Map insert_movie_rationg(@RequestBody Map<String,Object> request_map ) {
		Map response_map = recommend_service.insert_movie_rating(request_map);
		return response_map;
	}

	@RequestMapping(value = "/user_movie_rating", method = RequestMethod.POST)
	@ResponseBody
	public Map user_movie_rating(@RequestBody Map<String,Object> request_map ) {
		Map response_map = recommend_service.user_movie_rating((String)request_map.get("이름"));
		return response_map;
	}
	@RequestMapping(value = "/select_movie_list", method = RequestMethod.GET)
	@ResponseBody
	public String select_movie_list( ) {
		Document response_map = recommend_service.select_movie_list();
		return response_map.toJson();
	}
	@RequestMapping(value = "/recommend_main", method = RequestMethod.GET)
	public ModelAndView r_analysis_main(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("recommend_page/recommend_main");
		return mv;
	}



}
