package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.LoginBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBName;
import exception.DataBaseException;

public class OraLoginDao implements LoginDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;

	public OraLoginDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public LoginBean loginDataSelect(String employeeid) {
		LoginBean bean = new LoginBean();
		// TODO 自動生成されたメソッド・スタブ


		connector = (Connector)ConnectorFactory.getConnector(ReadDBName.getDataBaseName());

		Connection cn = connector.getConnection();

		String sql ="SELECT employeeid,pass,department_code FROM employee_list WHERE employeeid = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString (1,employeeid);

			ResultSet rs = st.executeQuery();

			rs.next();

			bean.setEmployeeId(rs.getString(1));
			bean.setPass(rs.getString(2));
			bean.setCode(rs.getString(3));

		}catch(SQLException e) {
			throw new DataBaseException(e.getMessage(),e);
		}

		return bean;
	}

}
