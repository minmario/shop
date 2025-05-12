package admin.action;

import user.action.Action;
import admin.dao.RootDao;
import admin.vo.RootVO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String viewpath = null;
        RootVO vo = new RootVO();
        vo.setRoot_id(username);

        RootVO loginResult = RootDao.login(vo.getRoot_id()); // 아이디로만 조회

        if (loginResult != null && BCrypt.checkpw(password, loginResult.getRoot_pw())) {
            HttpSession session = request.getSession();
            session.setAttribute("name", loginResult.getName());
            session.setAttribute("id", loginResult.getId());
            session.setAttribute("root_id", loginResult.getRoot_id());
            request.setAttribute("isLoggedIn", true);
            request.setAttribute("root_pw", loginResult.getRoot_pw());

            viewpath = "/admin/jsp/index.jsp";
        } else {
            viewpath = "/admin/jsp/login/login.jsp";
        }
        return viewpath;
    }
}
