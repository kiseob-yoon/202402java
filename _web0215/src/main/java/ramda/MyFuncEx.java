package ramda;

public class MyFuncEx {

	public static void main(String[] args) {
		MyFunc mf = ()-> {
			System.out.println("람다1");
		};
		mf.aaa(); //출력
		
		MyFunc mf1 = new MyFunc() {
			
			@Override
			public void aaa() {
				System.out.println("람다1");
			}
		};mf1.aaa();
	}

}
