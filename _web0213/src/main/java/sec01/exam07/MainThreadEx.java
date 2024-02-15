package sec01.exam07;

public class MainThreadEx {

	public static void main(String[] args) {
		Calculator cal = new Calculator();
		
		User1 user1 = new User1();
		user1.setCalculator(cal);
		user1.start();
		
		User2 user2 = new User2();
		user2.setCalculator(cal);
		user2.start();
//user1이 Calculator의 setMemory를 실행하는 순간 Calculator의 객체를 잠금하여 user2는 User1이 setMemory를 모두 실행할 동안 대기해야 한다.
//user1이 setMemory를 실행하고 난 뒤에 user2가 실행됨
	}

}
