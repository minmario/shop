package user.action.customer;

import user.action.Action;
import user.dao.customer.PointDAO;
import user.vo.customer.CustomerVO;
import user.vo.customer.PointVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class MyPageAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO loginResult = (CustomerVO) session.getAttribute("customer_info");

        if (loginResult == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        } else {
            // 적립금 내역 가져오기
            List<PointVO> all = PointDAO.selectAll(loginResult.getId());

            session.setAttribute("all", all);
            return "/user/customer/jsp/mypage/mypage.jsp";
        }
    }
}
