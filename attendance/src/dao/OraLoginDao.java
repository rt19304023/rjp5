package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.LoginBean;
import connector.Connector;
import connector.ConnectorFactory;
import exception.DataBaseException;

public class OraLoginDao implements LoginDao {

	private Connector connector = null;
	PreparedStatement st = null;

	public OraLoginDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public LoginBean loginDataSelect(String employeeid, String pass) {
		LoginBean bean = new LoginBean();
		// TODO 自動生成されたメソッド・スタブ
		try {

			connector = (Connector)ConnectorFactory.getConnector("oracle");

			Connection cn = connector.getConnection();

			String sql ="SELECT employeeid,pass FROM employee_list WHERE employeeid = ?";

			st = cn.prepareStatement(sql);

			st.setString (1,employeeid.toString());

			ResultSet rs = st.executeQuery();

			bean.setEmployeeId(rs.getString(1));
			bean.setPass(rs.getString(2));

		}catch(SQLException e) {
			throw new DataBaseException(e.getMessage(),e);
		}

		return bean;
	}

}
