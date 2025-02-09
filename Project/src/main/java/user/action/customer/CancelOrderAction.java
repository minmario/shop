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
import java.util.ArrayList;
import java.util.List;

import static user.dao.customer.PointDAO.calculateRefundPoint;

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

        List<OrderVO> o_list = null;
        List<DeliveryVO> d_list = null;
        List<OrderVO> coupon = null;
        int totalPrice = 0;
        int totalSaledPrice = 0;
        int point_amount = 0;

        if (action != null) {
            switch (action) {
                case "select":
                    o_list = OrderDAO.selectOrderProduct(id, cvo.getId(), order_code);
                    d_list = DeliveryDAO.selectDelivery(cvo.getId());
                    coupon = OrderDAO.selectOrderCoupons(id, cvo.getId(), order_code, prod_no); // 쿠폰 정보 가져오기
                    totalPrice = OrderDAO.selectTotalPrice(cvo.getId(), order_code);
                    totalSaledPrice = OrderDAO.selectTotalSaledPrice(cvo.getId(), order_code);
                    point_amount = PointDAO.selectPointAmount(cvo.getId(), order_code);

                    request.setAttribute("o_list", o_list);
                    request.setAttribute("d_list", d_list);
                    request.setAttribute("coupon", coupon);
                    request.setAttribute("totalPrice", totalPrice);
                    request.setAttribute("totalSaledPrice", totalSaledPrice);
                    request.setAttribute("point_amount", point_amount);

                    return "/user/customer/jsp/mypage/cancelOrder.jsp";

                case "select_all":
                    try {
                        o_list = OrderDAO.selectOrderProductAll(cvo.getId(), order_code);
                        d_list = DeliveryDAO.selectDelivery(cvo.getId());
                        coupon = OrderDAO.selectOrderCoupons(null, cvo.getId(), order_code, null); // 쿠폰 정보 가져오기
                        totalPrice = OrderDAO.selectTotalPrice(cvo.getId(), order_code);
                        totalSaledPrice = OrderDAO.selectTotalSaledPrice(cvo.getId(), order_code);
                        point_amount = PointDAO.selectPointAmount(cvo.getId(), order_code);

                        request.setAttribute("o_list", o_list);
                        request.setAttribute("d_list", d_list);
                        request.setAttribute("coupon", coupon);
                        request.setAttribute("totalPrice", totalPrice);
                        request.setAttribute("totalSaledPrice", totalSaledPrice);
                        request.setAttribute("point_amount", point_amount);

                        return "/user/customer/jsp/mypage/cancelOrder.jsp";
                    } catch (Exception e) {
                        e.printStackTrace();
                        return "/user/customer/jsp/error/error.jsp";
                    }
                case "update":
                    try {
                        String orderCode = request.getParameter("orderCode");
                        String reason = request.getParameter("reason");
                        String refund_bank = request.getParameter("bank");
                        String refund_account = request.getParameter("account_number");
                        String refundAmount = request.getParameter("refund_amount");
                        String point_used = request.getParameter("point_used");

                        System.out.println("[UPDATE] orderCode: " + orderCode);
                        System.out.println("[UPDATE] reason: " + reason);
                        System.out.println("[UPDATE] refund_bank: " + refund_bank);
                        System.out.println("[UPDATE] refund_account: " + refund_account);

                        // 주문 정보 업데이트 (취소 상태로 변경)
                        int u_o_cnt = OrderDAO.updateOrderCancel(id, cvo.getId(), prod_no, orderCode, refund_bank, refund_account, reason);
                        if (u_o_cnt == 0) {
                            System.out.println("[UPDATE] 주문 상태 업데이트 실패");
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");
                            try (PrintWriter out = response.getWriter()) {
                                out.print("{\"success\": false, \"message\": \"주문 상태 업데이트 실패\"}");
                                out.flush();
                            }
                            return null;
                        }

                        System.out.println("[UPDATE] 주문 상태 업데이트 성공");

                        // point_used가 존재하고 사용된 경우에만 실행
                        int refundAmountValue = Integer.parseInt(refundAmount);
                        if (point_used != null && !point_used.isEmpty() && Integer.parseInt(point_used) > 0) {
                            int totalOrderAmount = OrderDAO.selectTotalAmount(cvo.getId(), orderCode);
                            int usedPointAmount = Integer.parseInt(point_used);

                            int refundPointAmount = PointDAO.calculateRefundPoint(totalOrderAmount, refundAmountValue, usedPointAmount);

                            // 포인트 삭제 및 복구
                            PointDAO.deletePoint(cvo.getId(), orderCode);
                            PointDAO.insertPoint(cvo.getId(), String.valueOf(refundPointAmount), orderCode);
                            System.out.println("[UPDATE] 포인트 삭제 및 복구 완료");
                        }

                        // 쿠폰 복구 처리
                        int u_co_cnt = CouponDAO.updateCusCoupon(cvo.getId(), orderCode);
                        System.out.println("[UPDATE] 쿠폰 복구 완료");

                        // 고객 누적 금액 업데이트
                        int currentTotal = Integer.parseInt(cvo.getTotal());
                        int totalINT = currentTotal - refundAmountValue;
                        CustomerDAO.updateTotal(cvo.getId(), String.valueOf(totalINT));
                        System.out.println("[UPDATE] 고객 누적 금액 업데이트 완료");

                        // JSON 응답 전송
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        try (PrintWriter out = response.getWriter()) {
                            out.print("{\"success\": true}");
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
                        }
                    }
                    return null;

                case "update_all":
                    try {
                        String orderCode = request.getParameter("orderCode");
                        String reason = request.getParameter("reason");
                        String refund_bank = request.getParameter("bank");
                        String refund_account = request.getParameter("account_number");
                        String refundAmount = request.getParameter("refund_amount");
                        String point_used = request.getParameter("point_used");

                        System.out.println("[UPDATE_ALL] orderCode: " + orderCode);
                        System.out.println("[UPDATE_ALL] reason: " + reason);
                        System.out.println("[UPDATE_ALL] refund_bank: " + refund_bank);
                        System.out.println("[UPDATE_ALL] refund_account: " + refund_account);

                        // 전체 상품 조회
                        List<OrderVO> orderList = OrderDAO.selectOrderProductAll(cvo.getId(), orderCode);
                        if (orderList == null || orderList.isEmpty()) {
                            System.out.println("[UPDATE_ALL] 환불 가능한 상품이 없습니다.");
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");
                            try (PrintWriter out = response.getWriter()) {
                                out.print("{\"success\": false, \"message\": \"환불 가능한 상품이 없습니다.\"}");
                                out.flush();
                            }
                            return null;
                        }

                        List<String> idList = new ArrayList<>();
                        for (OrderVO order : orderList) {
                            System.out.println("Order ID: " + order.getId());
                            idList.add(order.getId());
                        }

                        int cnt = OrderDAO.updateOrderCancelAll(idList, cvo.getId(), orderCode, refund_bank, refund_account, reason);

                        int totalRefundAmount = Integer.parseInt(refundAmount);
                        if (cnt > 0) {
                            System.out.println("[UPDATE_ALL] 주문 상태 업데이트 성공");

                            if (point_used != null && !point_used.isEmpty() && Integer.parseInt(point_used) > 0) {
                                PointDAO.deletePoint(cvo.getId(), orderCode);
                                System.out.println("[UPDATE_ALL] 포인트 삭제 완료");

                                int usedPointAmount = Integer.parseInt(point_used);
                                int refundPointAmount = calculateRefundPoint(totalRefundAmount, totalRefundAmount, usedPointAmount);

                                PointDAO.insertPoint(cvo.getId(), String.valueOf(refundPointAmount), orderCode);
                                System.out.println("[UPDATE_ALL] 포인트 복구 완료");
                            }

                            CouponDAO.updateCusCoupon(cvo.getId(), orderCode);
                            System.out.println("[UPDATE_ALL] 쿠폰 복구 완료");

                            int currentTotal = Integer.parseInt(cvo.getTotal());
                            CustomerDAO.updateTotal(cvo.getId(), String.valueOf(currentTotal - totalRefundAmount));
                            System.out.println("[UPDATE_ALL] 고객 누적 금액 업데이트 완료");

                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");
                            try (PrintWriter out = response.getWriter()) {
                                out.print("{\"success\": true}");
                                out.flush();
                            }
                        } else {
                            System.out.println("[UPDATE_ALL] 주문 상태 업데이트 실패");
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");
                            try (PrintWriter out = response.getWriter()) {
                                out.print("{\"success\": false, \"message\": \"주문 상태 업데이트 실패\"}");
                                out.flush();
                            }
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
                                throw new RuntimeException(ex);
                            }
                        }
                    }
                    return null;
            }
        }

        return "/user/customer/jsp/error/error.jsp";
    }
}
