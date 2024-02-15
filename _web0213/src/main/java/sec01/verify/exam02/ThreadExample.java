package sec01.verify.exam02;

public class ThreadExample {

	public static void main(String[] args) {
		Thread mth = Thread.currentThread(); //현재 실행 중인 스레드를 반환
		System.out.println(mth.getName()); //main출력
		
		Thread thread1 = new MovieThread();
		System.out.println(thread1.getName()); 
		thread1.start(); //movie출력
		
		Thread thread2 = new Thread(new MusicRunnable());
		thread2.setName("Music");
		System.out.println(thread2.getName()); //music출력
		thread2.start(); //음악재생 출력
	}

}
