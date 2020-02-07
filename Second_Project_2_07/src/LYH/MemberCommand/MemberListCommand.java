package LYH.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.Command;
import LYH.CommandAction;
import LYH.PageTO;
import LYH.Member.MemberDAO;

public class MemberListCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String sCurpage = request.getParameter("curPage");
		int curPage = 1;
		if (sCurpage != null) {
			curPage = Integer.parseInt(sCurpage);
		}
		MemberDAO dao = new MemberDAO();
		PageTO to = dao.list(curPage);
		request.setAttribute("list", to.getMlist());
		request.setAttribute("to", to);
		return new CommandAction(false, "member_list.jsp");
	}

}
