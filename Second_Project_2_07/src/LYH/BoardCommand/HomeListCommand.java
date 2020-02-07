package LYH.BoardCommand;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.Command;
import LYH.CommandAction;
import LYH.Board.BoardDAO;
import LYH.Board.BoardDTO;


public class HomeListCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> recomlist = dao.recomlist();
		List<BoardDTO> cntlist = dao.cntlist();
		request.setAttribute("recomlist", recomlist);
		request.setAttribute("cntlist", cntlist);
		return new CommandAction(false, "homelist.jsp");
	}

}
