package user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderDeliveryAction implements Action{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        return "/user/jsp/mypage/orderDelivery.jsp";
    }
}
