package sec01.exam07;

public class Calculator {
	private int memory;
	
	public int getMemory() { //필드에 값을 넘겨주기 위한 것
		return memory;
	}
	public synchronized void setMemory(int memory) { //메소드 호출로 메모리값 받음
		this.memory = memory;
		try {
			Thread.sleep(2000); //2초 딜레이
			
		} catch(InterruptedException e) {}
		System.out.println(Thread.currentThread().getName() + ": " + this.memory);
	} //현재 실행중인 스레드의 이름을 getName으로 받아오고 setMemory에서 전달받은 값을 출력한다.
}
