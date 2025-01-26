package user.action;

import user.dao.QuestionDAO;
import user.vo.BoardVO;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class WriteQuestionAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");
        String id = cvo.getId();
        String action = request.getParameter("action");
        String prod_no = request.getParameter("prod_no");

        String viewPage = "/user/jsp/product/writeQuestion.jsp";
        if(action != null){
            switch (action){
                case "insert":
                    // 파라미터 확인용 로그
                    String type_value = request.getParameter("question_type");
                    String title = request.getParameter("question_title");
                    String is_private = request.getParameter("question_check");
                    String content = request.getParameter("question_content");
                    int cnt = QuestionDAO.insertQuestion(id, prod_no, title, content, type_value, is_private);
                    viewPage = "/user/jsp/product/writeQuestion.jsp";
                    break;
            }
        }
        return viewPage;
    }
}
