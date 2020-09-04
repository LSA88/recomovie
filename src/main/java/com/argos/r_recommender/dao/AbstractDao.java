package com.argos.r_recommender.dao;
import java.util.List;
import org.bson.Document;

public abstract class AbstractDao implements DAOImplements {

	
	@Override
	public Document update(String DB,String col, Document filter, Document update) throws Exception{
		return null;
	}
	
	
	@Override
	public Document delete(String DB,String col, Document document)throws Exception {
		return null;
	}

	@Override
	public void insert_one(String DB,String col, Document document)throws Exception {
		return;
	}

	@Override
	public void insert_all(String DB,String col, List<Document> documents) throws Exception{
		return;
		
	}

	@Override
	public Document find_one(String DB,String col, Document query)throws Exception {
		return null;
	}

	@Override
	public List<Document> findAll(String DB,String col, Document query, Document sort_query, int limit) throws Exception{
		return null;
	}
	@Override
	public List<Document> findAll(String DB,String col, Document query,Document project, Document sort_query, int limit) throws Exception{
		return null;
	}

	@Override
	public List<Document> findAll(String DB, String col, Document query, Document sort_query,
			int start_page, int limit)throws Exception {
		return null;
	}

	
	
}
