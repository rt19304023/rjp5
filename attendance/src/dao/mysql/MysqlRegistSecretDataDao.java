package dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.ReferSecretDataBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import dao.RegistSecretDataDao;
import exception.DataBaseException;

public class MysqlRegistSecretDataDao implements RegistSecretDataDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;

	public MysqlRegistSecretDataDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public void secretDataRegist(ReferSecretDataBean bean) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = connector.getConnection();

		String sql = "INSERT INTO employee_secret VALUES(?,STR_TO_DATE(?,'%Y-%c-%d'),?,?)";

		String sql2 = "UPDATE employee_list SET secret_code = 1 WHERE employeeid = ?";
		try {

			st = cn.prepareStatement(sql);

			st.setString(1, bean.getId());
			st.setString(2, bean.getBirthday());
			st.setString(3, bean.getSecretProblem());
			st.setString(4, bean.getSecretAnswer());

			st.executeUpdate();

			st = cn.prepareStatement(sql2);

			st.setString(1, bean.getId());

			st.execute();

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
