package wham.core;

public class User {
	
	private String userName;
	private String password;
	private String firstName;
	private String lastName;
	private String emailId;
	private String city;
	private String sessionId;
	
	public String getSessionId() {
		return sessionId;
	}




	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}




	public String getCity() {
		return city;
	}




	public void setCity(String city) {
		this.city = city;
	}




	private String perference;
	private boolean isValid;
	
	
	
	
	/*User(String userName, String firstName, String lastName, String emailId, String password){
		this.userName=userName;
		this.firstName=firstName;
		this.lastName=lastName;
		this.emailId=emailId;
		this.password=password;
	}*/




	public boolean isValid() {
		return isValid;
	}




	public void setValid(boolean isValid) {
		this.isValid = isValid;
	}




	public String getPerference() {
		return perference;
	}




	public void setPerference(String perference) {
		this.perference = perference;
	}




	public String getUserName() {
		return userName;
	}




	public void setUserName(String userName) {
		this.userName = userName;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getFirstName() {
		return firstName;
	}




	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}




	public String getLastName() {
		return lastName;
	}




	public void setLastName(String lastName) {
		this.lastName = lastName;
	}




	public String getEmailId() {
		return emailId;
	}




	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
	
	
	

}
