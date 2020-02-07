package LYH.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.Command;
import LYH.CommandAction;
import LYH.Member.MemberDAO;

public class CheckidCommand implements Command{

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		 String id = request.getParameter("id");
	      Boolean result = new MemberDAO().idcheck(id);
	      if(result || id.isEmpty()) {
	         response.getWriter().print("0");   //사용 불가능
	      }else {
	         response.getWriter().print("1");   //사용 가능
	      }
	      return null;

	}
	
}
