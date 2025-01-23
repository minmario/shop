package user.action;

import user.dao.CustomerDAO;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignupAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 모든 입력 데이터를 가져오기
        String cusId = request.getParameter("cus_id");
        String cusPw = request.getParameter("cus_pw");
        String cusName = request.getParameter("cus_name");
        String cusNickname = request.getParameter("cus_nickname");
        String cusGender = request.getParameter("cus_gender");
        String cusBirth = request.getParameter("cus_birth");
        String cusPhone = request.getParameter("cus_phone");
        String cusEmail = request.getParameter("cus_email");

        CustomerVO vo = new CustomerVO();
        vo.setCus_id(cusId);
        vo.setCus_pw(cusPw);
        vo.setName(cusName);
        vo.setNickname(cusNickname);
        vo.setGender(cusGender);
        vo.setBirth_date(cusBirth);
        vo.setPhone(cusPhone);
        vo.setEmail(cusEmail);

        int cnt = CustomerDAO.insertCustomer(vo);

        // 성공 시 로그인 페이지로 이동
        if (cnt > 0) {
            return "/user/jsp/login/login.jsp";
        } else {
            return "/user/jsp/login/login.jsp";
        }
    }
}
