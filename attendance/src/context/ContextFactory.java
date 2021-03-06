package context;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import exception.ApplicationException;
import exception.SystemException;

public class ContextFactory {

	public ContextFactory() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public static Object getContext(String key) throws SystemException{

		Properties prop = new Properties();
		String name;
		Object context;

		try {
			prop.load(ContextFactory.class.getClassLoader().getResourceAsStream("property/context.properties"));
			name = prop.getProperty(key);

			Class c = Class.forName(name);

			context = c.newInstance();
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
		return context;
	}

}
