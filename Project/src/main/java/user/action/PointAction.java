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
                case "all":
                    List<PointVO> all = PointDAO.selectAll(id);
                    session.setAttribute("all", all);
                    break;

                case "earned":
                    List<PointVO> earned = PointDAO.selectEarned(id);
                    session.setAttribute("earned", earned);
                    break;

                case "used":
                    List<PointVO> used = PointDAO.selectUsed(id);
                    session.setAttribute("used", used);
                    break;

                case "upcoming":
                    String upcoming = PointDAO.selectUpcoming(id);
                    session.setAttribute("upcoming", upcoming);
                    break;

                case "expireTotal":
                    String expireTotal = PointDAO.selectExpireTotal(id);
                    session.setAttribute("expireTotal", expireTotal);
                    break;
            }
        }
        return "/user/jsp/mypage/components/point.jsp";
    }
}
