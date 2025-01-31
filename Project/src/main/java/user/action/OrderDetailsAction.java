package user.action;

import user.dao.DeliveryDAO;
import user.dao.LogDAO;
import user.dao.OrderDAO;
import user.dao.ProductDAO;
import user.vo.*;

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
            return "/user/jsp/error/error.jsp";
        }

        String action = request.getParameter("action");
        String order_code = request.getParameter("order_code");

        List<OrderVO> o_list = null;
        OrderVO vo = null;
        String viewPage = null;
        if(action != null){
            switch (action) {
                // 주문상세 조회
                case "select":
                    o_list = OrderDAO.selectOrderCode(cvo.getId(), order_code); // 주문상세 정보 list
                    List<DeliveryVO> deli_list = DeliveryDAO.selectDelivery(cvo.getId()); // 해당 주문의 배송지 정보
                    int totalPrice = OrderDAO.selectTotalPrice(cvo.getId(), order_code); // 원가 총 금액
                    int totalSaledPrice = OrderDAO.selectTotalSaledPrice(cvo.getId(), order_code); // 할인가 총 금액

                    request.setAttribute("o_list", o_list);
                    request.setAttribute("deli_list", deli_list);
                    request.setAttribute("totalPrice", totalPrice);
                    request.setAttribute("totalSaledPrice", totalSaledPrice);

                    viewPage = "/user/jsp/mypage/orderDetails.jsp";
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

//                case "select_size":
//                    String prod_no = request.getParameter("prod_no");
//                    List<String> size_list = OrderDAO.selectSize(prod_no);
//
//                    response.setContentType("application/json");
//                    response.setCharacterEncoding("UTF-8");
//
//                    try (PrintWriter out = response.getWriter()) {
//                        if (size_list != null && !size_list.isEmpty()) {
//                            out.print("{\"success\": true, \"options\": [");
//                            for (int i = 0; i < size_list.size(); i++) {
//                                out.print("\"" + size_list.get(i) + "\"");
//                                if (i < size_list.size() - 1) {
//                                    out.print(",");
//                                }
//                            }
//                            out.print("]}");
//                        } else {
//                            out.print("{\"success\": false, \"message\": \"옵션이 없습니다.\"}");
//                        }
//                        out.flush();
//                    } catch (IOException e) {
//                        e.printStackTrace();
//                    }
//                    return null;
            }

        }

        return viewPage;
    }
}
