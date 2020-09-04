package com.argos.r_recommender.dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;
import com.mongodb.Block;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.FindIterable;

public interface DAOImplements {

    public void insert_one(String DB,String col,Document update)throws Exception;
    
    public void insert_all(String DB,String col,List<Document> documents)throws Exception;
    
    public Document find_one(String DB,String col,Document query)throws Exception;
    
    public List<Document> findAll(String DB,String col,Document query,Document sort_query,int limit)throws Exception;
    
    public List<Document> findAll(String DB,String col,Document query,Document project,Document sort_query,int limit)throws Exception;
    
    public List<Document> findAll(String DB,String col,Document query,Document sort_query,int start_page,int limit)throws Exception;
    
    public Document update(String DB,String col,Document filter,Document update)throws Exception;
    
    public Document delete(String DB,String col,Document document)throws Exception;

	
	
}
