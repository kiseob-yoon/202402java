package mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {
	public String process(HttpServletRequest req, HttpServletResponse res)
	throws Exception;
}

//1. HttpServletRequest및 HttpServletResponse를 매개변수로 받아서 예외를 던진다.
//2. 구체적인 핸들러 클래스에서 이 인터페이스를 구현하여 각 핸들러에 맞게 동작을 정의한다.
//3. HttpServletRequest,HttpServletResponse는 Java Servlet 컨테이너에서 제공하는 인터페이스
//4. HttpServletRequest:
//클라이언트가 전송한 HTTP 요청의 헤더, 매개변수, 쿠키, 세션, URL등의 정보를 제공한다.
//Servlet에서 이 객체를 사용하여 클라이언트의 요청을 처리하고 필요한 정보를 추출할 수 있다.
//5. HttpServletResponse:
//서버에서 클라이언트로 데이터를 보낼 때 사용된다. 이 데이터는 HTML 페이지, 이미지, 파일 다운로드 등 다양할 수 있다.
//응답 헤더 설정, 쿠키 추가, 추렭 스트림을 통한 응답 데이터 전송 등이 가능하다.
