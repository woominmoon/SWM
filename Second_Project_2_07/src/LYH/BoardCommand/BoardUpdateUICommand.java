package LYH.BoardCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.Command;
import LYH.CommandAction;
import LYH.Board.BoardDAO;
import LYH.Board.BoardDTO;

public class BoardUpdateUICommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

	      String sNum = request.getParameter("c_board_num");
	      int c_board_num = -1;
	      if (sNum != null) {
	         c_board_num = Integer.parseInt(sNum);
	      }
	      
	      BoardDAO dao = new BoardDAO();
	      BoardDTO dto = dao.updateui(c_board_num);
	      
	      request.setAttribute("dto", dto);
	      
	      return new CommandAction(false, "board_update.jsp");

	}

}
