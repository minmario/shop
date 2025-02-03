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
            request.setAttribute("session_expired", true);
            return "/user/jsp/error/error.jsp";
        }

        String action = request.getParameter("action");
        String id = request.getParameter("order_id");
        String order_code = request.getParameter("order_code");

        if (action != null) {
            switch (action) {
                case "select":
                    try {
                        OrderVO o_vo = OrderDAO.selectOrderProduct(id, cvo.getId(), order_code);
                        List<DeliveryVO> d_list = DeliveryDAO.selectDelivery(cvo.getId());
                        int point_amount = PointDAO.selectPointAmount(cvo.getId(), order_code);

                        request.setAttribute("o_vo", o_vo);
                        request.setAttribute("d_list", d_list);
                        request.setAttribute("point_amount", point_amount);

                        return "/user/jsp/mypage/refundRequest.jsp";
                    } catch (Exception e) {
                        e.printStackTrace();
                        return "/user/jsp/error/error.jsp";
                    }
                case "update":
                    try {
                        // 요청 데이터 가져오기
                        String prodNo = request.getParameter("prod_no");
                        String orderCode = request.getParameter("orderCode");
                        String reason = request.getParameter("reason");
                        String retrieve_deli_no = request.getParameter("retrieve_deli_no");
                        String refund_bank = request.getParameter("bank");
                        String refund_account = request.getParameter("account_number");
                        String refundAmount = request.getParameter("refund_amount");
                        String point_used = request.getParameter("point_used");

                        // String 값을 숫자로 변환
                        int currentTotal = Integer.parseInt(cvo.getTotal());  // cvo.getTotal()을 정수로 변환
                        int refundAmountValue = Integer.parseInt(refundAmount);  // refundAmount를 정수로 변환

                        // 금액 계산
                        int totalINT = currentTotal - refundAmountValue;

                        // 결과를 다시 문자열로 변환하여 저장
                        String total = String.valueOf(totalINT);

                        // 주문 정보 업데이트 (반품 상태로 변경)
                        int u_o_cnt = OrderDAO.updateOrderRefund(cvo.getId(), prodNo, orderCode, refund_bank, refund_account, reason, retrieve_deli_no);

                        // 사용한 적립금 복구 (point_used null이 아닌 경우에만 실행)
                        int u_p_cnt = 0;
                        if (point_used != null && !point_used.isEmpty()) {
                            u_p_cnt = PointDAO.insertPoint(cvo.getId(), point_used, orderCode);
                        }

                        // 해당 고객의 누적 금액에서 환불금액 차감
                        int u_c_cnt = CustomerDAO.updateTotal(cvo.getId(), total);

                        // JSON 응답 설정
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");

                        try (PrintWriter out = response.getWriter()) {
                            if (u_o_cnt > 0 && u_c_cnt > 0) {
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
            }
        }

        return "/user/jsp/error/error.jsp";
    }
}
