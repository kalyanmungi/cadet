package org.cadet.client.model.adaptive;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.cadet.client.model.adaptive.algorithm.Adaptive_Ability_Optimization;
import org.cadet.util.model.DatabaseConnection;
import org.cadet.util.model.Constants;


/**
 * @author Varun Jamdar
 *
 */
public class AdaptiveTestDBTransactions {
	
	public AdaptiveTestDBTransactions(){
		
	}
	
	public static boolean checkTestWithinDuration(int testID) throws SQLException, Exception{
		// this method checks if the test is started in within the stipulated test duration.
		
			DatabaseConnection dbConn=DatabaseConnection.getInstance();
			Connection conn=dbConn.getDbConnection();
			PreparedStatement ps=conn.prepareStatement(Constants.sqlCommands.getTest);
			ps.setInt(1, testID);
			
			ResultSet rs=ps.executeQuery();
			if(rs.first()){
				
				Date startTime=rs.getDate(6);
				Date endTime=rs.getDate(7);
				
				long testDuration=rs.getInt(8)*60*60*1000;
				
				Date now=new Date(new java.util.Date().getTime());
				
				if((now.getTime()>startTime.getTime())&&(now.getTime()<(endTime.getTime()-testDuration))){
					return true;
				}
			}
			else{
				throw new Exception("No such Test Exists !");
			}
		return false;
	}

	public static HashMap<Integer, Integer> getCategoryWiseQuestionCount(int testId) throws SQLException, Exception{
		
		DatabaseConnection dbConn=DatabaseConnection.getInstance();
		Connection conn=dbConn.getDbConnection();
		PreparedStatement ps=conn.prepareStatement(Constants.sqlCommands.getQuestionCountOfCategoryOfTest);
		ps.setInt(1, testId);
		ResultSet rs=ps.executeQuery();
		rs.beforeFirst();
		HashMap<Integer, Integer> catWiseQuestionCount=new HashMap<Integer, Integer>();
		while(rs.next()){
			catWiseQuestionCount.put(new Integer(rs.getInt(1)), new Integer(rs.getInt(2)));
		}
		if(catWiseQuestionCount.isEmpty())
			throw new Exception("Category wise questions not defined!");
		return catWiseQuestionCount;
	}
	
	public static Adaptive_Ability_Optimization generateAAO(int testId, int noOfQuestions) throws SQLException, Exception{
		//this method generates an instance of Adaptive_Optimization_Class based on the testId
		
		double initialDifficulty;
		
		
		DatabaseConnection dbConn=DatabaseConnection.getInstance();
		PreparedStatement ps=dbConn.getDbConnection().prepareStatement(Constants.sqlCommands.getTest);
		
		ps.setInt(1, testId);
		
		ResultSet rs=ps.executeQuery();
		if(rs.first()){
			initialDifficulty=(double)rs.getInt(9);
		}
		else{
			throw new Exception("No such Test Exists !");
		}
				
		return new Adaptive_Ability_Optimization(Constants.adaptive.MIN_DIFFICULTY, Constants.adaptive.MAX_DIFFICULTY, initialDifficulty, noOfQuestions, Constants.adaptive.DIFFERENCE_BETWEEN_TWO_DIFFICULTIES);
	}

	public static Question fetchNextQuestion(int testId, int categoryId, Double difficulty, ArrayList<Integer> askedQuestions) throws SQLException, Exception {
		
		String questions_asked= "";
		
		for(int i=0; i<askedQuestions.size(); i++) {
			questions_asked+= askedQuestions.get(i) + ",";
		}
		
		questions_asked= questions_asked.substring(0, questions_asked.length()-1);
		
		DatabaseConnection dbConn= DatabaseConnection.getInstance();
		PreparedStatement ps= dbConn.getDbConnection().prepareStatement(Constants.sqlCommands.fetchNextQuestion1 + questions_asked + Constants.sqlCommands.fetchNextQuestion2);
		ps.setInt(1, testId);
		ps.setInt(2, categoryId);
		ps.setInt(3, difficulty.intValue());
		
		
		ResultSet rs= ps.executeQuery();
		
		if(rs.first()){
			return new Question(rs.getInt(1), rs.getInt(2), rs.getInt(10), rs.getInt(11), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
		}
		else{
			throw new Exception("Questions for the given difficulty are exhausted !");
		}
	}
	
	public static void saveResult(String username, int testId, Double ability, int attempted, int correctAnswers) throws SQLException {
		
		DatabaseConnection dbConn=DatabaseConnection.getInstance();
		Connection conn=dbConn.getDbConnection();
		PreparedStatement ps=conn.prepareStatement(Constants.sqlCommands.saveResult);
		ps.setString(1, username);
		ps.setInt(2, testId);
		ps.setInt(3, ability.intValue());//currently int value is inserted. Update to double once database change is done.
		ps.setInt(4, attempted);
		ps.setInt(5, correctAnswers);
		
		ps.execute();
	}
}
