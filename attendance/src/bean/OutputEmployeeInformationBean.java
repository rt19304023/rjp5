package bean;

import java.io.Serializable;
import java.util.ArrayList;

public class OutputEmployeeInformationBean implements Serializable {

	private String employeeId;
	private String name;
	private String pass;
	private String cardNumber;
	private String departmentCode;
	private String departmentName;
	private ArrayList timeList;

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

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public ArrayList getTimeList() {
		return timeList;
	}

	public void setTimeList(ArrayList timeList) {
		this.timeList = timeList;
	}

}
