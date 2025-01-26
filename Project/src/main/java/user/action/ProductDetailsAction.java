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
        String action = request.getParameter("action");
        String prod_no = request.getParameter("prod_no");

        String viewPath = "/user/jsp/product/productDetails.jsp";
        if (action != null){
            switch (action){
                case "prodNo":
                    List<ProductVO> productDetails = ProductDAO.selectProdDetails(prod_no);
                    List<ProductVO> productSize = ProductDAO.selectSize(prod_no);
                    request.setAttribute("productDetails", productDetails);
                    request.setAttribute("productSize", productSize);
                    viewPath = "/user/jsp/product/productDetails.jsp";

                case "question":
                    List<BoardVO> q_list = QuestionDAO.selectProdQuestion(prod_no);
                    request.setAttribute("q_list", q_list);
                    viewPath = "/user/jsp/product/productDetails.jsp";
            }
        }
        return viewPath;
    }
}
