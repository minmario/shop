package user.action;

import user.dao.CartDAO;
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

        CustomerVO vo = new CustomerVO();
        vo.setCus_id(username);
        vo.setCus_pw(password);

        // 로그인 정보 가져오기
        CustomerVO loginResult = CustomerDAO.login(vo);

        HttpSession session = request.getSession();
        if (loginResult != null) {
            // 로그인 정보 저장
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("customer_info", loginResult);

            // 장바구니 수
            int cart_count = CartDAO.selectCartCount(loginResult.getId());
            request.setAttribute("cart_count", cart_count);

            return "Controller?type=index";
        } else {
            // 실패 시에만 isLoggedIn 설정
            if (username != null && password != null) {
                session.setAttribute("isLoggedIn", false);
            }

            return "/user/jsp/login/login.jsp";
        }
    }
}
