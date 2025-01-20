package user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductDetails implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        return "/user/jsp/product/productDetails.jsp";
    }
}
