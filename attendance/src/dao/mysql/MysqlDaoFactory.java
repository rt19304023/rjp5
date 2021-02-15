package dao.mysql;

import dao.AbstractDaoFactory;
import dao.ChangePasswordDao;
import dao.ChangeRegistInformationDao;
import dao.DeleteEmployeeDao;
import dao.FixWorkingHoursDao;
import dao.LoginDao;
import dao.OutputEmployeeInformationDao;
import dao.ReferSecretDataDao;
import dao.RegistEmployeeDao;
import dao.RegistSecretDataDao;
import dao.SearchDepartmentWorkingHoursDao;
import dao.SearchModifyHoursDao;
import dao.SearchWorkingHoursDao;

public class MysqlDaoFactory extends AbstractDaoFactory {

	public MysqlDaoFactory() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public LoginDao getLoginDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlLoginDao();
	}

	@Override
	public RegistEmployeeDao getRegistEmployeeDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlRegistEmployeeDao();
	}

	@Override
	public DeleteEmployeeDao getDeleteEmployeeDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlDeleteEmployeeDao();
	}

	@Override
	public FixWorkingHoursDao getFixWorkingHoursDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlFixWorkingHoursDao();
	}

	@Override
	public OutputEmployeeInformationDao getOutputEmployeeInformationDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlOutputEmployeeInformationDao();
	}

	@Override
	public SearchDepartmentWorkingHoursDao getSearchDepartmentWorkingHoursDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlSearchDepartmentWorkingHoursDao();
	}

	@Override
	public ChangeRegistInformationDao getChangeRegistInformationDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlChangeRegistInformationDao();
	}

	@Override
	public ChangePasswordDao getChangePasswordDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlChangePasswordDao();
	}

	@Override
	public SearchWorkingHoursDao getSearchWorkingHoursDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlSearchWorkingHoursDao();
	}

	@Override
	public RegistSecretDataDao getRegistSecretDataDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlRegistSecretDataDao();
	}

	@Override
	public ReferSecretDataDao getReferSecretDataDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlReferSecretDataDao();
	}

	@Override
	public SearchModifyHoursDao getSearchModifyHoursDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new MysqlSearchModifyHoursDao();
	}

}
