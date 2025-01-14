package user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IndexAction implements Action {
      @Override
      public String execute(HttpServletRequest request, HttpServletResponse response) {
           HttpSession session = request.getSession();

           String  nickname = (String) session.getAttribute("nickname");


           if(nickname == null){

             request.setAttribute("isLoggedIn", false);
           }

            return "/user/jsp/index.jsp";
      }
}
