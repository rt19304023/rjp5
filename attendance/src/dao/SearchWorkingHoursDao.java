package dao;

import java.util.ArrayList;

public interface SearchWorkingHoursDao {

	public ArrayList workingHoursSearch(String month,String employeeId);
	public ArrayList workingHoursSearch(String employeeId,String month,String day);

}
