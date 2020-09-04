package com.argos.r_recommender.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import javax.annotation.PostConstruct;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;

import com.argos.r_recommender.config.MongoConfig;
import com.mongodb.Block;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;


public class BaseDAO extends AbstractDao {
	
	@Autowired
	MongoConfig mongoConfig;

	@Autowired
	MongoClient mongo_client;
	
	
	protected  MongoCollection<Document> getCollection(String databaseName,String col_name) throws Exception {
		MongoCollection<Document> col = mongo_client.getDatabase(databaseName).getCollection(col_name);
		return col;
	}
	
	
	@Override
	public Document update(String DB, String col, Document filter, Document update) throws Exception {
		UpdateResult updateResult = getCollection(DB, col).updateOne(filter, update);
		Document result_doc = new Document();
		result_doc.put("result", updateResult);

		return result_doc;
	}

	@Override
	public Document delete(String DB, String col, Document document) throws Exception {
		DeleteResult delete_result = getCollection(DB, col).deleteMany(document);
		Document result_doc = new Document();
		result_doc.put("result", delete_result);
		return result_doc;
	}

	@Override
	public void insert_one(String DB, String col, Document document)throws Exception  {
		getCollection(DB, col).insertOne(document);
	}

	@Override
	public void insert_all(String DB, String col, List<Document> documents)throws Exception  {
		getCollection(DB, col).insertMany(documents);

	}

	@Override
	public Document find_one(String DB, String col, Document query) throws Exception {
		FindIterable<Document> find_docs = getCollection(DB, col).find(query);

		return find_docs.first();
	}

	@Override
	public List<Document> findAll(String DB, String col, Document query, Document sort_query, int limit)throws Exception {
		FindIterable<Document> find_docs = getCollection(DB, col).find(query).sort(sort_query).limit(limit);

		List<Document> find_list = new ArrayList<>();
		for (Document d : find_docs) {
			find_list.add(d);
		}

		return find_list;
	}

	@Override
	public List<Document> findAll(String DB, String col, Document query, Document project, Document sort_query,
			int limit) throws Exception {
		FindIterable<Document> find_docs = getCollection(DB, col).find(query).projection(project).sort(sort_query)
				.limit(limit);
		List<Document> find_list = new ArrayList<>();
		for (Document d : find_docs) {
			find_list.add(d);
		}

		return find_list;
	}

	@Override
	public List<Document> findAll(String DB, String col, Document query, Document sort_query, int start_page,
			int limit)throws Exception  {
		FindIterable<Document> find_docs = getCollection(DB, col).find(query).sort(sort_query).skip(start_page)
				.limit(limit);
		List<Document> find_list = new ArrayList<>();
		for (Document d : find_docs) {
			find_list.add(d);
		}

		return find_list;
	}

	
}
