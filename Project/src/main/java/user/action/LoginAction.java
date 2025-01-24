package user.action;

import user.dao.CustomerDao;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction  implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {
      String username = request.getParameter("username");
      String password = request.getParameter("password");
    String viewpath = null;
    CustomerVO vo = new CustomerVO();
    vo.setCus_id(username);
    vo.setCus_pw(password);

    CustomerVO loginResult = CustomerDao.login(vo); // 로그인 정보 가져오기


    if(loginResult != null){
      HttpSession session = request.getSession();
      session.setAttribute("nickname", loginResult.getCus_nickname());
      request.setAttribute("isLoggedIn", true);
      request.setAttribute("nickname", loginResult.getCus_nickname());
      viewpath="/user/jsp/test.jsp";
    }
    else{
      viewpath="/user/jsp/login/header.jsp";
    }
    return viewpath;
}
}

