package LYH;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LYH.BoardCommand.BoardDeleteCommand;
import LYH.BoardCommand.BoardListCommand;
import LYH.BoardCommand.BoardReadCommand;
import LYH.BoardCommand.BoardSearchCommand;
import LYH.BoardCommand.BoardUpdateCommand;
import LYH.BoardCommand.BoardUpdateUICommand;
import LYH.BoardCommand.BoardInsertCommand;
import LYH.BoardCommand.BoardInsertUICommand;
import LYH.BoardCommand.BoardReplyCommand;
import LYH.BoardCommand.BoardReplyUICommand;
import LYH.BoardCommand.HomeListCommand;
import LYH.BoardCommand.RecommendCommand;
import LYH.MemberCommand.CheckidCommand;
import LYH.MemberCommand.MemberDeleteCommand;
import LYH.MemberCommand.MemberDeleteUICommand;
import LYH.MemberCommand.MemberInsertCommand;
import LYH.MemberCommand.MemberInsertUICommand;
import LYH.MemberCommand.MemberListCommand;
import LYH.MemberCommand.MemberLoginCommand;
import LYH.MemberCommand.MemberLogoutCommand;
import LYH.MemberCommand.MemberUpdateCommand;



/**
 * Servlet implementation class FrontController
 */

public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String cPath = request.getContextPath();
		String what = uri.substring(cPath.length());
		Command com = null;
		
		
		switch (what) {
		case "/homelist.do":
			com = new HomeListCommand();
			break;
		case "/board_list.do":
			com = new BoardListCommand();
			break;
		case "/board_read.do":
			com = new BoardReadCommand();
			break;
		case "/board_insertui.do":
			com = new BoardInsertUICommand();
			break;
		case "/board_insert.do":
			com = new BoardInsertCommand();
			break;
		case "/board_replyui.do":
			com = new BoardReplyUICommand();
			break;
		case "/board_reply.do":
			com = new BoardReplyCommand();
			break;
		case "/board_delete.do":
			com = new BoardDeleteCommand();	
			break;		
		case "/board_updateui.do":
			com = new BoardUpdateUICommand();
			break;			
		case "/board_update.do":
			com = new BoardUpdateCommand();
			break;	
		case "/board_search.do":
	        com = new BoardSearchCommand();
	        break;
		case "/recom.do":
	        com = new RecommendCommand();
	        break;
			
	        
		case "/member_list.do":
			com = new MemberListCommand();
			break;
		case "/member_insertui.do":
			com = new MemberInsertUICommand();
			break;	
		case "/member_insert.do":
			com = new MemberInsertCommand();
			break;
		case "/member_deleteui.do":
			com = new MemberDeleteUICommand();
			break;
		case "/member_delete.do":
			com = new MemberDeleteCommand();
			break;
		
		case "/member_update.do":
			com = new MemberUpdateCommand();
			break;		
		case "/member_login.do":
			com = new MemberLoginCommand();
			break;
		case "/member_logout.do":
			com = new MemberLogoutCommand();
			break;
		case "/checkid.do":
			com = new CheckidCommand();
			break;
		default:
			break;
		}
		
		
		if (com != null) {
			CommandAction action = com.execute(request, response);
			if (action != null) {
				if (action.isRedirect()) {
					response.sendRedirect(action.getWhere());
				} else {
					request.getRequestDispatcher(action.getWhere()).forward(request, response);
				} 
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
