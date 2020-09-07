package com.argos.r_recommender.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPGenericVector;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REXPString;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;


@Repository("r_analysisDAO")
public class R_analysisDAO {
  RConnection connection = null;
		private static final Logger logger = LoggerFactory.getLogger(R_analysisDAO.class);
	
		
		@Value("${R_SCRIPT_PATH}") 
		public String R_SCRIPT_PATH;
		
		@Value("${R_SERVER_IP}") 
		public String R_SERVER_IP;

		@Value("${R_SERVER_PORT}") 
		public int R_SERVER_PORT;
		
		String source_head = "source ( '";
		
		String source_tail = "')";

		

public Map recommend_item_by_user(Map<String, Object> request_map) {
	   String userId = (String) request_map.get("userId");
	 	   RConnection connection = null;
	   		String  results ="";
	 		REXP r= null;
	 		RList list=  null;
	   		try {
	   			connection  =		new RConnection(R_SERVER_IP, R_SERVER_PORT);
	  			connection.eval ( source_head + "/home/analysis/R/recommender_script/"+ "recommend_item_by_user.R" +source_tail);
	  			connection.assign("userId",userId);
	   			connection.assign(".tmp.", "recommend_item_by_user(userId)");
	   			r = connection.parseAndEval("try(eval(parse(text=.tmp.)),silent=TRUE)");
	   			if (r.inherits("try-error")) { 
					logger.error("Error: "+r.asString());
					throw new Exception();
				}
				else { 
					list= r.asList();
				}
				ArrayList<String> arr_map = new ArrayList<>();
				for(int i =0; i<list.size();i++){
					REXPString item = (REXPString) list.get(i);
					arr_map.add(item.asString());
				}
				
	   			request_map.put("result", arr_map);
	   			request_map.put("state", true);
	   		} catch (Exception e) {
	   		e.printStackTrace();
	   		request_map.put("state", false);
	   		}finally {
	   	  	connection.close();
	   	 request_map.remove("data");
	   		}
	   		return request_map;
}

}
