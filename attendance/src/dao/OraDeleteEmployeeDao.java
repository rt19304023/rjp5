package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import exception.DataBaseException;

public class OraDeleteEmployeeDao implements DeleteEmployeeDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;

	public OraDeleteEmployeeDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public void employeeDelete(String employeeId) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = connector.getConnection();

		String sql = "DELETE FROM employee_list WHERE employeeId = ?";

		try {
			st = cn.prepareStatement(sql);

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
	}
}
