package chap02;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
	
@Configuration //해당 클래스를 스프링 설정 클래스로 지정하는 역할
public class AppContext{
		
		@Bean //Bean 애노테이션을 붙인 메서드는 객체를 생성하고 알맞게 초기화해야 한다.
		public Greeter greeter() {
			Greeter g = new Greeter();
			g.setFormat("%s, 안녕하세요!"); //Greeter 클래스에 set메서드에 초기값 줌
			return g;
		}
		
	}

