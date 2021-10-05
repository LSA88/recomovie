package com.argos.r_recommender.dao;

import com.mongodb.client.MongoCollection;
import org.bson.Document;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository("login_DAO")
public class Login_DAO extends BaseDAO {

	@Override
	protected MongoCollection<Document> getCollection(String databaseName, String col_name) throws Exception {
		return super.getCollection(databaseName, col_name);
	}

	@Override
	public Document update(String DB, String col, Document filter, Document update) throws Exception {
		return super.update(DB, col, filter, update);
	}

	@Override
	public Document delete(String DB, String col, Document document) throws Exception {
		return super.delete(DB, col, document);
	}

	@Override
	public void insert_one(String DB, String col, Document document) throws Exception {
		super.insert_one(DB, col, document);
	}

	@Override
	public void insert_all(String DB, String col, List<Document> documents) throws Exception {
		super.insert_all(DB, col, documents);
	}

	@Override
	public Document find_one(String DB, String col, Document query) throws Exception {
		return super.find_one(DB, col, query);
	}

	@Override
	public List<Document> findAll(String DB, String col, Document query, Document sort_query, int limit)
			throws Exception {
		return super.findAll(DB, col, query, sort_query, limit);
	}

	@Override
	public List<Document> findAll(String DB, String col, Document query, Document project, Document sort_query,
								  int limit) throws Exception {
		return super.findAll(DB, col, query, project, sort_query, limit);
	}

	@Override
	public List<Document> findAll(String DB, String col, Document query, Document sort_query, int start_page, int limit)
			throws Exception {
		return super.findAll(DB, col, query, sort_query, start_page, limit);
	}
	@Override
	public long count(String DB, String col, Document query) throws Exception {
		return super.count(DB, col, query);
	}

}
