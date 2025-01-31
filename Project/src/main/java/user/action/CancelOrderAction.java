package user.action;

import user.dao.CustomerDAO;
import user.dao.DeliveryDAO;
import user.dao.OrderDAO;
import user.dao.PointDAO;
import user.vo.CustomerVO;
import user.vo.DeliveryVO;
import user.vo.OrderVO;

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
            return "/user/jsp/error/error.jsp";
        }

        String cus_no = cvo.getId();
        String action = request.getParameter("action");
        String order_code = request.getParameter("order_code");

        if (action != null) {
            switch (action) {
                case "select":
                    List<OrderVO> o_list = OrderDAO.selectOrderCode(cus_no, order_code);
                    List<DeliveryVO> d_list = DeliveryDAO.selectDelivery(cus_no);

                    request.setAttribute("o_list", o_list);
                    request.setAttribute("d_list", d_list);

                    return "/user/jsp/mypage/cancelOrder.jsp";

                case "update":
                    try {
                        // 요청 데이터 가져오기
                        String[] prodNos = request.getParameterValues("prod_no_list[]");
                        String orderCode = request.getParameter("orderCode");
                        String reason = request.getParameter("reason");
                        String retrieve_deli_no = request.getParameter("retrieve_deli_no");
                        String refund_bank = request.getParameter("bank");
                        String refund_account = request.getParameter("account_number");
                        String refundAmount = request.getParameter("refund_amount");

                        // String 값을 숫자로 변환
                        int currentTotal = Integer.parseInt(cvo.getTotal());  // cvo.getTotal()을 정수로 변환
                        int refundAmountValue = Integer.parseInt(refundAmount);  // refundAmount를 정수로 변환

                        // 금액 계산
                        int totalINT = currentTotal - refundAmountValue;

                        // 결과를 다시 문자열로 변환하여 저장
                        String total = String.valueOf(totalINT);
                        System.out.println(total);


                        // 주문 정보 업데이트 (취소 상태로 변경)
                        int u_o_cnt = OrderDAO.updateOrderCancel(cus_no, prodNos, orderCode, refund_bank, refund_account, reason, retrieve_deli_no);
                        System.out.println("Order update result: " + u_o_cnt);

                        // 사용한 적립금 복구
                        int u_p_cnt = PointDAO.updatePoint(cus_no, orderCode);
                        System.out.println("Point update result: " + u_p_cnt);

                        // 해당 고객의 누적 금액에서 환불금액 차감
                        int u_c_cnt = CustomerDAO.updateTotal(cus_no, total);
                        System.out.println("Customer update result: " + u_c_cnt);

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


                default:
                    return "/user/jsp/error/error.jsp";
            }
        }

        return "/user/jsp/error/error.jsp";
    }
}
