package user.action;

import user.dao.ProductDAO;
import user.dao.QuestionDAO;
import user.vo.BoardVO;
import user.vo.CustomerVO;
import user.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class ProductDetailsAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");
        String id = cvo.getId();
        String action = request.getParameter("action");

        String viewPath = "/user/jsp/product/productDetails.jsp";
        if (action != null){
            switch (action){
                case "all":
                    List<BoardVO> list = QuestionDAO.selectAll(id);
                    request.setAttribute("list", list);
                    viewPath = "/user/jsp/product/productDetails.jsp";
            }
        }
        return viewPath;
    }
}
