package controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import exception.ApplicationException;
import exception.SystemException;

public class ControllerFactory {

	public ControllerFactory() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public static Object getController(String key) throws SystemException{

		Properties prop = new Properties();
		String name;
		Object controller;

		try {
			prop.load(ControllerFactory.class.getClassLoader().getResourceAsStream("property/controller.properties"));
			name = prop.getProperty(key);

			Class c = Class.forName(name);

			controller = c.newInstance();
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
		return controller;
	}

}
