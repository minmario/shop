package user.action;

import user.dao.CartDAO;
import user.dao.LogDAO;
import user.vo.CartVO;
import user.vo.CustomerVO;
import user.vo.LogVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class CartAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            return "/user/jsp/error/error.jsp";
        }

        if (action != null) {
            switch (action) {
                case "select":
                    List<CartVO> cart_list = CartDAO.selectCart(cvo.getId());
                    request.setAttribute("cart_list", cart_list);
                    break;
                case "insert":
                    String i_prod_no = request.getParameter("prod_no");
                    String i_count = request.getParameter("count");
                    String i_size = request.getParameter("size");

                    CartVO ivo = new CartVO();
                    ivo.setCus_no(cvo.getId());
                    ivo.setProd_no(i_prod_no);
                    ivo.setCount(i_count);
                    ivo.setSize(i_size);
                    int i_cnt = CartDAO.insertCart(ivo);

                    if (i_cnt > 0) {
                        // 추가 로그
                        LogVO lvo = new LogVO();
                        StringBuffer sb = new StringBuffer();
                        lvo.setCus_no(cvo.getId());
                        lvo.setTarget("cart 추가");
                        sb.append("prod_no : " + i_prod_no + ", ");
                        sb.append("count : " + i_count + ", ");
                        sb.append("size : " + i_size);
                        lvo.setCurrent(sb.toString());
                        LogDAO.insertLog(lvo);
                    }

                    break;
                case "update":
                    String u_id = request.getParameter("id");
                    String u_count = request.getParameter("count");
                    String u_size = request.getParameter("size");

                    CartVO uvo = new CartVO();
                    uvo.setCus_no(cvo.getId());
                    uvo.setId(u_id);
                    uvo.setCount(u_count);
                    uvo.setSize(u_size);
                    int u_cnt = CartDAO.updateCart(uvo);

                    if (u_cnt > 0) {
                        // 수정 로그
                        LogVO lvo = new LogVO();
                        StringBuffer sb = new StringBuffer();
                        lvo.setCus_no(cvo.getId());
                        lvo.setTarget("cart 수정");
                        sb.append("id : " + u_id + ", ");
                        sb.append("count : " + u_count + ", ");
                        sb.append("size : " + u_size);
                        lvo.setCurrent(sb.toString());
                        LogDAO.updateLog(lvo);
                    }

                    break;
                case "delete":
                    String id = request.getParameter("id");

                    HashMap<String, Object> d_map = new HashMap<>();
                    d_map.put("cus_no", cvo.getId());
                    d_map.put("id", id);

                    int d_cnt = CartDAO.deleteCart(d_map);

                    if (d_cnt > 0) {
                        // 삭제 로그
                        LogVO lvo = new LogVO();
                        StringBuffer sb = new StringBuffer();
                        lvo.setCus_no(cvo.getId());
                        lvo.setTarget("cart 삭제");
                        sb.append("id : " + id);
                        lvo.setCurrent(sb.toString());
                        LogDAO.insertLog(lvo);
                    }

                    break;
                case "deletes":
                    String[] idsArr = request.getParameterValues("ids");

                    List<String> itemIds = Arrays.asList(idsArr);
                    System.out.println("itemIds : " + itemIds);

                    HashMap<String, Object> ds_map = new HashMap<>();
                    ds_map.put("cus_no", cvo.getId());
                    ds_map.put("ids", itemIds);

                    int ds_cnt = CartDAO.deletesCart(ds_map);

                    if (ds_cnt > 0) {
                        // 삭제 로그
                        LogVO lvo = new LogVO();
                        for (String s : idsArr) {
                            StringBuffer sb = new StringBuffer();
                            lvo.setCus_no(cvo.getId());
                            lvo.setTarget("cart 삭제");
                            sb.append("id : " + s);
                            lvo.setCurrent(sb.toString());
                            LogDAO.insertLog(lvo);
                        }
                    }
                    
                    break;
                case "delete_all":
                    int da_cnt = CartDAO.deleteAllCart(cvo.getId());

                    if (da_cnt > 0) {
                        // 삭제 로그
                        LogVO lvo = new LogVO();
                        StringBuffer sb = new StringBuffer();
                        lvo.setCus_no(cvo.getId());
                        lvo.setTarget("cart 전체 삭제");
                        lvo.setCurrent(sb.toString());
                        LogDAO.insertLog(lvo);
                    }

                    break;
            }
        }

        return "/user/jsp/cart/cart.jsp";
    }
}
