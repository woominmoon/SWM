package LYH.BoardCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.Command;
import LYH.CommandAction;
import LYH.Board.BoardDAO;

public class BoardReplyCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String sNum = request.getParameter("c_board_num");
		int orinum = -1;
		if (sNum != null) {
			orinum = Integer.valueOf(sNum);
		}
		String c_board_author = request.getParameter("c_board_author");
		String c_board_title = request.getParameter("c_board_title");
		String c_board_content = request.getParameter("c_board_content");
		
		BoardDAO dao = new BoardDAO();
		dao.reply(orinum, c_board_author, c_board_title, c_board_content);
		
		return new CommandAction(true, "board_list.do");
	}

}
