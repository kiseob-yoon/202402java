package thread;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.swing.JFrame;

class Clock2 implements Runnable{
	JFrame df; 
	
	public Clock2(JFrame df) { //WinEmp클래스에서 WinEmp를 받아옴
		this.df = df; 
	}



	@Override
	public void run() {
		for(;;) {
			LocalDateTime localDateTime = LocalDateTime.now();
			String localDateTimeFormat1 = 
					localDateTime.format(
							DateTimeFormatter.
							ofPattern("yyyy년 MM월 dd일 HH시 mm분 ss초"));
			
//			System.out.println(localDateTimeFormat1);
//			WinEmp.this.setTitle(localDateTimeFormat1);
			df.setTitle(localDateTimeFormat1); //WinEmp에 접근하여 setTitle을 시간의 형태로 변경
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
