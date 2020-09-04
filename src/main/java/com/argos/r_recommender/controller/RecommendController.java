package com.argos.r_recommender.controller;

import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.argos.r_recommender.dao.R_analysisDAO;

@Controller
public class RecommendController {


	@Resource(name = "r_analysisDAO")
	private R_analysisDAO r_analysisDAO;
	
	org.slf4j.Logger logger = LoggerFactory.getLogger(RecommendController.class);

//	@RequestMapping(value = "/sales_by_date", method = RequestMethod.POST)
//	@ResponseBody
//	public Map sales_by_date(@RequestBody Map<String,Object> request_map ) {
//		Map response_map = r_analysisDAO.sales_by_date(request_map);   
//		return response_map;
//	}
//
//
//	@RequestMapping(value = "/sales_by_country", method = RequestMethod.POST)
//	@ResponseBody
//	public Map sales_by_country(@RequestBody Map<String,Object> request_map ) {
//		Map response_map = r_analysisDAO.sales_by_country(request_map);   
//		return response_map;
//	}
	@RequestMapping(value = "/recommend_item_by_user", method = RequestMethod.POST)
	@ResponseBody
	public Map recommend_item_by_user(@RequestBody Map<String,Object> request_map ) {
		Map response_map = r_analysisDAO.recommend_item_by_user(request_map);   
		return response_map;
	}

	
	@RequestMapping(value = "/recommend_main", method = RequestMethod.GET)
	public ModelAndView r_analysis_main(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("recommend_page/recommend_main");
		return mv;
	}
	

	
}