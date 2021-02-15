package dao.oracle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.SearchWorkingHoursBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import dao.SearchWorkingHoursDao;
import exception.DataBaseException;

public class OraSearchWorkingHoursDao implements SearchWorkingHoursDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;
	ArrayList result = new ArrayList();

	public OraSearchWorkingHoursDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ArrayList workingHoursSearch(SearchWorkingHoursBean bean) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = (Connection)connector.getConnection();

		String sql = "SELECT * FROM time_select WHERE employeeid = ? AND month = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString(1,bean.getEmployeeId());
			st.setString(2, bean.getMonth());

			rs = st.executeQuery();

			while(rs.next()) {
				SearchWorkingHoursBean resultBean = new SearchWorkingHoursBean();
				resultBean.setEmployeeId(rs.getString(1));
				resultBean.setDate(rs.getString(2));
				resultBean.setAttendance(rs.getString(3));
				resultBean.setGooutTime(rs.getString(4));
				resultBean.setReturnTime(rs.getString(5));
				resultBean.setLeaveWork(rs.getString(6));
				result.add(resultBean);
				System.out.println("result:" + result);
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

		return result;
	}

}
