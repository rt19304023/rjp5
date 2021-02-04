package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.SearchDepartmentWorkingHoursBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;

public class OraSearchDepartmentWorkingHoursDao implements SearchDepartmentWorkingHoursDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;

	public OraSearchDepartmentWorkingHoursDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public SearchDepartmentWorkingHoursBean workingHoursSerch(SearchDepartmentWorkingHoursBean bean) {
		// TODO 自動生成されたメソッド・スタブ
		
		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));
		
		cn = (Connection)connector.getConnection();
		
		String sql = "SELECT employeeid, FROM time_sheets";


		return bean;
	}

}
