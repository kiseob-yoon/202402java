package sec01.exam07;

public class User1 extends Thread{
	private Calculator calculator;
	
	
	
	public void setCalculator(Calculator calculator) {
		this.setName("User1"); //상속받은 Thread를 통해 Thread이름을 지정함
		this.calculator = calculator; //run메서드에서 Calculator에 접근하기 위한 것
	}



	@Override
	public void run() { //user1 객체를 생성해서 start메서드 실행하면 발동
		calculator.setMemory(100); //calculator객체의 setMemory메소드 호출
	}

}
