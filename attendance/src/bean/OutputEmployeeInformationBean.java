package bean;

import java.io.Serializable;

public class OutputEmployeeInformationBean implements Serializable {

	private String employeeId;
	private String name;
	private String pass;
	private String cardNumber;
	private String departmentCode;
	private String departmentName;

	public OutputEmployeeInformationBean() {
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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getdepartmentCode() {
		return departmentCode;
	}

	public void setdepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getdepartmentName() {
		return departmentName;
	}

	public void setdepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

}
