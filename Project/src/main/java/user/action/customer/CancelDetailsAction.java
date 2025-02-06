package user.action.customer;

import user.action.Action;
import user.dao.customer.OrderDAO;
import user.dao.customer.PointDAO;
import user.vo.customer.CustomerVO;
import user.vo.customer.OrderVO;
import user.vo.customer.PointVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CancelDetailsAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        }

        String action = request.getParameter("action");
        String order_id = request.getParameter("order_id");
        String order_code = request.getParameter("order_code");
        String prod_no = request.getParameter("prod_no");

        String viewPath = null;
        if (action != null) {
            switch (action) {
                case "select":
                    OrderVO cancel = OrderDAO.selectDetailsByStatus(order_id, cvo.getId(), prod_no, order_code, "6");
                    int point_amount = PointDAO.selectPointAmount(cvo.getId(), order_code);
                    request.setAttribute("cancel", cancel);
                    request.setAttribute("point_amount", point_amount);
                    viewPath = "/user/customer/jsp/mypage/cancelDetails.jsp";
                    break;
            }
        }
        return viewPath;
    }
}
