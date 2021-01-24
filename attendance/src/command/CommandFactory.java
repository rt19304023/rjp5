package command;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import context.RequestContext;
import exception.ApplicationException;
import exception.SystemException;

public class CommandFactory {

	public CommandFactory() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public static Object getCommand(RequestContext req) throws SystemException{

		Properties prop = new Properties();
		String name;
		Object command;

		try {
			prop.load(CommandFactory.class.getClassLoader().getResourceAsStream("property.command.properties"));
			name = prop.getProperty(req.getCommandPath());

			Class c = Class.forName(name);

			command = c.newInstance();
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
		return command;
	}

}
