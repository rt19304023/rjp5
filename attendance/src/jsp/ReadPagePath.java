package jsp;

import java.io.IOException;
import java.util.Properties;

import exception.SystemException;

public class ReadPagePath {

	public ReadPagePath() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public static String getPath(String code) {

		String path = null;

		Properties prop = new Properties();


		try {

			prop.load(ReadPagePath.class.getClassLoader().getResourceAsStream("jsp.property.top_page.properties"));

			path = prop.getProperty(code);


		}catch(IOException e ) {
			throw new SystemException(e.getMessage(),e);
		}

		return path;
	}

}
