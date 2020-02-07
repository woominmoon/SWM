package LYH.BoardCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.Command;
import LYH.CommandAction;

public class BoardReplyUICommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String sNum = request.getParameter("c_board_num");
		int c_board_num = -1;
		if (sNum != null) {
			c_board_num = Integer.parseInt(sNum);
		}
		String c_board_title = request.getParameter("c_board_title");
		// re: 제목
		request.setAttribute("c_board_num", c_board_num);
		request.setAttribute("c_board_title", c_board_title);
		return new CommandAction(false, "board_reply.jsp");
	}

}
