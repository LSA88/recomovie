package com.argos.r_recommender.service;

import com.argos.r_recommender.dao.Description_DAO;
import com.argos.r_recommender.dao.Recommend_DAO;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Description_Service {

	@Autowired
	Description_DAO description_DAO;




	public Document select_movie(String movieid) {

		Document response_doc = new Document();


		try {
			response_doc = description_DAO.find_one("recommend", "reco_movie_description",
					new Document("movieid",movieid));

			System.out.println(response_doc.toJson());
			response_doc.append("state", 200);
		} catch (Exception e) {
			e.printStackTrace();
			response_doc.append("state", 404);
		}



		return response_doc;

	}



	public int selectRowCount(String db_name, String col_name, Document query) {
		int result = 0;
		try {
			Long count = description_DAO.count(db_name, col_name, query);
			result = count.intValue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}