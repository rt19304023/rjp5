package dao;

import java.util.ArrayList;

public interface ChangeRegistInformationDao {

	public ArrayList registInformationChange(String employeeId,String name,String cardNumber,
												String userType,String depertmentCode,String depertmentName);

}

