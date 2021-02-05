package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.SearchWorkingHoursBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import exception.DataBaseException;

public class OraFixWorkingHoursDao implements FixWorkingHoursDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;

	public OraFixWorkingHoursDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public SearchWorkingHoursBean workingHoursFix(SearchWorkingHoursBean bean) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = (Connection)connector.getConnection();

		String sql = "UPDATE time_sheets SET employeeid = ?, work_day = ?, attendance = ?, goouttime = ?, returntime = ?, leaveWork = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString(1, bean.getEmployeeId());
			st.setString(2,bean.getDate());
			st.setString(3, bean.getAttendance());
			st.setString(4, bean.getGooutTime());
			st.setString(5, bean.getReturnTime());
			st.setString(6, bean.getLeaveWork());

			st.executeUpdate();

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
