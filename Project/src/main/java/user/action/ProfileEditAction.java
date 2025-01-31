package user.action;

import user.dao.CustomerDAO;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProfileEditAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/jsp/error/error.jsp";
        }

        String viewPath = null;
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "update":
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");

                    CustomerVO uvo = new CustomerVO();
                    uvo.setId(cvo.getId());
                    uvo.setEmail(email);
                    uvo.setPhone(phone);
                    CustomerDAO.updateCustomer(uvo);

                    viewPath = "/user/jsp/mypage/profileEdit.jsp";
                    break;
                case "select":
                    CustomerVO rvo = CustomerDAO.selectCustomerById(cvo.getId());
                    session.setAttribute("customer_info", rvo);
                    viewPath = "/user/jsp/mypage/components/profile.jsp";
                    break;
            }
        }

        return viewPath;
    }
}
