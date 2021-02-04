package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.SearchDepartmentWorkingHoursBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import exception.DataBaseException;

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

		String sql = "SELECT * FROM dept_total_time WHERE dep_code = ? AND month = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString(1, bean.getDepartmentCode());
			st.setString(2, bean.getMonth());

			rs = st.executeQuery();

			while(rs.next()){

				bean.setEmployeeId(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setDepartmentCode(rs.getString(3));
				bean.setDepartmentName(rs.getString(4));
				bean.setMonth(rs.getString(5));
				bean.setWorkTime(rs.getString(6));

			}
			cn.commit();
		}catch(SQLException e){
			try{
				cn.rollback();
			}catch(SQLException ex){
				throw new DataBaseException(ex.getMessage(),ex);
			}
			throw new DataBaseException(e.getMessage(),e);
		}finally{
			try{
				if(rs != null) {
					rs.close();
				}
				if(st != null){
					st.close();
				}
			}catch(SQLException e){
				throw new DataBaseException(e.getMessage(),e);
			}finally {
				try {
					if(cn != null) {
						cn.close();
					}
				}catch(SQLException ex) {
					throw new DataBaseException(ex.getMessage(),ex);
				}
			}
		}


		return bean;
	}

}
