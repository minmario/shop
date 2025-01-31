package admin.action;

import user.action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminDeleteBoardAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String content = request.getParameter("content");
        int id = Integer.parseInt(request.getParameter("id"));


        return "/admin/jsp/boardmain.jsp";
    }
}
