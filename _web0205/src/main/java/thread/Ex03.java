package thread;

public class Ex03 {
	public static void main(String[] args) {
		Thread th = new Thread(new Runnable() { //Runnable메서드로 스레드를 생성

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
		});
		th.start();
		mainTask();
	}
	public static void mainTask() {
		System.out.println("시작");
		for(int i =0; i <5; i++) {
			System.out.println("진행");
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println("끝");
	}

}
