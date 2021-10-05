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

	public Map user_movie_rating(String user_id) {

		Document response_doc = new org.bson.Document();

		int is_user = selectRowCount("recommend", "col_movie_rating", new Document().append("이름", user_id));

		if (is_user > 0)// 평점 조회결과가 없다면
		{
			try {
				List<Document> rating_list = recommend_DAO.findAll("recommend", "col_movie_rating",
						new Document().append("이름", user_id), new Document(), 0);

				response_doc.append("result", rating_list);

				response_doc.append("state", 200);
			} catch (Exception e) {
				e.printStackTrace();
				response_doc.append("state", 404);
			}

		} else {

			response_doc.append("state", 404);
		}

		return response_doc;

	}
	public Document select_movie_list() {

		Document response_doc = new org.bson.Document();


		try {
			List<Document> movie_list = recommend_DAO.findAll("recommend", "reco_movie_description",
					new Document(), new Document(), 0);

			response_doc.append("result", movie_list);
			System.out.println(response_doc.toJson());
			response_doc.append("state", 200);
		} catch (Exception e) {
			e.printStackTrace();
			response_doc.append("state", 404);
		}



		return response_doc;

	}

	public Document select_member_list() {

		Document response_doc = new org.bson.Document();


		try {
			List<Document> member_list = recommend_DAO.findAll("recommend", "userinfo",
					new Document(), new Document(), 0);

			response_doc.append("result", member_list);
			System.out.println(response_doc.toJson());
			response_doc.append("state", 200);
		} catch (Exception e) {
			e.printStackTrace();
			response_doc.append("state", 404);
		}



		return response_doc;

	}


	public Map insert_movie_rating(Map<String, Object> request_map) {
		Document response_doc = new org.bson.Document();

		List<Map<String, Object>> movie_list = (List<Map<String, Object>>) request_map.get("movie_list");

		String name = (String) movie_list.get(0).get("이름");
		int is_user = selectRowCount("recommend", "col_movie_rating", new Document().append("이름", name));

		if (is_user > 0)// 평점 업데이트 처리
		{
			for (int i = 0; i < movie_list.size(); i++) {

				try {
					String movie_name = (String) movie_list.get(i).get("영화이름");
					String movie_rating = (String) movie_list.get(i).get("평점");
					recommend_DAO.update("recommend", "col_movie_rating",
							new Document().append("이름", name).append("영화이름", movie_name),

							new Document().append("$set", new Document().append("평점", movie_rating)));

				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			response_doc.append("state", 205);
		} else { // 평점 등록 처리

			for (int i = 0; i < movie_list.size(); i++) {

				try {
					recommend_DAO.insert_one("recommend", "col_movie_rating", new Document(movie_list.get(i)));
				} catch (Exception e) {
					e.printStackTrace();
				}

			}

			response_doc.append("state", 201);
		}

		return response_doc;
	}

	public int selectRowCount(String db_name, String col_name, Document query) {
		int result = 0;
		try {
			Long count = recommend_DAO.count(db_name, col_name, query);
			result = count.intValue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}