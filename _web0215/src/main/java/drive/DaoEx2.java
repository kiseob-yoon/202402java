package drive;

import java.util.List;

import dao.BoardDao;
import dto.Board;

public class DaoEx2 {

	public static void main(String[] args) {
		BoardDao dao = BoardDao.getInstance(); 
		List<Board> list = dao.selectList();
		list.stream().forEach(s->{ //자료구조를 stream으로 변환해야 forEach구문을 사용할 수 있다. forEach를 사용하여 list에 있는 데이터를 s(매개변수)에 담음
			System.out.println(s);
		});
	}

}
