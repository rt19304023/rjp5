package dao.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.OutputEmployeeInformationBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import dao.OutputEmployeeInformationDao;
import exception.DataBaseException;

public class MysqlOutputEmployeeInformationDao implements OutputEmployeeInformationDao {

	private Connection cn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;
	private ArrayList Information = new ArrayList();

	public MysqlOutputEmployeeInformationDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public ArrayList employeeInFormationSelect(String employeeId) {
		// TODO 自動生成されたメソッド・スタブ



		Connector connect = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = connect.getConnection();

		String sql = "SELECT * FROM list_select WHERE employeeid = ?";

		try {

			st = cn.prepareStatement(sql);

			st.setString(1, employeeId);

			rs = st.executeQuery();

			while(rs.next()){
				OutputEmployeeInformationBean bean = new OutputEmployeeInformationBean();
				bean.setEmployeeId(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setCardNumber(rs.getString(3));
				bean.setDepartmentCode(rs.getString(4));
				bean.setDepartmentName(rs.getString(5));
				Information.add(bean);
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


		return Information;
	}

}
