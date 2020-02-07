package LYH.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import LYH.Command;
import LYH.CommandAction;

public class MemberLogoutCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		session.invalidate();
		return new CommandAction(true, "homelist.do");
	}

}
