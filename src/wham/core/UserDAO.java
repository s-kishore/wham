package wham.core;

import java.io.File;
import java.sql.*;

/**
 * @author lohiy
 *
 */
public class UserDAO {
	
	static String dbFileLocation="V:\\ee_workspace1\\wham\\wham.db";
	static File file = new File(dbFileLocation);


	public static void registerUser(User user) throws SQLException{
		
		if(!file.exists()){
			createDb();
			
		}
		Connection selConn=null;
		PreparedStatement prepStmt=null;
		String userId=user.getUserName();
		String password=user.getPassword();
		String firstName=user.getFirstName();
		String lastName=user.getLastName();
		String city=user.getCity();
		String preferences=user.getPerference();
		String emailId=user.getEmailId();

		String insQuery="INSERT into "
				+ "USER (USERID,PASSWORD,FIRSTNAME,LASTNAME,CITY,PREFERENCES,EMAILID)"
				+ " VALUES (?,?,?,?,?,?,?)";

		try {
			Class.forName("org.sqlite.JDBC");
			selConn = DriverManager.getConnection("jdbc:sqlite:"+dbFileLocation);
			selConn.setAutoCommit(false);
			prepStmt = selConn.prepareStatement(insQuery);
			prepStmt.setString(1, userId);
			prepStmt.setString(2, password);
			prepStmt.setString(3, firstName);
			prepStmt.setString(4, lastName);
			prepStmt.setString(5, city);
			prepStmt.setString(6, preferences);
			prepStmt.setString(7, emailId);
			prepStmt.executeUpdate();
			selConn.commit();

		}
		catch(SQLException e){
			System.out.println("registerUser"+e);
		}
		catch(Exception e){
			System.out.println("registerUser"+e);
		}
		finally{

			if(prepStmt!=null){
				prepStmt.close();
			}
			if(selConn!=null){
				selConn.close();
			}
		}
	}
	public static User isValid(User user) throws SQLException {
		
		if(!file.exists()){
			createDb();
		}

		Connection selConn=null;
		PreparedStatement prepStmt=null;
		boolean isValid=false;
		String selQuery="select USERID,FIRSTNAME,LASTNAME,CITY,EMAILID, PREFERENCES FROM USER WHERE USERID=? AND PASSWORD=?";
		try {
			Class.forName("org.sqlite.JDBC");
			selConn = DriverManager.getConnection("jdbc:sqlite:"+dbFileLocation);
			selConn.setAutoCommit(false);
			prepStmt = selConn.prepareStatement(selQuery);
			prepStmt.setString(1, user.getUserName());
			prepStmt.setString(2, user.getPassword());
			ResultSet rs= prepStmt.executeQuery();
			isValid=rs.next();

			if(isValid){

				user.setFirstName(rs.getString("FIRSTNAME"));
				user.setLastName(rs.getString("LASTNAME"));
				user.setPerference(rs.getString("PREFERENCES"));
				user.setEmailId(rs.getString("EMAILID"));
				user.setCity(rs.getString("CITY"));
				user.setValid(true);

			}
			else{
				user.setValid(false);
			}

		}
		catch(SQLException e){
			System.out.println("isValid"+e);
		}
		catch(Exception e){
			System.out.println("isValid"+e);
		}
		finally{

			if(prepStmt!=null){
				prepStmt.close();
			}
			if(selConn!=null){
				selConn.close();
			}

		}
		return user;

	}
	public static void updateDb(User user)throws SQLException{

		

		Connection selConn=null;
		PreparedStatement prepStmt=null;
		String userId=user.getUserName();
		String password=user.getPassword();
		String firstName=user.getFirstName();
		String lastName=user.getLastName();
		String city=user.getCity();
		String preferences=user.getPerference();
		String emailId=user.getEmailId();
		
		String updateQuery="UPDATE USER SET FIRSTNAME=?,LASTNAME=?,CITY=?,EMAILID=?, PREFERENCES=?, PASSWORD=? WHERE USERID=?";
		try {
			Class.forName("org.sqlite.JDBC");
			selConn = DriverManager.getConnection("jdbc:sqlite:"+dbFileLocation);
			prepStmt = selConn.prepareStatement(updateQuery);
			prepStmt.setString(1, firstName);
			prepStmt.setString(2, lastName);
			prepStmt.setString(3, city);
			prepStmt.setString(4, emailId);
			prepStmt.setString(5, preferences);
			prepStmt.setString(6, password);
			prepStmt.setString(6, userId);
			prepStmt.executeUpdate();
		}
		catch(SQLException e){
			System.out.println("updateDb() "+e);
		}
		catch(Exception e){
			System.out.println("updateDb() "+e);
		}
		finally{

			if(prepStmt!=null){
				prepStmt.close();
			}
			if(selConn!=null){
				selConn.close();
			}

		}
		

		
		
		
	}
	public static void createDb(){
		Connection c = null;
		Statement stmt = null;
		try {
			Class.forName("org.sqlite.JDBC");
			c = DriverManager.getConnection("jdbc:sqlite:"+dbFileLocation);
			System.out.println("Opened database successfully");

			stmt = c.createStatement();
			String sql = "CREATE TABLE USER " +
					"(USERID INT PRIMARY KEY     NOT NULL," +
					" PASSWORD           TEXT    NOT NULL, " + 
					" FIRSTNAME           TEXT    NOT NULL, " +
					" LASTNAME            TEXT     NOT NULL, " + 
					" CITY        TEXT, " +
					" PREFERENCES        TEXT, " +
					" EMAILID         TEXT)"; 
			stmt.executeUpdate(sql);
			stmt.close();
			c.close();
		} 
		catch ( Exception e ) {
			System.err.println("createDb "+ e.getClass().getName() + ": " + e.getMessage() );
		}
	}
	

}
