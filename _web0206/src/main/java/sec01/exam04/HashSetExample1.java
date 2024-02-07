package sec01.exam04;

import java.util.*;

public class HashSetExample1 {
	public static void main(String[] args) {
		Set<String> set = new HashSet<String>();
		
		set.add("Java");
		set.add("JDBC");
		set.add("Servlet/JSP");
		set.add("Java");
		set.add("iBATIS");
		
//		Iterator<String> it = set.iterator(); //순차적인 자료를 구현하고자 함
//		while(it.hasNext()) { //hasnext는 자료를 있는지 없는지 체크
//			String str = it.next(); //next는 자료를 가져옴
//			System.out.println(str);
//		}
//순차적인 자료 순회		
		for(String str : set) {
			System.out.println(str);
		}
		
		int size = set.size();
		System.out.println("총 객체수: " + size);
		
		Iterator<String> iterator = set.iterator();
		while(iterator.hasNext()) {
			String element = iterator.next();
			System.out.println("\t" + element);
		}
		
		set.remove("JDBC"); //제거
		set.remove("iBATIS"); //제거
		
		System.out.println("총 객체수: " + set.size());
		
		for(String element : set) {
			System.out.println("\t" + element);
		}
		
		set.clear(); //지우기		
		if(set.isEmpty()) { System.out.println("비어 있음"); }
	}
}

