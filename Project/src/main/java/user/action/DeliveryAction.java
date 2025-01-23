package user.action;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import user.dao.DeliveryDAO;
import user.vo.CustomerVO;
import user.vo.DeliveryVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

public class DeliveryAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        String viewPage = null;
        if (action != null) {
            switch (action) {
                case "select":
                    List<DeliveryVO> d_list = DeliveryDAO.selectDelivery(cvo.getId());
                    request.setAttribute("d_list", d_list);

                    viewPage = "/user/jsp/mypage/components/delivery.jsp";
                    break;
                case "insert":
                    String i_name = request.getParameter("name");
                    String i_phone = request.getParameter("phone");
                    String i_pos_code = request.getParameter("pos_code");
                    String i_addr1 = request.getParameter("addr1");
                    String i_addr2 = request.getParameter("addr2");
                    String i_chkDefault = request.getParameter("chkDefault");
                    String i_deli_request = request.getParameter("deli_request");

                    int i_cnt = DeliveryDAO.insertDelivery(cvo.getId(), i_name, i_phone, i_pos_code, i_addr1, i_addr2, i_chkDefault, i_deli_request);

                    if (i_cnt > 0) {
                        request.setAttribute("deliveryResponse", true);
                    } else {
                        request.setAttribute("deliveryResponse", false);
                    }

                    viewPage = "/user/jsp/mypage/mypage.jsp";
                    break;
                case "update":
                    String u_id = request.getParameter("id");
                    String u_name = request.getParameter("name");
                    String u_phone = request.getParameter("phone");
                    String u_pos_code = request.getParameter("pos_code");
                    String u_addr1 = request.getParameter("addr1");
                    String u_addr2 = request.getParameter("addr2");
                    String u_chkDefault = request.getParameter("chkDefault");
                    String u_deli_request = request.getParameter("deli_request");

                    int u_cnt = DeliveryDAO.updateDelivery(u_id, u_name, u_phone, u_pos_code, u_addr1, u_addr2, u_chkDefault, u_deli_request);

                    if (u_cnt > 0) {
                        request.setAttribute("deliveryResponse", true);
                    } else {
                        request.setAttribute("deliveryResponse", false);
                    }

                    viewPage = "/user/jsp/mypage/mypage.jsp";
                    break;
                case "delete":
                    String d_id = request.getParameter("id");

                    int d_cnt = DeliveryDAO.deleteDelivery(d_id);

                    if (d_cnt > 0) {
                        request.setAttribute("deliveryResponse", true);
                    } else {
                        request.setAttribute("deliveryResponse", false);
                    }

                    viewPage = "/user/jsp/mypage/components/delivery.jsp";
                    break;
            }
        } else {
            viewPage = "/user/jsp/mypage/components/delivery.jsp";
        }

        return viewPage;
    }
}
