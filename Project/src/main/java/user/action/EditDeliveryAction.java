package user.action;

import user.dao.DeliveryDAO;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditDeliveryAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        //파라미터 받기
        String id = request.getParameter("id");
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String pos_code = request.getParameter("pos_code");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String chkDefault = request.getParameter("chkDefault") != null ? "1" : "0";
        String deli_request = request.getParameter("deli_request");

        int cnt = 0;
        try {
            cnt = DeliveryDAO.updateDeliInfo(id, cvo.getId(), name, phone, pos_code, addr1, addr2, chkDefault, deli_request);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 결과 처리
        if (cnt > 0) {
            request.setAttribute("success", true);
        } else {
            request.setAttribute("success", false);
        }

        return "/user/jsp/mypage/components/delivery.jsp";
    }
}
