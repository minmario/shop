package user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("MyPageAction");

        return "/user/jsp/mypage/mypage.jsp";
    }
}
