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

public class RefundRequestAction implements Action {
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

        List<OrderVO> o_list = null;
        List<DeliveryVO> d_list = null;
        List<OrderVO> coupon = null;
        int point_amount = 0;

        if (action != null) {
            switch (action) {
                case "select":
                    try {
                        o_list = OrderDAO.selectOrderProduct(id, cvo.getId(), order_code);
                        d_list = DeliveryDAO.selectDelivery(cvo.getId());
                        coupon = OrderDAO.selectOrderCoupons(cvo.getId(), order_code, prod_no); // 쿠폰 정보 가져오기
                        point_amount = PointDAO.selectPointAmount(cvo.getId(), order_code);

                        request.setAttribute("o_list", o_list);
                        request.setAttribute("d_list", d_list);
                        request.setAttribute("coupon", coupon);
                        request.setAttribute("point_amount", point_amount);

                        return "/user/customer/jsp/mypage/refundRequest.jsp";
                    } catch (Exception e) {
                        e.printStackTrace();
                        return "/user/customer/jsp/error/error.jsp";
                    }

                case "select_all":
                    try {
                        o_list = OrderDAO.selectOrderProduct(null, cvo.getId(), order_code);
                        d_list = DeliveryDAO.selectDelivery(cvo.getId());
                        coupon = OrderDAO.selectOrderCoupons(cvo.getId(), order_code, null); // 쿠폰 정보 가져오기
                        point_amount = PointDAO.selectPointAmount(cvo.getId(), order_code);

                        request.setAttribute("o_list", o_list);
                        request.setAttribute("d_list", d_list);
                        request.setAttribute("coupon", coupon);
                        request.setAttribute("point_amount", point_amount);

                        return "/user/customer/jsp/mypage/refundRequest.jsp";
                    } catch (Exception e) {
                        e.printStackTrace();
                        return "/user/customer/jsp/error/error.jsp";
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

                        System.out.println(id);
                        System.out.println(prodNo);
                        System.out.println(orderCode);
                        System.out.println(reason);
                        System.out.println(retrieve_deli_no);
                        System.out.println(refund_bank);
                        System.out.println(refund_account);
                        System.out.println(refundAmount);
                        System.out.println(point_used);

                        // String 값을 숫자로 변환
                        int currentTotal = Integer.parseInt(cvo.getTotal());  // cvo.getTotal()을 정수로 변환
                        int refundAmountValue = Integer.parseInt(refundAmount);  // refundAmount를 정수로 변환

                        // 금액 계산
                        int totalINT = currentTotal - refundAmountValue;

                        // 결과를 다시 문자열로 변환하여 저장
                        String total = String.valueOf(totalINT);

                        // 주문 정보 업데이트 (반품 상태로 변경)
                        int u_o_cnt = OrderDAO.updateOrderRefund(id, cvo.getId(), prodNo, orderCode, refund_bank, refund_account, reason, retrieve_deli_no);

                        // 이전 적립금 내역 삭제
                        int d_p_cnt = 0;
                        if (point_used != null && !point_used.isEmpty()) {
                            d_p_cnt = PointDAO.deletePoint(cvo.getId(), orderCode);
                        }

                        // 사용한 적립금 복구 (point_used null이 아닌 경우에만 실행)
                        int u_p_cnt = 0;
                        if (point_used != null && !point_used.isEmpty()) {
                            u_p_cnt = PointDAO.insertPoint(cvo.getId(), point_used, orderCode);
                        }

                        // 사용한 쿠폰 복구
                        int u_co_cnt = CouponDAO.updateCusCoupon(cvo.getId(), orderCode);

                        // 해당 고객의 누적 금액에서 환불금액 차감
                        int u_c_cnt = CustomerDAO.updateTotal(cvo.getId(), total);

                        System.out.println("주문 내역 변경" + u_o_cnt);
                        System.out.println("포인트 내역 삭제" + d_p_cnt);
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
                                System.err.println("Database update failed: Order or Point update affected 0 rows.");
                                out.print("{\"success\": false, \"message\": \"데이터베이스 업데이트 실패\"}");
                            }
                            out.flush();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    return null;
            }
        }

        return "/user/customer/jsp/error/error.jsp";
    }
}
