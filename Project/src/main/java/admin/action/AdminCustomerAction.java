package admin.action;

import admin.dao.CustomerDao;
import user.action.Action;
import admin.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class AdminCustomerAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        CustomerDao cdao = new CustomerDao();
        List<CustomerVO> list = cdao.allCustomer();
        request.setAttribute("customerList",list);
        return "/admin/jsp/customermain.jsp";
    }
}
