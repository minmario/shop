package user.action;

import user.dao.BoardDAO;
import user.dao.QuestionDAO;
import user.vo.BoardVO;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class QuestionAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");
        String id = cvo.getId();
        String status = request.getParameter("status");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String action = request.getParameter("action");

        List<BoardVO> list = null;
        String viewPage = null;
        if(action != null) {
            switch (action) {
                case "all":
                    list = QuestionDAO.selectAll(id);
                    request.setAttribute("list", list);
                    viewPage = "/user/jsp/mypage/components/question.jsp";
                    break;

                case "option":
                    list = QuestionDAO.selectOption(id, status, startDate, endDate);
                    request.setAttribute("list", list);
                    viewPage = "/user/jsp/mypage/components/question.jsp";
                    break;
            }
        }

        return viewPage;
    }
}