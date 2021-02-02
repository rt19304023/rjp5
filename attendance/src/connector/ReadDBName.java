package connector;

import java.io.IOException;
import java.util.Properties;

import exception.SystemException;

public class ReadDBName {

	public ReadDBName() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public static String getDataBaseName() {
		Properties prop = new Properties();
		String database = null;

		try {
			prop.load(ReadDBName.class.getClassLoader().getResourceAsStream("property.db_name.properties"));

			database = prop.getProperty("dbname");

		}catch(IOException e) {
			throw new SystemException(e.getMessage(),e);
		}

		return database;
	}

}
