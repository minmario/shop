package user.action.customer;

import org.mindrot.jbcrypt.BCrypt;
import user.action.Action;
import user.dao.customer.CouponDAO;
import user.dao.customer.CustomerDAO;
import user.dao.customer.OrderDAO;
import user.dao.customer.PointDAO;
import user.vo.customer.CouponVO;
import user.vo.customer.CustomerVO;
import user.vo.customer.PointVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

public class MyPageAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        }

        String viewPath = null;
        if (action != null) {
            switch (action) {
                case "profile":
                    viewPath = "/user/customer/jsp/mypage/pwConfirm.jsp";
                    break;
                case "edit":
                    viewPath = "/user/customer/jsp/mypage/profileEdit.jsp";
                    break;
                case "confirm":
                    System.out.println("---------- confirm ---------------");

                    // 구매자 조회
                    CustomerVO result = CustomerDAO.selectCustomerByCusId(cvo.getCus_id());

                    if (result != null) {
                        String cus_pw = request.getParameter("cus_pw");

                        // JSON 응답 설정
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");

                        boolean isValid = BCrypt.checkpw(cus_pw, result.getCus_pw());

                        // JSON 응답 반환
                        try (PrintWriter out = response.getWriter()) {
                            out.print("{");
                            out.print("\"success\": true,");
                            out.print("\"data\": {");
                            out.print("\"valid\": " + isValid);
                            out.print("}");
                            out.print("}");

                            out.flush();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else {
                        // result가 null인 경우 JSON 응답 반환
                        try (PrintWriter out = response.getWriter()) {
                            out.print("{");
                            out.print("\"success\": true,");
                            out.print("\"data\": {");
                            out.print("\"valid\": false");
                            out.print("}");
                            out.print("}");

                            out.flush();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }

                    return null;
                case "update":
                    System.out.println(" --------------- update ----------------- ");
                    viewPath = "/user/customer/jsp/mypage/profileEdit.jsp";
                    break;
            }
        } else {
            // 보유 적립금
            int points = PointDAO.selectSavePoint(cvo.getId());
            request.setAttribute("points", points);

            // 보유 쿠폰 수
            int coupons = CouponDAO.selectCouponCount(cvo.getId(), cvo.getGrade_no());
            request.setAttribute("coupons", coupons);

            // 후기 작성할 수 있는 건수
            int ableCount = OrderDAO.selectReviewAbleCount(cvo.getId());
            request.setAttribute("ableCount", ableCount);

            viewPath = "/user/customer/jsp/mypage/mypage.jsp";
        }

        return viewPath;
    }
}
