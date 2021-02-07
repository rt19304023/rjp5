package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.LoginBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import exception.DataBaseException;

public class OraLoginDao implements LoginDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;

	public OraLoginDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public LoginBean loginDataSelect(String employeeid) {
		LoginBean bean = new LoginBean();
		// TODO 自動生成されたメソッド・スタブ


		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = connector.getConnection();

		System.out.println("SELECT前");

		String sql ="SELECT employeeid,pass,department_code, name FROM employee_list WHERE employeeid = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString (1,employeeid);

			rs = st.executeQuery();

			if(rs == null)
				System.out.println("中身がない");

			while(rs.next()) {
				bean.setEmployeeId(rs.getString(1));
				bean.setPass(rs.getString(2));
				bean.setCode(rs.getString(3));
				bean.setName(rs.getString(4));
				System.out.println(bean);
			}

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
