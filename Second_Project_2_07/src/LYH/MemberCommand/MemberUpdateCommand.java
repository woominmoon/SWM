package LYH.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.Command;
import LYH.CommandAction;
import LYH.Member.MemberDAO;
import LYH.Member.MemberDTO;

public class MemberUpdateCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String c_member_id = request.getParameter("c_member_id");
		String c_member_password = request.getParameter("c_member_password");
		String c_member_name = request.getParameter("c_member_name");
		String c_member_birth = request.getParameter("c_member_birth");
		String c_member_gender = request.getParameter("c_member_gender");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(c_member_id, c_member_password, c_member_name, c_member_birth, c_member_gender, 0);
		dao.update(dto);
		return new CommandAction(false, "homelist.do");
		
	}

}
