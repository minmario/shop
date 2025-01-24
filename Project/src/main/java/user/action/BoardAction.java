package user.action;

import user.dao.BoardDAO;
import user.vo.BoardVO;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class BoardAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");
        String id = cvo.getId();
        String action = request.getParameter("action");

        String viewPage = null;
        if(action != null) {
            switch (action) {
                case "all":
                    List<BoardVO> alllist = BoardDAO.selectAll(id);
                    request.setAttribute("alllist", alllist);
                    viewPage = "/user/jsp/mypage/components/inquiry.jsp";
                    break;

                case "seearch":
                    String status = request.getParameter("status");
                    String dateRange = request.getParameter("dateRange");
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");

                    List<BoardVO> searchlist = BoardDAO.selectSearch(id, status, dateRange, startDate, endDate);
                    request.setAttribute("searchlist", searchlist);
                    viewPage = "/user/jsp/mypage/components/inquiry.jsp";
                    break;
            }
        }
        return viewPage;
    }
}
