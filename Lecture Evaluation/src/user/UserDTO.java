package user;

public class UserDTO {

	private String userID;
	
	private String userName;

	private String userPassword;

	private String userEmail;

	private String userEmailHash;

	private boolean userEmailChecked;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserEmailHash() {
		return userEmailHash;
	}

	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}

	public boolean isUserEmailChecked() {
		return userEmailChecked;
	}

	public void setUserEmailChecked(boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}

	public UserDTO(String userID, String userName, String userPassword, String userEmail,

			String userEmailHash, boolean userEmailChecked) {

		this.userID = userID;
		
		this.userName = userName;

		this.userPassword = userPassword;

		this.userEmail = userEmail;

		this.userEmailHash = userEmailHash;

		this.userEmailChecked = userEmailChecked;

	}


}
