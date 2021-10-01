package com.argos.r_recommender.service;

import com.argos.r_recommender.dao.Member_DAO;
import com.argos.r_recommender.dao.Recommend_DAO;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Member_Service {

	@Autowired
	Member_DAO member_DAO;

	public Document recommend_item(String user_id) {

		Document response_doc = new Document();
		return response_doc;

	}


	public Map insert_member(Map<String, Object> member_info) {
		Document response_doc = new Document();


		String username = (String) member_info.get("name");
		int is_user = selectRowCount("recommend", "userInfo", new Document().append("name", username));

		if (is_user <= 0)
		{

			try {

				String name = (String) member_info.get("name");
				String email = (String) member_info.get("email");
				String passwd = (String) member_info.get("passwd");

				member_DAO.insert_one("recommend", "userInfo",
						new Document().append("name", name).append("email", email).append("passwd",passwd)

				);

			} catch (Exception e) {
				e.printStackTrace();
			}

			response_doc.append("state", 205);
		} else { //중복유저  처리

			response_doc.append("state", 201);
		}

		return response_doc;
	}

	public int selectRowCount(String db_name, String col_name, Document query) {
		int result = 0;
		try {
			Long count = member_DAO.count(db_name, col_name, query);
			result = count.intValue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}