package dao;

public class OraDaoFactory extends AbstractDaoFactory {

	public OraDaoFactory() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	public LoginDao getLoginDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraLoginDao();
	}

	@Override
	public RegistEmployeeDao getRegistEmployeeDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraRegistEmployeeDao();
	}

	@Override
	public DeleteEmployeeDao getDeleteEmployeeDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraDeleteEmployeeDao();
	}

	@Override
	public FixWorkingHoursDao getFixWorkingHoursDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraFixWorkingHoursDao();
	}

	@Override
	public OutputEmployeeInformationDao getOutputEmployeeInformationDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraOutputEmployeeInformationDao();
	}

	@Override
	public SearchDepartmentWorkingHoursDao getSearchDepartmentWorkingHoursDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraSearchDepartmentWorkingHoursDao();
	}

	@Override
	public ChangeRegistInformationDao getChangeRegistInformationDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraChangeRegistInformationDao();
	}

	@Override
	public ChangePasswordDao getChangePasswordDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraChangePasswordDao();
	}

	@Override
	public SearchWorkingHoursDao getSearchWorkingHoursDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraSearchWorkingHoursDao();
	}

	@Override
	public RegistSecretDataDao getRegistSecretDataDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraRegistSecretDataDao();
	}

	@Override
	public ReferSecretDataDao getReferSecretDataDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraReferSecretDataDao();
	}

	@Override
	public SearchModifyHoursDao getSearchModifyHoursDao() {
		// TODO 自動生成されたメソッド・スタブ
		return new OraSearchModifyHoursDao();
	}

}
