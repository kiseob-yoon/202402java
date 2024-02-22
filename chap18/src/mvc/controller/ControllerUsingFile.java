package mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;

public class ControllerUsingFile extends HttpServlet {

    // <커맨드, 핸들러인스턴스> 매핑 정보 저장
    private Map<String, CommandHandler> commandHandlerMap = 
    		new HashMap<>();
    //hashMap사용하여 String과 CommandHandler 인터페이스의 정보를 담는다.
    public void init() throws ServletException {
        String configFile = getInitParameter("configFile");
        Properties prop = new Properties();
        String configFilePath = getServletContext().getRealPath(configFile);
        try (FileReader fis = new FileReader(configFilePath)) {
            prop.load(fis);
        } catch (IOException e) {
            throw new ServletException(e);
        }
        Iterator keyIter = prop.keySet().iterator();
        while (keyIter.hasNext()) {
            String command = (String) keyIter.next();
            String handlerClassName = prop.getProperty(command);
            try {
                Class<?> handlerClass = Class.forName(handlerClassName);
                CommandHandler handlerInstance = 
                        (CommandHandler) handlerClass.newInstance();
                commandHandlerMap.put(command, handlerInstance);
            } catch (ClassNotFoundException | InstantiationException 
            		| IllegalAccessException e) {
                throw new ServletException(e);
            }
        }
    }
    //Servlet 초기화 메서드로, 서블릿이 처음 로드될 때 한 번 호출된다.
    //설정 파일에서 커맨드와 핸들러 클래스의 매핑 정보를 읽어와 commandHandlerMap에 저장한다.
    
    //getInitParameter("configFile")를 통해 웹 애플리케이션의 초기화 매개변수 중 "configFile"에 설정된 값을 가져온다
    //Properties prop = new Properties();를 통해 Properties 객체를 생성한다.
    //getServletContext().getRealPath(configFile)를 사용하여 설정 파일의 실제 경로를 얻는다.
    //prop 객체에서 각 키(key)에 대한 값을 읽어와 커맨드와 핸들러 클래스 경로로 사용한다.
    //Class.forName(handlerClassName)을 통해 핸들러 클래스를 동적으로 로드한다.
    //동적으로 로드하는 것은 필요한 순간에만 사용하여 리소르를 절약한다.
    //handlerClass.newInstance를 통해 해당 클래스의 새로운 인스턴스를 생성한다.
    //생성한 핸들러 인스턴스를 commandHandlerMap에 커맨드를 키로하여 저장한다.
    

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("cmd");
        CommandHandler handler = commandHandlerMap.get(command);
        if (handler == null) {
            handler = new NullHandler();
        }
        String viewPage = null;
        try {
            viewPage = handler.process(request, response);
        } catch (Throwable e) {
            throw new ServletException(e);
        }
        if (viewPage != null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	        dispatcher.forward(request, response);
        }
    }
    //클라이언트로부터 전달된 커맨드를 확인하고, 그에 해당하는 핸들러를 찾는다.
    //찾은 핸들러를 실행하고, 핸들러의 실행 결과로 얻은 뷰 페이지 경로를 확인
    //뷰 페이지 경로가 존재하면 해당 경로로 포워딩하여 클라이언트에게 결과물을 보여준다.
}
