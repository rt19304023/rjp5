package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.OutputEmployeeInformationBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import exception.DataBaseException;

public class OraRegistEmployeeDao implements RegistEmployeeDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;
	private ArrayList user = new ArrayList();

	public OraRegistEmployeeDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ArrayList employeeRegist(OutputEmployeeInformationBean bean) {
		// TODO 自動生成されたメソッド・スタブ

		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = connector.getConnection();

		String sql = "INSERT into employee_list(name,pass,cardid,department_code,employeeid)";
		String sql2 = " values(?,?,?,?,employeeid.NEXTVAL)";

		String select = "SELECT * FROM employee_list WHERE cardid = ?";

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

			while(rs.next()) {
				OutputEmployeeInformationBean resultBean = new OutputEmployeeInformationBean();
				resultBean.setEmployeeId(rs.getString(1));
				resultBean.setName(rs.getString(2));
				resultBean.setPass(rs.getString(3));
				resultBean.setCardNumber(rs.getString(4));
				resultBean.setDepartmentCode(rs.getString(5));
				user.add(resultBean);
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

		return user;
	}

}
