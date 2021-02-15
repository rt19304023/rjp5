package dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.ReferSecretDataBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import dao.ReferSecretDataDao;
import exception.DataBaseException;

public class MysqlReferSecretDataDao implements ReferSecretDataDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;

	public MysqlReferSecretDataDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ReferSecretDataBean secretDataSelect(String employeeid) {

		ReferSecretDataBean resultbean = null;
		// TODO 自動生成されたメソッド・スタブ


		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = connector.getConnection();

		String sql ="SELECT * FROM secret_select WHERE employeeid = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString (1,employeeid);

			rs = st.executeQuery();

			while(rs.next()){
				ReferSecretDataBean bean = new ReferSecretDataBean();
				bean.setBirthday(rs.getString(2));
				bean.setSecretProblem(rs.getString(3));
				bean.setSecretAnswer(rs.getString(4));
				bean.setCode(rs.getString(5));
				System.out.println("BEAN:" + bean);
				resultbean = bean;
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

		return resultbean;
	}

}
