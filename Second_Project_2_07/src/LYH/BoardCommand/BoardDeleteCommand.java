package LYH.BoardCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.Command;
import LYH.CommandAction;
import LYH.Board.BoardDAO;

public class BoardDeleteCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String snum = request.getParameter("c_board_num");
		int c_board_num = -1;
		if (snum != null) {
			c_board_num = Integer.parseInt(snum);
		}
		
		BoardDAO dao = new BoardDAO();
		dao.delete(c_board_num);
		
		return new CommandAction(true,"board_list.do");
	}

}
