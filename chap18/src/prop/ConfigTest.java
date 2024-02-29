package prop;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ConfigTest {

	public static void main(String[] args) throws IOException {
		String propFile = "src/main/java/config.properties"; //파일을 물리적으로 오픈
		Properties prop = new Properties(); 
		
		FileInputStream fis = new FileInputStream(propFile);
		
		prop.load(new BufferedInputStream(fis));
		
		System.out.println(prop.getProperty("db_ip")); 
		System.out.println(prop.getProperty("db_port"));
		System.out.println(prop.getProperty("test"));
		
	}

}
