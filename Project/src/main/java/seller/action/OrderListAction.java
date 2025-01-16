package seller.action;

import comm.action.Action;
import comm.service.FactoryService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderListAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        String  order_no = (String) session.getAttribute("order_no");

        if(order_no == null){

            return "/seller/jsp/order_list.jsp";
        }

        return "/seller/jsp/order_list.jsp";
    }
}
