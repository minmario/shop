package user.action;

import user.dao.CustomerDao;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyPageAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO loginResult = (CustomerVO) session.getAttribute("loginResult");

        if (loginResult != null) {
            CustomerVO cvo = new CustomerVO();
            cvo.setCus_id(loginResult.getId());
            cvo.setCus_pw(loginResult.getCus_pw());

            CustomerVO userInfo = CustomerDao.cusInfo(cvo);

            session.setAttribute("userInfo", userInfo);
        }

        return "/user/jsp/mypage/mypage.jsp";
    }
}
