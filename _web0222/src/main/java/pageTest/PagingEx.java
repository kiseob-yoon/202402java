package pageTest;

public class PagingEx {

	public static void main(String[] args) {
		int totalPage = 10;
		for(int i=1; i <=10; i++) {
			pageTest(i, totalPage);
		}

	}
	public static void pageTest(int currentPage, int totalPages) {		
		int modVal = currentPage % 5;
		int startPage = currentPage / 5 * 5 + 1;
		if(modVal == 0) startPage -=5;
		
		int endPage = startPage + 4;
		if(endPage > totalPages) endPage = totalPages;
		System.out.println("startPage " + startPage + ", endPage: " + endPage);
	}

}
