package user.action;

import user.dao.ProductDAO;
import user.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ProductDetailsAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        List<ProductVO> pvo = ProductDAO.getProducts();

        if (pvo != null && pvo.size() > 0) {
            request.setAttribute("products", pvo);
        }

        return "/user/jsp/product/productDetails.jsp";
    }
}
