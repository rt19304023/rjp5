package bean;

import java.io.Serializable;

public class LoginBean implements Serializable {

	private String employeeId;
	private String name;
	private String code;
	private String pass;

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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

}
