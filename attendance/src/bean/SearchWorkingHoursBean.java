package bean;

import java.io.Serializable;

public class SearchWorkingHoursBean implements Serializable {

	private String month;
	private String employeeId;
	private String name;
	private String departmentName;
	private String date;
	private String attendance;
	private String gooutTime;
	private String returnTime;
	private String leaveWork;

	public SearchWorkingHoursBean() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
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

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAttendance() {
		return attendance;
	}

	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}

	public String getGooutTime() {
		return gooutTime;
	}

	public void setGooutTime(String gooutTime) {
		this.gooutTime = gooutTime;
	}

	public String getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(String returnTime) {
		this.returnTime = returnTime;
	}

	public String getLeaveWork() {
		return leaveWork;
	}

	public void setLeaveWork(String leaveWork) {
		this.leaveWork = leaveWork;
	}

}
