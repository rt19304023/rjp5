package dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import command.CommandFactory;
import exception.ApplicationException;
import exception.SystemException;

public abstract class AbstractDaoFactory {

	public AbstractDaoFactory() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public static Object getFactory(String key) throws SystemException{

		Properties prop = new Properties();
		String name;
		Object factory;

		try {
			prop.load(CommandFactory.class.getClassLoader().getResourceAsStream("property/dao.properties"));
			name = prop.getProperty(key);

			Class c = Class.forName(name);

			factory = c.newInstance();
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
		return factory;
	}

	public abstract LoginDao getLoginDao();
	public abstract RegistEmployeeDao getRegistEmployeeDao();
	public abstract DeleteEmployeeDao getDeleteEmployeeDao();
	public abstract FixWorkingHoursDao getFixWorkingHoursDao();
	public abstract OutputEmployeeInformationDao getOutputEmployeeInformationDao();
	public abstract SearchDepartmentWorkingHoursDao getSearchDepartmentWorkingHoursDao();
	public abstract ChangeRegistInformationDao getChangeRegistInformationDao();
	public abstract ChangePasswordDao getChangePasswordDao();
	public abstract SearchWorkingHoursDao getSearchWorkingHoursDao();
	public abstract RegistSecretDataDao getRegistSecretDataDao();
	public abstract ReferSecretDataDao getReferSecretDataDao();
	public abstract SearchModifyHoursDao getSearchModifyHoursDao();

}
