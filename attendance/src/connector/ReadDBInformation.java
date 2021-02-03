package connector;

import java.io.IOException;
import java.util.Properties;

import exception.SystemException;

public class ReadDBInformation {

	public ReadDBInformation() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public static String getDataBaseInfo(String key) {
		Properties prop = new Properties();
		String database = null;

		try {
			prop.load(ReadDBInformation.class.getClassLoader().getResourceAsStream("property.db_Info.properties"));

			database = prop.getProperty(key);

		}catch(IOException e) {
			throw new SystemException(e.getMessage(),e);
		}

		return database;
	}

}
