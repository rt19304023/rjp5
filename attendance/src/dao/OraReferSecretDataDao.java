package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.ReferSecretDataBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import exception.DataBaseException;

public class OraReferSecretDataDao implements ReferSecretDataDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;

	public OraReferSecretDataDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ReferSecretDataBean secretDataSelect(String employeeId) {

		ReferSecretDataBean bean = new ReferSecretDataBean();
		// TODO 自動生成されたメソッド・スタブ


		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = connector.getConnection();

		String sql ="SELECT * FROM secret_select WHERE employeeid = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString(1,employeeId);

			rs = st.executeQuery();

			rs.next();

			bean.setBirthday(rs.getString(1));
			bean.setSecretProblem(rs.getString(2));
			bean.setSecretAnswer(rs.getString(3));
			bean.setCode(rs.getString(4));

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
