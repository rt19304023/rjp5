package connector;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import command.CommandFactory;
import exception.ApplicationException;
import exception.SystemException;

public class ConnectorFactory {

	public ConnectorFactory() {
		// TODO 自動生成されたコンストラクター・スタブ
	}
	public static Object getConnector(String key) throws SystemException{

		Properties prop = new Properties();
		String name;
		Object connector;

		try {
			prop.load(CommandFactory.class.getClassLoader().getResourceAsStream("property.connector.properties"));
			name = prop.getProperty(key);

			Class c = Class.forName(name);

			connector = c.newInstance();
		}catch(FileNotFoundException e) {
			throw new ApplicationException(e.getMessage(),e);
		}catch(IOException e) {
			throw new ApplicationException(e.getMessage(),e);
		}catch(ClassNotFoundException e) {
			throw new ApplicationException(e.getMessage(),e);
		}catch(IllegalAccessException e) {
			throw new ApplicationException(e.getMessage(),e);
		}catch(InstantiationException e) {
			throw new ApplicationException(e.getMessage(),e);
		}
		return connector;
	}

}
