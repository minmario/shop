package seller.action;

import comm.action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProductEditAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        String  prod_no = (String) session.getAttribute("prod_no");

        if(prod_no == null){

            return "/seller/jsp/product_edit.jsp";
        }

        return "/seller/jsp/product_edit.jsp";
    }

}
