package user.action;

import user.dao.CustomerDAO;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction  implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        CustomerVO loginResult = null;

        try {
            CustomerVO vo = new CustomerVO();
            vo.setCus_id(username);
            vo.setCus_pw(password);

            // 로그인 정보 가져오기
            loginResult = CustomerDAO.login(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        if (loginResult != null) {
            // 로그인 정보 저장
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("customer_info", loginResult);

            return "/user/jsp/index.jsp";
        } else {
            // 실패 시에만 isLoggedIn 설정
            if (username != null && password != null) {
                session.setAttribute("isLoggedIn", false);
            }

            return "/user/jsp/login/login.jsp";
        }
    }
}
