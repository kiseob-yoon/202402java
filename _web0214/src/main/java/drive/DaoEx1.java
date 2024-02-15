package drive;

import java.util.List;

import dao.BoardDao;
import dto.Board;

public class DaoEx1 {

	public static void main(String[] args) {
		BoardDao dao = BoardDao.getInstance(); 
		List<Board> list = dao.selectList();
		for(Board bo : list){
			System.out.println(bo);
		}
	}

}
