package user.action;

import user.dao.CustomerDAO;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction  implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String viewpath = null;
        CustomerVO vo = new CustomerVO();
        vo.setCus_id(username);
        vo.setCus_pw(password);

        CustomerVO loginResult = CustomerDAO.login(vo); // 로그인 정보 가져오기


        //customer cusid 세션에 저장하는값
        String nickname = loginResult.getNickname();

        //customer cusid 세션에 저장하는값
        int customer_id = CustomerDAO.getId(nickname);



        if(loginResult != null){
            HttpSession session = request.getSession();
            session.setAttribute("cus_id", customer_id);
            System.out.println("현제접속중인 cus_id:"+customer_id);
            session.setAttribute("nickname", loginResult.getNickname());
            request.setAttribute("isLoggedIn", true);
            request.setAttribute("nickname", loginResult.getNickname());
            viewpath="/user/jsp/index.jsp";
        }
        else{
            viewpath="/user/jsp/layout/header.jsp";
        }
        return viewpath;
    }
}

