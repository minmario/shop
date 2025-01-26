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
        String action = request.getParameter("action");

        String viewPath = null;
        if (action != null) {
            String prod_no = request.getParameter("prod_no");

            switch (action) {
                case "select":
                    ProductVO productDetails = ProductDAO.selectProdDetails(prod_no);
                    List<ProductVO> productSize = ProductDAO.selectSize(prod_no);
                    request.setAttribute("productDetails", productDetails);
                    request.setAttribute("productSize", productSize);

                    viewPath = "/user/jsp/product/productDetails.jsp";
                    break;
                case "question":
                    List<BoardVO> questions = QuestionDAO.selectProdQuestion(prod_no);
                    request.setAttribute("questions", questions);
                    viewPath = "/user/jsp/product/components/questionList.jsp";
                    break;
            }
        }

        return viewPath;
    }
}
