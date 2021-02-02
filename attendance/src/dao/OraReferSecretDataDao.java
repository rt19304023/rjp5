package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.ReferSecretDataBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBName;
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


		connector = (Connector)ConnectorFactory.getConnector(ReadDBName.getDataBaseName());

		cn = connector.getConnection();

		String sql ="SELECT birthday,secretproblem,secretanswer,department_code FROM employee_secret secret JOIN employee_list list ";
		String sql2 = "ON secret.employeeid = list.employeeid WHERE employeeid = ?";

		try {

			st = cn.prepareStatement(sql.concat(sql2));

			st.setString(1,employeeId);

			rs = st.executeQuery();

			rs.next();

			bean.setBirthday(rs.getString(1));
			bean.setSecretProblem(rs.getString(2));
			bean.setSecretAnswer(rs.getString(3));
			bean.setCode(rs.getString(4));

		}catch(SQLException e) {
			throw new DataBaseException(e.getMessage(),e);
		}

		return bean;
	}

}
