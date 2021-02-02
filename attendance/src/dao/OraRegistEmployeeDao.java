package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.OutputEmployeeInformationBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBName;
import exception.DataBaseException;

public class OraRegistEmployeeDao implements RegistEmployeeDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;

	public OraRegistEmployeeDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public OutputEmployeeInformationBean employeeRegist(OutputEmployeeInformationBean bean) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBName.getDataBaseName());

		cn = connector.getConnection();

		String sql = "INSERT into employee_list(name,pass,cardnumber,department_code,employeeid)";
		String sql2 = " values(?,?,?,?,employeeid.NEXTVAL)";

		String select = "SELECT * FROM employee_list WHERE cardnumber = ?";

		try {

			st = cn.prepareStatement(sql.concat(sql2));

			st.setString(1, bean.getName());
			st.setString(2, bean.getPass());
			st.setString(3, bean.getCardNumber());
			st.setString(4, bean.getDepartmentCode());

			st.executeUpdate();



			st = cn.prepareStatement(select);

			st.setString(1, bean.getCardNumber());

			rs = st.executeQuery();

			rs.next();

			bean.setEmployeeId(rs.getString(1));
			bean.setName(rs.getString(2));
			bean.setPass(rs.getString(3));
			bean.setCardNumber(rs.getString(4));
			bean.setDepartmentCode(rs.getString(5));


		}catch(SQLException e) {
			throw new DataBaseException(e.getMessage(),e);
		}

		return bean;
	}

}
