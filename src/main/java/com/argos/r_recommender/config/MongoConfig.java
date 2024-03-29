package com.argos.r_recommender.config;

import java.util.Arrays;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.config.AbstractMongoClientConfiguration;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.connection.ClusterSettings;
import com.mongodb.MongoClientSettings;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
 

@Configuration
public class MongoConfig extends AbstractMongoClientConfiguration {

	@Value("${spring.data.mongodb.port}")
	private String port;
	
	@Value("${spring.data.mongodb.host}")
	private String host;
	@Value("${spring.data.mongodb.database}")
	private String database;
	
	
	/*
	 *
	 * 
	 * @Value("${spring.data.mongodb.uri}") private String uri;
	 * 
	 * @Value("${spring.data.mongodb.username}") private String username;
	 * 
	 * @Value("${spring.data.mongodb.password}") private String password;
	 */

	@Override
	protected String getDatabaseName() {
		return database;
	}
	
	
	@Override
	public MongoClient mongoClient(){
		//MongoCredential credential = MongoCredential.createCredential(username, database,password.toCharArray());
		
	    MongoClient mongoClient = MongoClients.create(
	            MongoClientSettings.builder()
	            //.credential(credential)
	                    .applyToClusterSettings(builder ->
	                            builder.hosts(Arrays.asList(
	                                    new ServerAddress(host, Integer.parseInt(port))
	                            		)))
	                    .build());
		return mongoClient;
	}
	
	@Bean
	public  MongoClient mongo_client() {
		return mongoClient();
	}
}
