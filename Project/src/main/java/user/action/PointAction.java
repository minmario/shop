package user.action;

import user.dao.CustomerDAO;
import user.dao.PointDAO;
import user.vo.CustomerVO;
import user.vo.PointVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class PointAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");
        String id = cvo.getId();
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "select_points":
                    List<PointVO> points = PointDAO.getPoint(id);
                    session.setAttribute("points", points);
                    break;

                case "select_earned":

            }
        }

        return "/user/jsp/mypage/point.jsp";
    }
}
