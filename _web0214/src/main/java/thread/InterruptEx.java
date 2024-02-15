package thread;

public class InterruptEx {

	public static void main(String[] args) {
		PrintThread3 printThread3 = new PrintThread3();
		printThread3.start();

		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		printThread3.interrupt();
	}

}
