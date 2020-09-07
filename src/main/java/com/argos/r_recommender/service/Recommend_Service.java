package com.argos.r_recommender.service;


import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.argos.r_recommender.dao.R_analysisDAO;
import com.argos.r_recommender.dao.Recommend_DAO;

@Service
public class Recommend_Service {

	
	@Autowired
	Recommend_DAO recommend_DAO;
	
	
	public Document recommend_item(String user_id) {
	
		Document response_doc = new org.bson.Document();
		return response_doc;
		
	}


	public Map insert_movie_rating(Map<String, Object> request_map) {
		Document response_doc = new org.bson.Document();
		
		List<Map<String,Object>> movie_list = (List<Map<String, Object>>) request_map.get("movie_list");
		
		for(int i= 0; i<movie_list.size();i++) {
			
			try {
				recommend_DAO.insert_one("recommend_db", "col_movie_rating", new Document(movie_list.get(i)));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return response_doc;
	}
	
}
