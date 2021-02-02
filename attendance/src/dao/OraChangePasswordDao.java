package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBName;
import exception.DataBaseException;

public class OraChangePasswordDao implements ChangePasswordDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;

	public OraChangePasswordDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public void passChange(String id,String pass) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBName.getDataBaseName());

		cn = connector.getConnection();

		String sql = "UPDATE employee_list SET pass = ? WHERE employeeid =" + id ;

		try {

			st = cn.prepareStatement(sql);

			st.setString(1,pass);

			st.executeUpdate();

		}catch(SQLException e) {
			throw new DataBaseException(e.getMessage(),e);
		}
	}

}
