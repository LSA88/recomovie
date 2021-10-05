package com.argos.r_recommender.service;

import com.argos.r_recommender.dao.Description_DAO;
import com.argos.r_recommender.dao.Login_DAO;
import com.argos.r_recommender.dao.Recommend_DAO;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Login_Service {

	@Autowired
	Login_DAO login_dao;

	public Document recommend_item(String name) {

		Document response_doc = new org.bson.Document();
		return response_doc;

	}

	public Map user_movie_rating(String name) {

		Document response_doc = new org.bson.Document();

		int is_user = selectRowCount("recommend", "userinfo", new Document().append("name", name));

		if (is_user > 0)// 평점 조회결과가 없다면
		{
			try {
				List<Document> rating_list = login_dao.findAll("recommend", "userinfo",
						new Document().append("name", name), new Document(), 0);

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

	public  Document select_member(String name, String passwd) {

		Document response_doc = new Document();


		try {
			response_doc = login_dao.find_one("recommend", "userInfo",
					new Document("name",name).append("passwd",passwd)
			);

			if (response_doc == null) {
				System.out.println("로그인에 실패하셨습니다.");
			} else {
				System.out.println("로그인에 성공하셨습니다.");
			}


		} catch (Exception e) {
			e.printStackTrace();
		}



		return response_doc;

	}




	public int selectRowCount(String db_name, String col_name, Document query) {
		int result = 0;
		try {
			Long count = login_dao.count(db_name, col_name, query);
			result = count.intValue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}