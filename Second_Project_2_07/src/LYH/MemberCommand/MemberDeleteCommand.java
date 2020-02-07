package LYH.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.Command;
import LYH.CommandAction;
import LYH.Member.MemberDAO;

public class MemberDeleteCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String c_member_id = request.getParameter("c_member_id");
		String c_member_password = request.getParameter("c_member_password");

		MemberDAO dao = new MemberDAO();

		dao.delete(c_member_id, c_member_password);
		
		return new CommandAction(false, "member_list.do");

	}

}
