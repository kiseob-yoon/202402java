package stream;

import java.util.Arrays;
import java.util.List;

public class StreamEx1 {

	public static void main(String[] args) {
		List<Integer> list 
			= Arrays.asList(1,2,3,4,5); //메서드를 사용하여 배열을 리스트로 변환
		//안에 정수들을 배열로 만들고, 이를 리스트로 변환하여 list 변수에 할당한다.
		
		list.stream() //스트림 생성
		.filter(i->i%2==0) //중간 연산으로, 스트림의 요소를 필터링함
		.forEach(i->System.out.println(i)); //필터링을 이용해 최종결과
//		  = new ArrayList<>();
//		  list.add(1);list.add(1);list.add(1);
//		  list.add(1);list.add(1);
//		for(Integer i : list) {
//			if(i % 2 == 0) {
//				System.out.println(i);
//			}
//		}
	}

}
