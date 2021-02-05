package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.OutputEmployeeInformationBean;
import connector.Connector;
import connector.ConnectorFactory;
import connector.ReadDBInformation;
import exception.DataBaseException;

public class OraChangeRegistInformationDao implements ChangeRegistInformationDao {

	private Connector connector = null;
	private Connection cn = null;
	private PreparedStatement st = null;
	private OutputEmployeeInformationBean bean;

	public OraChangeRegistInformationDao() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public OutputEmployeeInformationBean registInformationChange(OutputEmployeeInformationBean bean) {
		// TODO 自動生成されたメソッド・スタブ

		this.bean = bean;

		connector = (Connector)ConnectorFactory.getConnector(ReadDBInformation.getDataBaseInfo("dbname"));

		cn = (Connection)connector.getConnection();

		try {

			updateList();

			updateAssignment();

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
		return bean;
	}

	public void updateList() throws SQLException{

		String sql ="UPDATE employee_list SET employeeid = ?, name = ?, cardnumber = ?, department_code = ?";

		st = cn.prepareStatement(sql);

		st.setString(1, bean.getEmployeeId());
		st.setString(2, bean.getName());
		st.setString(3, bean.getCardNumber());
		st.setString(4, bean.getDepartmentCode());

		st.executeUpdate();

	}

	public void updateAssignment() throws SQLException{

		String sql = "UPDATE assignment = employeeid = ?, name = ? department_code = ?";

		st.setString(1, bean.getEmployeeId());
		st.setString(2, bean.getName());
		st.setString(3, bean.getDepartmentCode());

		st.executeUpdate();

	}


}
