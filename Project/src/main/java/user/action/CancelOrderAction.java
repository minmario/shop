package user.action;

import user.dao.DeliveryDAO;
import user.dao.OrderDAO;
import user.dao.PointDAO;
import user.vo.CustomerVO;
import user.vo.DeliveryVO;
import user.vo.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class CancelOrderAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            return "/user/jsp/error/error.jsp";
        }

        String cus_no = cvo.getId();
        String action = request.getParameter("action");
        String order_code = request.getParameter("order_code");

        if (action != null) {
            switch (action) {
                case "select":
                    List<OrderVO> o_list = OrderDAO.selectOrderCode(cus_no, order_code);
                    List<DeliveryVO> d_list = DeliveryDAO.selectDelivery(cus_no);

                    request.setAttribute("o_list", o_list);
                    request.setAttribute("d_list", d_list);

                    return "/user/jsp/mypage/cancelOrder.jsp";

                default:
                    return "/user/jsp/error/error.jsp";
            }
        }

        return "/user/jsp/error/error.jsp";
    }
}
