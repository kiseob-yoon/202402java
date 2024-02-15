package ramda;

public class MyfuncEx {

	public static void main(String[] args) {
		MyFunc mf, mf2, mf3;
		
		mf3 = (x) -> System.out.println(x); // 한 구문만 있으면 {}중괄호를 생략할 수 있다.
		
		mf3.method(20);
		
		mf = new MyFunc() {
			
			@Override
			public void method(int x) {
				System.out.println(x);
			}
		};
		mf.method(10);
		
		mf2 = (x) -> {System.out.println("method");};
		mf2.method(10); //람다식은 재정의해야 할 메서드가 오직 하나여야 한다.
	}

}
