package seller.action;

import comm.action.Action;
import comm.dao.ProductDAO;
import comm.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

public class SearchProductAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession();

        String prod_name = request.getParameter("prod_name");
        String category = request.getParameter("category");
        String seller_no = (String)session.getAttribute("seller_no");
        System.out.println("Action: "+prod_name);
        ProductVO[] ar = ProductDAO.searchProduct(seller_no,category,prod_name);
        request.setAttribute("ar",ar);
        return "/seller/ajax/search_product.jsp";

    }
}
