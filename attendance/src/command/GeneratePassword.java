package command;

import java.util.Random;

public class GeneratePassword {


	public GeneratePassword() {
		// TODO 自動生成されたコンストラクター・スタブ
	}


	public static String generatePassword(int num) {

		String sb="";

		Random rnd = new Random();


		for(int i = 0; i < num ;i++) {


			int value = rnd.nextInt(83) + 40;

			if(value == 45 || value == 47 || (value >= 58 && value <=63) || (value >= 91 && value <= 96)) {

				value += 16;

			}


			char uni = (char)Integer.parseInt(Integer.toHexString(value),16);
			sb += uni;

		}
		System.out.println("	" +sb);
		return sb;
	}

}
