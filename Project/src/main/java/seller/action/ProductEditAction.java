package seller.action;

import comm.action.Action;
import comm.dao.ProductDAO;
import comm.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class ProductEditAction implements Action{
    List<ProductVO> p_list;
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        String  prod_no = (String) request.getParameter("prod_no");
        String  cPage = (String) request.getParameter("cPage");


        Object obj = session.getAttribute("list");
        if (obj == null) {
        }
        if(prod_no == null){
            p_list= new ArrayList<ProductVO>();
            session.setAttribute("p_list",p_list);

        }else{
            p_list = (ArrayList<ProductVO>) obj;
        }
        ProductVO vo = ProductDAO.getProductOne(prod_no);
        if(vo!=null) {
            request.setAttribute("vo", vo);
            request.setAttribute("cPage", cPage);
            return "/seller/jsp/product_edit.jsp";
        }
        else
            return "/seller/jsp/product_new.jsp";


    }

}
