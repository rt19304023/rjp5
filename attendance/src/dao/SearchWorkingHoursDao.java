package dao;

import java.util.ArrayList;

import bean.SearchWorkingHoursBean;

public interface SearchWorkingHoursDao {

	public ArrayList workingHoursSearch(SearchWorkingHoursBean bean);
	public ArrayList workingHoursSearch(SearchWorkingHoursBean bean,String day);

}
