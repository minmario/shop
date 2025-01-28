package user.action;

import user.dao.OrderDAO;
import user.vo.CustomerVO;
import user.vo.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class OrderDetailsAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");
        String cus_no = cvo.getId();

        // Null 체크
        if (cvo == null) {
            return "/user/jsp/mypage/error.jsp";
        }

        List<OrderVO> o_list = null;
        OrderVO vo = null;
        String viewPage = null;
        if(action != null){
            switch (action) {
                // 주문상세 조회
                case "select":
                    String order_code = request.getParameter("order_code");
                    o_list = OrderDAO.selectOrderCode(cus_no, order_code);
                    vo = OrderDAO.selectOrder(cus_no, order_code);
                    int totalPrice = OrderDAO.selectTotalPrice(cus_no, order_code);
                    int totalSaledPrice = OrderDAO.selectTotalSaledPrice(cus_no, order_code);
                    
                    request.setAttribute("o_list", o_list);
                    request.setAttribute("vo", vo);
                    request.setAttribute("totalPrice", totalPrice);
                    request.setAttribute("totalSaledPrice", totalSaledPrice);
                    
                    viewPage = "/user/jsp/mypage/orderDetails.jsp";
                    break;

                default:
                    viewPage = "/user/jsp/mypage/error.jsp";
            }
        } else {
            viewPage = "/user/jsp/mypage/error.jsp";

        }
        return "/user/jsp/mypage/orderDetails.jsp";
    }
}
