package com.argos.r_recommender.service;


import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.argos.r_recommender.dao.R_analysisDAO;

@Service
public class Recommend_Service {

	
	@Autowired
	R_analysisDAO r_analysisDAO;
	
	
	public Document recommend_item(String user_id) {
	
		Document response_doc = new org.bson.Document();
		return response_doc;
		
	}
	
}
