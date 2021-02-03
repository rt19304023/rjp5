package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.ReferSecretDataBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import exception.DataBaseException;

public class OraRegistSecretDataDao implements RegistSecretDataDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;

	public OraRegistSecretDataDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public void secretDataRegist(ReferSecretDataBean bean) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = connector.getConnection();

		String sql = "INSERT INTO employee_secret SET employeeid = ?, birthday = ?, secretproblem = ?, secretanswer = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString(1, bean.getId());
			st.setString(2, bean.getBirthday());
			st.setString(3, bean.getSecretProblem());
			st.setString(4, bean.getSecretAnswer());

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
