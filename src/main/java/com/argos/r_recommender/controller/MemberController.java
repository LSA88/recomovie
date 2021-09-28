package com.argos.r_recommender.controller;

import com.argos.r_recommender.dao.R_analysisDAO;
import com.argos.r_recommender.service.Member_Service;
import com.argos.r_recommender.service.Recommend_Service;
import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MemberController {



	@Autowired
	private Member_Service member_service;
	Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value = "/insert_member", method = RequestMethod.GET)
	@ResponseBody
	public Map insert_member(@RequestParam(defaultValue = "") String name,@RequestParam(defaultValue = "") String email, @RequestParam(defaultValue = "") String passwd) {

		Map request_map = new HashMap<String ,String>();

		request_map.put("name",name);
		request_map.put("email",email);
		request_map.put("passwd",passwd);

		Map response_map = member_service.insert_member(request_map);
		return response_map;
	}




}
