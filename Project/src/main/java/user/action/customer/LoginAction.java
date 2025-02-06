package user.action.customer;

import org.mindrot.jbcrypt.BCrypt;
import user.action.Action;
import user.dao.customer.CartDAO;
import user.dao.customer.CategoryDAO;
import user.dao.customer.CustomerDAO;
import user.vo.customer.CustomerVO;
import user.vo.customer.MajorCategoryVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class LoginAction  implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 구매자 조회
        CustomerVO loginResult = CustomerDAO.selectCustomerByCusId(username);

        if (loginResult == null) {
            // 로그인 실패
            session.setAttribute("isLoggedIn", false);
            request.setAttribute("isNotFound", true);
            return "/user/customer/jsp/login/login.jsp";
        }

        // 비밀번호 검증
        if (BCrypt.checkpw(password, loginResult.getCus_pw())) {
            // 로그인 정보 저장
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("customer_info", loginResult);

            // 장바구니 수
            int cart_count = CartDAO.selectCartCount(loginResult.getId());
            session.setAttribute("cart_count", cart_count);

            // 카테고리
            List<MajorCategoryVO> categories = CategoryDAO.getCategory();

            if (categories != null && !categories.isEmpty()) {
                request.setAttribute("categories", categories);
            }

            return "/user/customer/jsp/index.jsp";
        } else {
            // 실패 시에만 isLoggedIn 설정
            if (username != null && password != null) {
                session.setAttribute("isLoggedIn", false);
            }

            return "/user/customer/jsp/login/login.jsp";
        }
    }
}
