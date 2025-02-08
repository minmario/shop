package user.action.customer;

import user.action.Action;
import user.dao.customer.*;
import user.vo.customer.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class OrderDetailsAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        }

        String action = request.getParameter("action");
        String order_code = request.getParameter("order_code");

        OrderVO vo = null;
        String viewPage = null;
        if(action != null){
            switch (action) {
                // 주문상세 조회
                case "select":
                    List<OrderVO> o_list = OrderDAO.selectOrderCode(cvo.getId(), order_code); // 주문상세 정보 list
                    List<DeliveryVO> deli_list = DeliveryDAO.selectDelivery(cvo.getId()); // 해당 주문의 배송지 정보
                    List<OrderVO> coupon = OrderDAO.selectOrderCoupons(null, cvo.getId(), order_code, null);
                    GradeVO grade = GradeDAO.selectGradeCustomer(cvo.getId());
                    int totalSaledPrice = OrderDAO.selectTotalSaledPrice(cvo.getId(), order_code);
                    int totalAmount = OrderDAO.selectTotalAmount(cvo.getId(), order_code); // 총 결제 금액
                    int totalPrice = OrderDAO.selectTotalPrice(cvo.getId(), order_code); // 원가 총 금액
                    int point_amount = PointDAO.selectPointAmount(cvo.getId(), order_code); // 사용한 적립금

                    request.setAttribute("o_list", o_list);
                    request.setAttribute("deli_list", deli_list);
                    request.setAttribute("coupon", coupon);
                    request.setAttribute("grade", grade);
                    request.setAttribute("grade", grade);
                    request.setAttribute("totalSaledPrice", totalSaledPrice);
                    request.setAttribute("totalAmount", totalAmount);
                    request.setAttribute("totalPrice", totalPrice);
                    request.setAttribute("point_amount", point_amount);

                    viewPage = "/user/customer/jsp/mypage/orderDetails.jsp";
                    break;
                case "update":
                    String prev_deli_no = request.getParameter("pre_delivery_id");
                    String deli_no = request.getParameter("delivery_id");
                    int o_cnt = OrderDAO.updateOrderDelivery(cvo.getId(), order_code, deli_no);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    try (PrintWriter out = response.getWriter()) {
                        if (o_cnt > 0) {
                            // 배송지 변경 성공 시, 변경된 데이터를 다시 조회
                            DeliveryVO updatedDelivery = DeliveryDAO.selectDeliveryById(deli_no);

                            // 로그 입력
                            LogVO lvo = new LogVO();
                            StringBuffer sb = new StringBuffer();
                            lvo.setCus_no(cvo.getId());
                            lvo.setTarget("order");
                            sb.append("cus_no : " + cvo.getId() + ", ");
                            sb.append("deli_no : " + prev_deli_no + ", ");
                            sb.append("order_code : " + order_code + ", ");
                            lvo.setPrev(sb.toString());
                            sb = new StringBuffer();
                            sb.append("cus_no : " + cvo.getId() + ", ");
                            sb.append("deli_no : " + deli_no + ", ");
                            sb.append("order_code : " + order_code + ", ");
                            lvo.setCurrent(sb.toString());
                            LogDAO.updateLog(lvo);

                            out.print("{");
                            out.print("\"success\": true,");
                            out.print("\"data\": {");
                            out.print("\"deli_name\": \"" + updatedDelivery.getName() + "\",");
                            out.print("\"phone\": \"" + updatedDelivery.getPhone() + "\",");
                            out.print("\"pos_code\": \"" + updatedDelivery.getPos_code() + "\",");
                            out.print("\"addr1\": \"" + updatedDelivery.getAddr1() + "\",");
                            out.print("\"addr2\": \"" + updatedDelivery.getAddr2() + "\"");
                            out.print("}");
                            out.print("}");
                        } else {
                            // 배송지 변경 실패 시 JSON 응답
                            out.print("{");
                            out.print("\"success\": false,");
                            out.print("\"message\": \"배송지 변경에 실패했습니다.\"");
                            out.print("}");
                        }
                        out.flush();
                    } catch (IOException e) {
                        e.printStackTrace();
                        try (PrintWriter out = response.getWriter()) {
                            out.print("{");
                            out.print("\"success\": false,");
                            out.print("\"message\": \"서버 내부 오류가 발생했습니다.\"");
                            out.print("}");
                            out.flush();
                        } catch (IOException ex) {
                            ex.printStackTrace();
                        }
                    }
                    return null;

                case "select_size":
                    String prod_no = request.getParameter("prod_no");

                    // 상품 사이즈 목록
                    List<ProductVO> productSize = ProductDAO.selectSize(prod_no);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    try (PrintWriter out = response.getWriter()) {
                        out.print("{");
                        out.print("\"success\": true,");
                        out.print("\"data\": [");

                        if (productSize != null && !productSize.isEmpty()) {
                            for (int i = 0; i < productSize.size(); i++) {
                                ProductVO pvo = productSize.get(i);

                                out.print("{");
                                out.print("\"prod_no\": \"" + pvo.getId() + "\",");
                                out.print("\"inventory_no\": \"" + pvo.getInventory_no() + "\",");
                                out.print("\"option_name\": \"" + pvo.getI_option_name() + "\"");
                                out.print("}");

                                if (i < productSize.size() - 1) {
                                    out.print(",");
                                }
                            }
                        }

                        out.print("]");
                        out.print("}");
                        out.flush();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    return null;

                case "update_size":
                    // 사이즈 변경
                    String us_id = request.getParameter("order_id");
                    String us_order_code = request.getParameter("order_code");
                    String us_prod_no = request.getParameter("prod_no");
                    String us_inventory_no = request.getParameter("inventory_no");

                    int u_cnt = OrderDAO.updateOrderSize(us_id, cvo.getId(), us_prod_no, us_order_code, us_inventory_no);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    try (PrintWriter out = response.getWriter()) {
                        if (u_cnt > 0) {
                            out.print("{\"success\": true}");
                        } else {
                            out.print("{\"success\": false, \"message\": \"업데이트 실패\"}");
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    return null;

            }

        }

        return viewPage;
    }
}
