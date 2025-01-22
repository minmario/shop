package user.action;

import user.dao.DeliveryDAO;
import user.vo.CustomerVO;
import user.vo.DeliveryVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class ViewDeliveryAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        //파라미터 받기
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        List<DeliveryVO> d_list = null;
        try {
            d_list = DeliveryDAO.searchDeliInfo(cvo.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("d_list", d_list);

        return "/user/jsp/mypage/components/delivery.jsp";
    }
}
