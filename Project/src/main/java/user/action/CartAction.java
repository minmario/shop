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

        String viewPath = null;
        if (action != null) {
            switch (action) {
                case "select":
                    List<CartVO> cart_list = CartDAO.selectCart(cvo.getId());
                    request.setAttribute("cart_list", cart_list);
                    break;
                case "insert":
                    String i_prodNo = request.getParameter("prodNo");
                    String i_count = request.getParameter("count");

                    CartVO ivo = new CartVO();
                    ivo.setCus_no(cvo.getId());
                    ivo.setProd_no(i_prodNo);
                    ivo.setCount(i_count);
                    int i_cnt = CartDAO.insertCart(ivo);

                    if (i_cnt > 0) {
                        // 추가 로그
                        LogVO lvo = new LogVO();
                        StringBuffer sb = new StringBuffer();
                        lvo.setCus_no(cvo.getId());
                        lvo.setTarget("cart 추가");
                        sb.append("prod_no : " + i_prodNo + ", ");
                        sb.append("count : " + i_count);
                        lvo.setCurrent(sb.toString());
                        LogDAO.insertLog(lvo);
                    }

                    break;
                case "update":
                    String u_id = request.getParameter("id");
                    String u_count = request.getParameter("count");

                    CartVO uvo = new CartVO();
                    uvo.setCus_no(cvo.getId());
                    uvo.setId(u_id);
                    uvo.setCount(u_count);
                    int u_cnt = CartDAO.updateCart(uvo);

                    if (u_cnt > 0) {
                        // 수정 로그
                        LogVO lvo = new LogVO();
                        StringBuffer sb = new StringBuffer();
                        lvo.setCus_no(cvo.getId());
                        lvo.setTarget("cart 수정");
                        sb.append("id : " + u_id + ", ");
                        sb.append("count : " + u_count);
                        lvo.setCurrent(sb.toString());
                        LogDAO.insertLog(lvo);
                    }

                    break;
                case "delete":
                    String[] idsArr = request.getParameterValues("ids");
                    System.out.println("idsArr.length : " + idsArr.length);

                    List<String> itemIds = Arrays.asList(idsArr);

                    HashMap<String, Object> map = new HashMap<>();
                    map.put("cus_no", cvo.getId());
                    map.put("ids", itemIds);

                    int d_cnt = CartDAO.deleteCart(map);

                    if (d_cnt > 0) {
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
