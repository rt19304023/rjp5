package dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.SearchWorkingHoursBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import dao.FixWorkingHoursDao;
import exception.DataBaseException;

public class MysqlFixWorkingHoursDao implements FixWorkingHoursDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;

	public MysqlFixWorkingHoursDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public SearchWorkingHoursBean workingHoursFix(SearchWorkingHoursBean bean) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = (Connection)connector.getConnection();

		String sql = "UPDATE time_sheets SET attendance = TO_DATE(?,'HH24:MI'), goouttime = TO_DATE(?,'HH24:MI'), returntime = TO_DATE(?,'HH24:MI'),";
		String sql2 = " leaveWork = TO_DATE(?,'HH24:MI') WHERE employeeid = ? AND work_day = TO_DATE(?,'RRRR-MM-DD')";

		try {

			st = cn.prepareStatement(sql.concat(sql2));

			st.setString(5, bean.getEmployeeId());
			st.setString(6,bean.getDate());
			System.out.println(bean.getDate());
			st.setString(1, bean.getAttendance());
			st.setString(2, bean.getGooutTime());
			st.setString(3, bean.getReturnTime());
			st.setString(4, bean.getLeaveWork());

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
