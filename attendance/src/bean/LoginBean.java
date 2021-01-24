package bean;

import java.io.Serializable;

public class LoginBean implements Serializable {

	private String employeeId;
	private String name;
	private String userType;

	public LoginBean() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}
