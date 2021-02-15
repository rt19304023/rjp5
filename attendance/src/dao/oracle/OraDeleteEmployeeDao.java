package dao.oracle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.OutputEmployeeInformationBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import dao.DeleteEmployeeDao;
import exception.DataBaseException;

public class OraDeleteEmployeeDao implements DeleteEmployeeDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;
	private ArrayList user = new ArrayList();

	public OraDeleteEmployeeDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ArrayList employeeDelete(String employeeId) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = connector.getConnection();

		String sql = "SELECT employeeid,name FROM employee_list WHERE employeeid = ?";

		String sql2 = "DELETE FROM employee_list WHERE employeeId = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString(1, employeeId);

			rs = st.executeQuery();

			while(rs.next()) {
				OutputEmployeeInformationBean bean = new OutputEmployeeInformationBean();

				bean.setEmployeeId(rs.getString(1));
				bean.setName(rs.getString(2));
				user.add(bean);

			}

			st = cn.prepareStatement(sql2);

			st.setString(1,employeeId);

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
		return user;
	}
}
