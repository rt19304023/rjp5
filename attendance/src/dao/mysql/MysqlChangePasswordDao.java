package dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import dao.ChangePasswordDao;
import exception.DataBaseException;

public class MysqlChangePasswordDao implements ChangePasswordDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;

	public MysqlChangePasswordDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public void passChange(String id,String pass) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = connector.getConnection();

		String sql = "UPDATE employee_list SET pass = ? WHERE employeeid = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString(1,pass);

			st.setString(2,id);

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
