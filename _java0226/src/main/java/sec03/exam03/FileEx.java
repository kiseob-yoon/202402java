package sec03.exam03;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileEx {

	public static void main(String[] args) {
		File dir2 = new File("c:/temp/images"); //해당 경로에 생성할 폴더 매핑
		dir2.mkdirs(); //폴더 생성
		
		File dir = new File("c:/temp"); 
		File[] list = dir.listFiles();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(File file : list) {
			
			System.out.print(
					sdf.format(new Date(file.lastModified()))+ "\t"); //날짜
			if(file.isDirectory()) { //디렉토리일 경우
				System.out.print("<DIR>\t");
			} else {
				System.out.print(file.length()+ "\t"); //크기
			}
			System.out.println(file.getName()); //이름
		}
	}

}
//디렉토리 정보 출력
