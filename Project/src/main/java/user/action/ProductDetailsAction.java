package user.action;

import user.dao.ProdLikeDAO;
import user.dao.ProductDAO;
import user.dao.QuestionDAO;
import user.vo.BoardVO;
import user.vo.CustomerVO;
import user.vo.ProdLikeVO;
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
            HttpSession session = request.getSession();
            CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

            String prod_no = request.getParameter("prod_no");

            switch (action) {
                case "select":
                    ProductVO productDetails = ProductDAO.selectProdDetails(prod_no);
                    List<ProductVO> productSize = ProductDAO.selectSize(prod_no);
                    request.setAttribute("productDetails", productDetails);
                    request.setAttribute("productSize", productSize);

                    ProdLikeVO s_vo = new ProdLikeVO();
                    s_vo.setCus_no(cvo.getId());
                    s_vo.setProd_no(prod_no);
                    ProdLikeVO plvo = ProdLikeDAO.selectProdLike(s_vo);
                    request.setAttribute("product_like", plvo);

                    viewPath = "/user/jsp/product/productDetails.jsp";
                    break;
                case "question":
                    List<BoardVO> questions = QuestionDAO.selectProdQuestion(prod_no);
                    request.setAttribute("questions", questions);
                    viewPath = "/user/jsp/product/components/questionList.jsp";
                    break;
                case "like":
                    ProdLikeVO i_vo = new ProdLikeVO();
                    i_vo.setCus_no(cvo.getId());
                    i_vo.setProd_no(prod_no);
                    ProdLikeDAO.insertProdLike(i_vo);
                    viewPath = "/user/jsp/product/productDetails.jsp";
                    break;
                case "unlike":
                    ProdLikeVO d_vo = new ProdLikeVO();
                    d_vo.setCus_no(cvo.getId());
                    d_vo.setProd_no(prod_no);
                    ProdLikeDAO.deleteProdLike(d_vo);
                    viewPath = "/user/jsp/product/productDetails.jsp";
                    break;
            }
        }

        return viewPath;
    }
}
