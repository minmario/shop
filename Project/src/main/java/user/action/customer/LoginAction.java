package user.action.customer;

import org.json.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import user.action.Action;
import user.dao.customer.CartDAO;
import user.dao.customer.CategoryDAO;
import user.dao.customer.CustomerDAO;
import user.vo.customer.CustomerVO;
import user.vo.customer.MajorCategoryVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

public class LoginAction  implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        String action = request.getParameter("action");

        String viewPath = null;
        if (action != null) {
            switch (action) {
                case "find":
                    viewPath = "/user/customer/jsp/login/findCustomer.jsp";
                    break;
                case "search_customer":
                    String cus_id = request.getParameter("cus_id");

                    // 회원 찾기
                    int cnt = CustomerDAO.selectCusId(cus_id);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    try (PrintWriter out = response.getWriter()) {
                        // JSON 객체 생성
                        JSONObject jsonResponse = new JSONObject();
                        jsonResponse.put("success", true);
                        jsonResponse.put("is_exists", cnt > 0);

                        // JSON 응답 전송
                        out.print(jsonResponse.toString());
                        out.flush();
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        session.setAttribute("find_cus_id", cus_id);
                    }

                    return null;
                case "reset":
                    viewPath = "/user/customer/jsp/login/resetPassword.jsp";
                    break;
                case "update_customer":
                    // 비밀번호 변경
                    cus_id = (String) session.getAttribute("find_cus_id");
                    String cus_pw = request.getParameter("cus_pw");

                    cnt = CustomerDAO.updateCustomerPw(cus_id, BCrypt.hashpw(cus_pw, BCrypt.gensalt()));

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    try (PrintWriter out = response.getWriter()) {
                        // JSON 객체 생성
                        JSONObject jsonResponse = new JSONObject();
                        jsonResponse.put("success", cnt > 0 ? true : false);

                        // JSON 응답 전송
                        out.print(jsonResponse.toString());
                        out.flush();
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // 세션 제거
                        session.removeAttribute("find_cus_id");
                    }
                    
                    return null;
            }
        } else {
            String username = request.getParameter("username");

            // 구매자 조회
            CustomerVO loginResult = CustomerDAO.selectCustomerByCusId(username);

            if (loginResult == null) {
                // 로그인 실패
                session.setAttribute("isLoggedIn", false);
                request.setAttribute("isNotFound", true);
                return "/user/customer/jsp/login/login.jsp";
            }

            try {
                String password = request.getParameter("password");

                // 비밀번호 검증
                if (BCrypt.checkpw(password, loginResult.getCus_pw())) {
                    // 로그인 정보 저장
                    session.setAttribute("isLoggedIn", true);
                    session.setAttribute("customer_info", loginResult);

                    // 장바구니 수
                    int cart_count = CartDAO.selectCartCount(loginResult.getId());
                    session.setAttribute("cart_count", cart_count);

                    // 카테고리
                    List<MajorCategoryVO> categories = CategoryDAO.getCategory();

                    if (categories != null && !categories.isEmpty()) {
                        request.setAttribute("categories", categories);
                    }

                    viewPath = "/user/customer/jsp/index.jsp";
                } else {
                    // 실패 시에만 isLoggedIn 설정
                    if (username != null && password != null) {
                        session.setAttribute("isLoggedIn", false);
                    }

                    viewPath = "/user/customer/jsp/login/login.jsp";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return viewPath;
    }
}
