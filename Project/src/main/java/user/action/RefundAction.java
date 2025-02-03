package user.action;

import user.dao.OrderDAO;
import user.vo.CustomerVO;
import user.vo.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class RefundAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");
        String cus_no = cvo.getId();

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/jsp/error/error.jsp";
        }

        if (action != null) {
            switch (action) {
                case "all":
                    List<OrderVO> all = OrderDAO.selectRefundAll(cus_no);
                    request.setAttribute("all", all);
                    break;

                case "cancelRefund":
                    List<OrderVO> cancelRefund = OrderDAO.selectCancelRefund(cus_no);
                    request.setAttribute("cancelRefund", cancelRefund);
                    break;

                case "exchange":
                    List<OrderVO> exchange = OrderDAO.selectRefundExchange(cus_no);
                    request.setAttribute("exchange", exchange);
                    break;
            }
        }
        return "/user/jsp/mypage/components/refund.jsp";
    }
}
