package ramda;

public class MyFunctionalInterfaceEx {

	public static void main(String[] args) {
		MyFunctionalInterface f1, f2;
		
		f2 = new MyFunctionalInterface() {
			
			@Override
			public int method(int x, int y) {
				
				return sum(x, y);
			}
		};
		System.out.println(f2.method(100, 200));
		
		f1 = (x, y) -> sum(x,y);{
			System.out.println(f1.method(10, 20));
		};
		//f1.method를 호출하면 실질적으로 (x, y) -> sum(x,y)가 수행됨
		//(x, y)는 인터페이스에서 정의된 파라미터를 sum(x,y)에 넘겨 람다식을 완성
		//객체 생성을 하지 않고 main에서 인터페이스에 접근하기 위한 것으로 람다식이 사용됨
	}
	
	public static int sum(int x, int y) {
		return x+y;
	}

}
