package LYH.BoardCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.Command;
import LYH.CommandAction;
import LYH.Board.BoardDAO;
import LYH.Board.BoardDTO;

public class BoardUpdateCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String sNum = request.getParameter("c_board_num");
		int c_board_num = -1;
		if (sNum != null) {
			c_board_num = Integer.valueOf(sNum);
		}
		
		String c_board_title = request.getParameter("c_board_title");
		String c_board_content = request.getParameter("c_board_content");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO(c_board_num, null, c_board_title, c_board_content, null, 0, 0, 0, 0, 0, 0);
		dao.update(dto);
		
		return new CommandAction(true, "board_list.do");
	}

}
