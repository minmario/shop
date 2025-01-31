package admin.action;

import admin.dao.CouponDao;
import admin.dao.CustomerDao;
import admin.dao.MajorCategoryDao;
import admin.vo.CouponVO;
import admin.vo.CustomerVO;
import admin.vo.MajorCategoryVO;
import user.action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminSearchCustomerAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");


        CustomerVO[] ar = CustomerDao.searchCustomer(searchType, searchValue);
        request.setAttribute("cusar", ar);
        return "/admin/jsp/ajaxCustomerList.jsp";
    }
}