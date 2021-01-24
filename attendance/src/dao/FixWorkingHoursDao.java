package dao;

import java.util.ArrayList;

public interface FixWorkingHoursDao {

	public ArrayList workingHoursFix(String employeeId,String date,String attendance,
			String gooutTime,String returnTime,String leaveWork);

}
