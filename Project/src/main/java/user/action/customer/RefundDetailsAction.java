package user.action.customer;

import user.action.Action;
import user.dao.customer.OrderDAO;
import user.dao.customer.PointDAO;
import user.vo.customer.CustomerVO;
import user.vo.customer.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RefundDetailsAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        }

        String action = request.getParameter("action");
        String order_code = request.getParameter("order_code");
        String prod_no = request.getParameter("prod_no");

        String viewPath = null;
        if (action != null) {
            switch (action) {
                case "select":
                    OrderVO refund = OrderDAO.selectDetailsByStatus(cvo.getId(), prod_no, order_code, "7");
                    int point_amount = PointDAO.selectPointAmount(cvo.getId(), order_code);
                    request.setAttribute("refund", refund);
                    request.setAttribute("point_amount", point_amount);
                    viewPath = "/user/customer/jsp/mypage/refundDetails.jsp";
                    break;
            }
        }
        return viewPath;
    }
}
