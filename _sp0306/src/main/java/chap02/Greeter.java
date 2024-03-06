package chap02;

public class Greeter {
	private String format;
	
	public String greet(String guest) {
		return String.format(format, guest); //지정된 형식을 사용하여 문자열을 생성
	}
	public void setFormat(String format) { //set메서드를 호출한 곳에서 값을 받아와 format에 저장
		this.format = format;
	}
}
