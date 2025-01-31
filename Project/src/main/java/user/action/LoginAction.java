package user.action;

import user.dao.CartDAO;
import user.dao.CategoryDAO;
import user.dao.CustomerDAO;
import user.vo.CustomerVO;
import user.vo.MajorCategoryVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

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
            session.setAttribute("cart_count", cart_count);

            // 카테고리
            List<MajorCategoryVO> categories = CategoryDAO.getCategory();

            if (categories != null && categories.size() > 0) {
                request.setAttribute("categories", categories);
            }

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
