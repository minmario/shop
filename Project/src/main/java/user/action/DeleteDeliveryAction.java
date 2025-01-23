package user.action;

import user.dao.DeliveryDAO;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteDeliveryAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        //파라미터 받기
        String id = request.getParameter("id");
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info.id");

        int cnt = 0;
        try {
            cnt = DeliveryDAO.deleteDeliInfo(id, cvo.getId());
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
