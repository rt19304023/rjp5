package bean;

import java.io.Serializable;

public class ReferSecretDataBean implements Serializable {
	private String code;
	private String birthday;
	private String secretProblem;
	private String secretAnswer;

	public ReferSecretDataBean() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getSecretProblem() {
		return secretProblem;
	}

	public void setSecretProblem(String secretProblem) {
		this.secretProblem = secretProblem;
	}

	public String getSecretAnswer() {
		return secretAnswer;
	}

	public void setSecretAnswer(String secretAnswer) {
		this.secretAnswer = secretAnswer;
	}

}
