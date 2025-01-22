package user.action.mypage.confirm;

import user.action.Action;
import user.dao.CustomerDAO;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ConfirmAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO s_cvo = (CustomerVO) session.getAttribute("customer_info");
        String cus_pw = request.getParameter("cus_pw");

        CustomerVO vo = new CustomerVO();
        vo.setCus_id(s_cvo.getCus_id());
        vo.setCus_pw(cus_pw);

        CustomerVO res = null;
        try {
            res = CustomerDAO.login(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (res != null) {
            return "/user/jsp/mypage/profileEdit.jsp";
        } else {
            return "/user/jsp/mypage/pwConfirm.jsp";
        }
    }
}
