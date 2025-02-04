package user.action.customer;

import user.action.Action;
import user.dao.customer.*;
import user.vo.customer.CustomerVO;
import user.vo.customer.DeliveryVO;
import user.vo.customer.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class CancelOrderAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        }

        String action = request.getParameter("action");
        String id = request.getParameter("order_id");
        String order_code = request.getParameter("order_code");
        String prod_no = request.getParameter("prod_no");

        if (action != null) {
            switch (action) {
                case "select":
                    OrderVO o_vo = OrderDAO.selectOrderProduct(id, cvo.getId(), order_code);
                    List<DeliveryVO> d_list = DeliveryDAO.selectDelivery(cvo.getId());
                    OrderVO coupon = OrderDAO.selectOrderCoupon(cvo.getId(), prod_no, order_code); // 쿠폰 정보 가져오기
                    int point_amount = PointDAO.selectPointAmount(cvo.getId(), order_code);

                    request.setAttribute("o_vo", o_vo);
                    request.setAttribute("d_list", d_list);
                    request.setAttribute("coupon", coupon);
                    request.setAttribute("point_amount", point_amount);

                    return "/user/customer/jsp/mypage/cancelOrder.jsp";
                case "update":
                    try {
                        // 요청 데이터 가져오기
                        String orderCode = request.getParameter("orderCode");
                        String reason = request.getParameter("reason");
                        String refund_bank = request.getParameter("bank");
                        String refund_account = request.getParameter("account_number");
                        String refundAmount = request.getParameter("refund_amount");
                        String point_used = request.getParameter("point_used");

                        // 주문 정보 업데이트 (취소 상태로 변경)
                        int u_o_cnt = OrderDAO.updateOrderCancel(id, cvo.getId(), prod_no, orderCode, refund_bank, refund_account, reason);

                        if (u_o_cnt == 0) {
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");
                            try (PrintWriter out = response.getWriter()) {
                                out.print("{\"success\": false, \"message\": \"주문 상태 업데이트 실패\"}");
                                out.flush();
                            }
                            return null;
                        }

                        // null 또는 빈 문자열 값 확인
                        boolean isRefundDataMissing = (refund_bank == null || refund_bank.isEmpty()) ||
                                (refund_account == null || refund_account.isEmpty()) ||
                                (refundAmount == null || refundAmount.isEmpty());

                        if (isRefundDataMissing) {
                            // 필수 데이터가 없을 경우, 주문 상태 업데이트 후 함수 종료
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");

                            try (PrintWriter out = response.getWriter()) {
                                if (u_o_cnt > 0) {
                                    out.print("{\"success\": true, \"message\": \"주문 상태가 업데이트되었습니다.\"}");
                                } else {
                                    out.print("{\"success\": false, \"message\": \"주문 업데이트 실패\"}");
                                }
                                out.flush();
                            }
                            return null;  // 이후 로직 건너뜀
                        }

                        // String 값을 숫자로 변환
                        int currentTotal = Integer.parseInt(cvo.getTotal());  // cvo.getTotal()을 정수로 변환
                        int refundAmountValue = Integer.parseInt(refundAmount);  // refundAmount를 정수로 변환

                        // 금액 계산
                        int totalINT = currentTotal - refundAmountValue;

                        // 결과를 다시 문자열로 변환하여 저장
                        String total = String.valueOf(totalINT);

                        // 사용한 적립금 복구 (point_used가 null이 아닌 경우에만 실행)
                        int u_p_cnt = 0;
                        if (point_used != null && !point_used.isEmpty()) {
                            u_p_cnt = PointDAO.insertPoint(cvo.getId(), point_used, orderCode);
                        }

                        // 사용한 쿠폰 복구
                        int u_co_cnt = CouponDAO.updateCusCoupon(cvo.getId(), orderCode);

                        // 해당 고객의 누적 금액에서 환불금액 차감
                        int u_c_cnt = CustomerDAO.updateTotal(cvo.getId(), total);

                        System.out.println("주문 내역 변경" + u_o_cnt);
                        System.out.println("포인트 복구" + u_p_cnt);
                        System.out.println("쿠폰 복구" + u_co_cnt);
                        System.out.println("환불 내역" + u_c_cnt);

                        // JSON 응답 설정
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");

                        try (PrintWriter out = response.getWriter()) {
                            if (u_o_cnt > 0 && u_c_cnt > 0) {
                                out.print("{\"success\": true}");
                            } else {
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

        return "/user/customer/jsp/error/error.jsp";
    }
}
