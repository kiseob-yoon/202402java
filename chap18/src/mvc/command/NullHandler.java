package mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		res.sendError(HttpServletResponse.SC_NOT_FOUND);
		return null;
	}

}
//1. CommandHandler 인터페이스를 구현한다.
//2. process 메서드를 오버라이드하여 클라이언트에게 "404 Not Found"오류를 응답하고 null을 반환

