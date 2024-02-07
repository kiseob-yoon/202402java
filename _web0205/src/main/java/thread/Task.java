package thread;

public class Task implements Runnable{

	@Override
	public void run() {
		System.out.println("task 시작");
		for(int i =0; i <5; i++) {
			System.out.println("task 진행");
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println("task 끝");
	}

}
