package user.action;

import user.dao.OrderDAO;
import user.vo.CustomerVO;
import user.vo.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class OrderAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");
        String cus_no = cvo.getId();

        List<OrderVO> o_list = null;
        String viewPage = null;
        if (action != null){
            switch (action) {
                case "all":
                    o_list = OrderDAO.selectAll(cus_no);
                    request.setAttribute("o_list", o_list);
                    viewPage = "/user/jsp/mypage/components/order.jsp";
                    break;

                case "date":
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");
                    o_list = OrderDAO.selectDate(cus_no, startDate, endDate);
                    request.setAttribute("o_list", o_list);
                    viewPage = "/user/jsp/mypage/components/order.jsp";
                    break;
            }
        }
        return viewPage;
    }
}
