package user.action;

import user.dao.BoardDAO;
import user.dao.LogDAO;
import user.dao.ProductDAO;
import user.dao.QuestionDAO;
import user.vo.BoardVO;
import user.vo.CustomerVO;
import user.vo.LogVO;
import user.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class QuestionAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            return "/user/jsp/error/error.jsp";
        }

        String status = request.getParameter("status");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String action = request.getParameter("action");

        List<BoardVO> list = null;
        String viewPage = null;
        if(action != null) {
            switch (action) {
                case "all":
                    list = QuestionDAO.selectAll(cvo.getId());
                    request.setAttribute("list", list);
                    viewPage = "/user/jsp/mypage/components/question.jsp";
                    break;
                case "option":
                    list = QuestionDAO.selectOption(cvo.getId(), status, startDate, endDate);
                    request.setAttribute("list", list);
                    viewPage = "/user/jsp/mypage/components/question.jsp";
                    break;
                case "write":
                    String w_prod_no = request.getParameter("prod_no");
                    ProductVO pvo = ProductDAO.selectProdDetails(w_prod_no);
                    request.setAttribute("prod_details", pvo);
                    viewPage = "/user/jsp/product/writeQuestion.jsp";
                    break;
                case "insert":
                    String i_prod_no = request.getParameter("prod_no");

                    String type_value = request.getParameter("question_type");
                    String title = request.getParameter("question_title");
                    String is_private = request.getParameter("question_check");
                    String content = request.getParameter("question_content");
                    String additional_images = request.getParameter("");
                    int cnt = QuestionDAO.insertQuestion(cvo.getId(), i_prod_no, title, content, type_value, is_private, additional_images);

                    if (cnt > 0) {
                        // 추가 로그
                        LogVO lvo = new LogVO();
                        StringBuffer sb = new StringBuffer();
                        lvo.setCus_no(cvo.getId());
                        lvo.setTarget("board");
                        sb.append("cus_no : " + cvo.getId() + ", ");
                        sb.append("prod_no : " + i_prod_no + ", ");
                        sb.append("title : " + title + ", ");
                        sb.append("content : " + content + ", ");
                        sb.append("type : " + type_value + ", ");
                        sb.append("is_private : " + is_private);
                        sb.append("additional_images : " + additional_images);
                        lvo.setCurrent(sb.toString());
                        LogDAO.insertLog(lvo);
                    }

                    viewPage = "/user/jsp/product/writeQuestion.jsp";
                    break;
            }
        }

        return viewPage;
    }
}