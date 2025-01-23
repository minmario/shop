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
        String id = cvo.getId();

        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "update":
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");

                    CustomerVO uvo = new CustomerVO();
                    uvo.setId(id);
                    uvo.setEmail(email);
                    uvo.setPhone(phone);

                    // 호출
                    int cnt = CustomerDAO.cusUpdate(uvo);

                    if (cnt > 0) {
                        session.setAttribute("response", true);
                        request.setAttribute("response", true);
                    } else {
                        session.setAttribute("response", false);
                        request.setAttribute("response", false);
                    }

                    break;
                case "select":
                    CustomerVO svo = CustomerDAO.selectById(id);
                    session.setAttribute("customer_info", svo);
                    break;
            }
        }

        return "/user/jsp/mypage/profileEdit.jsp";
    }
}
