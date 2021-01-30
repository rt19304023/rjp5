package connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import exception.SystemException;

public class OraConnector implements Connector {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String user = "attendance";
	private String pass = "attendance";
	private String orcl = "jdbc:oracle:thin:@localhost:1521:orcl";

	public OraConnector() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public Connection getConnection() {
		// TODO 自動生成されたメソッド・スタブ

		Connection connection = null;

		try {
			Class.forName(driver);

			connection = DriverManager.getConnection(orcl,user,pass);

			connection.setAutoCommit(false);

		}catch(ClassNotFoundException | SQLException e) {
			throw new SystemException(e.getMessage(),e);
		}

		return connection;
	}

}
