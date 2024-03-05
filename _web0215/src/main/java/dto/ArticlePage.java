package dto;

import java.util.List;

public class ArticlePage {
	private int total; //전체 게시글의 개수
	private int currentPage;
	private List<Board> content;
	private int totalPages; //전체 페이지의 개수
	private int startPage;
	private int endPage;
	public ArticlePage(int total, int currentPage, 
									int size,List<Board> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		if(total == 0) {
			totalPages =0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;
			if(total % size > 0) {
				totalPages++;
			}
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if(modVal == 0) startPage -=5;
			
			endPage = startPage + 4;
			if(endPage > totalPages) endPage = totalPages;
		}
	}
	public boolean hasNoArticles() {
		return total == 0;
	}

	public boolean hasArticles() {
		return total > 0;
	}
	public int getTotal() {
		return total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public List<Board> getContent() {
		return content;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}

	
	

	
	
}
