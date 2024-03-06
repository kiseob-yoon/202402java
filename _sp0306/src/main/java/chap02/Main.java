package chap02;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx = //설정 정보를 이용해서 빈 객체를 생성한다.
				new AnnotationConfigApplicationContext(AppContext.class);
		Greeter g = ctx.getBean("greeter",Greeter.class); //스프링 컨테이너에서 이름이 "greeter"인 빈을 가져온다. 
		String msg = g.greet("스프링"); //bean을 활용한 메시지 출력
		System.out.println(msg);
		ctx.close();
	}
//main에서는 객체를 생성하지 않고 AppContext에 맡김. Bean은 spring container이다. 
}
