package com.argos.r_recommender.controller;


import com.argos.r_recommender.dao.R_analysisDAO;
import com.argos.r_recommender.service.Recommend_Service;
import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class LoginController {


	@Resource(name = "r_analysisDAO")
	private R_analysisDAO r_analysisDAO;

	@Autowired
	private Recommend_Service recommend_service;
	Logger logger = LoggerFactory.getLogger(LoginController.class);


	@RequestMapping(value = "/select_member", method = RequestMethod.POST)
	@ResponseBody
	public String select_member(@RequestBody Map<String, Object> request_map) {
		Document response_map = recommend_service.select_member_list();
		return response_map.toJson();
	}


}

