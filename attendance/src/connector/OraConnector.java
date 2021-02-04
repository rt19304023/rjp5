package connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import exception.DataBaseException;
import exception.SystemException;

public class OraConnector implements Connector {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String user = ReadDBInformation.getDataBaseInfo("user");
	private String pass = ReadDBInformation.getDataBaseInfo("pass");
	private String url = ReadDBInformation.getDataBaseInfo("url");
	private Connection connection = null;

	public OraConnector() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public Connection getConnection() {
		// TODO 自動生成されたメソッド・スタブ



		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			connection = DriverManager.getConnection(url,user,pass);

			connection.setAutoCommit(false);

		}catch(ClassNotFoundException e) {
			throw new SystemException(e.getMessage(),e);
		}catch(SQLException e) {
			throw new DataBaseException(e.getMessage(),e);
		}
		return connection;
	}
}
