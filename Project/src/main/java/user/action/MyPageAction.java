package user.action;

import user.dao.PointDAO;
import user.vo.CustomerVO;
import user.vo.PointVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class MyPageAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO loginResult = (CustomerVO) session.getAttribute("customer_info");

        // 적립금 내역 가져오기
        List<PointVO> all = PointDAO.selectAll(loginResult.getId());

        if (loginResult != null) {
            session.setAttribute("all", all);

            return "/user/jsp/mypage/mypage.jsp";
        } else {
            return "/user/jsp/index.jsp";
        }
    }
}
