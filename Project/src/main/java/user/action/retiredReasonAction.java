package user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class retiredReasonAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        return "/user/jsp/mypage/retiredReason.jsp";
    }
}
