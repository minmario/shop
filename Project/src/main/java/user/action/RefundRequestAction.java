package user.action;

import user.dao.*;
import user.vo.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

public class RefundRequestAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            return "/user/jsp/error/error.jsp";
        }

        String cus_no = cvo.getId();
        String action = request.getParameter("action");
        String order_code = request.getParameter("order_code");

        if (action != null) {
            switch (action) {
                case "select":
                    try {
                        List<OrderVO> o_list = OrderDAO.selectOrderCode(cus_no, order_code);
                        List<DeliveryVO> d_list = DeliveryDAO.selectDelivery(cus_no);

                        request.setAttribute("o_list", o_list);
                        request.setAttribute("d_list", d_list);

                        return "/user/jsp/mypage/refundRequest.jsp";
                    } catch (Exception e) {
                        e.printStackTrace();
                        return "/user/jsp/error/error.jsp";
                    }

                case "update":
                    try {
                        // 요청 데이터 가져오기
                        String[] prodNos = request.getParameterValues("prod_no_list[]");
                        String reason = request.getParameter("reason");
                        String retrieve_deli_no = request.getParameter("retrieve_deli_no");
                        String refund_bank = request.getParameter("bank");
                        String refund_account = request.getParameter("account_number");
//                        System.out.println("Received data for update:");
//                        System.out.println("prodNos: " + Arrays.toString(prodNos));
//                        System.out.println("reason: " + reason);
//                        System.out.println("retrieve_deli_no: " + retrieve_deli_no);
//                        System.out.println("refund_bank: " + refund_bank);
//                        System.out.println("refund_account: " + refund_account);

                        // 주문 정보 업데이트 (반품 상태로 변경)
                        int u_o_cnt = OrderDAO.updateOrderRefund(cus_no, prodNos, order_code, refund_bank, refund_account, reason, retrieve_deli_no);
//                        System.out.println("Order update result: " + u_o_cnt);

                        // 사용한 적립금 복구
                        int u_p_cnt = PointDAO.updatePoint(cus_no, order_code);
//                        System.out.println("Point update result: " + u_p_cnt);

                        // JSON 응답 설정
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");

                        try (PrintWriter out = response.getWriter()) {
                            if (u_o_cnt > 0 && u_p_cnt > 0) {
                                out.print("{\"success\": true}");
                            } else {
                                System.err.println("Database update failed: Order or Point update affected 0 rows.");
                                out.print("{\"success\": false, \"message\": \"데이터베이스 업데이트 실패\"}");
                            }
                            out.flush();
                        }

                    } catch (Exception e) {
                        e.printStackTrace();

                        if (!response.isCommitted()) {
                            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");

                            try (PrintWriter out = response.getWriter()) {
                                out.print("{\"success\": false, \"message\": \"서버 오류 발생\"}");
                                out.flush();
                            } catch (IOException ex) {
                                ex.printStackTrace();
                            }
                        } else {
                            System.err.println("응답이 이미 커밋되었습니다.");
                        }
                    }
                    return null;

                default:
                    return "/user/jsp/error/error.jsp";
            }
        }

        return "/user/jsp/error/error.jsp";
    }
}
