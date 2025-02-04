package user.action.customer;

import org.json.JSONObject;
import user.action.Action;
import user.dao.customer.*;
import user.vo.customer.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

public class OrderAction implements Action {
    private static final String HOST = "https://open-api.kakaopay.com";
    private static final String SECRET_KEY = "DEV3FACF03E22F89D2BFE1D14B430CCD153B9BAD";
    private static final String KAKAO_PAY_URL = "/online/v1/payment/ready";
    private static final String KAKAO_APPROVE = "/online/v1/payment/approve";

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        }

        String viewPage = null;
        if (action != null){
            switch (action) {
                case "all":
                    List<OrderVO> a_list = OrderDAO.selectAll(cvo.getId());
                    request.setAttribute("o_list", a_list);
                    viewPage = "/user/customer/jsp/mypage/components/order.jsp";
                    break;
                case "date":
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");
                    List<OrderVO> d_list = OrderDAO.selectDate(cvo.getId(), startDate, endDate);
                    request.setAttribute("o_list", d_list);
                    viewPage = "/user/customer/jsp/mypage/components/order.jsp";
                    break;
                case "coupon":
                    String prod_no = request.getParameter("prod_no");

                    List<CouponVO> coupons = CouponDAO.selectProdCoupon(prod_no, cvo.getGrade_no());

                    // 세션에 저장
                    session.setAttribute("coupons", coupons);

                    // JSON 응답을 클라이언트로 반환
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    try (PrintWriter out = response.getWriter()) {
                        out.print("{");
                        out.print("\"success\": true,");
                        out.print("\"data\": [");

                        if (coupons != null && !coupons.isEmpty()) {
                            for (int i = 0; i < coupons.size(); i++) {
                                CouponVO vo = coupons.get(i);

                                // JSON 객체 시작
                                out.print("{");
                                out.print("\"coupon_id\": \"" + vo.getId() + "\",");
                                out.print("\"name\": \"" + vo.getName() + "\",");
                                out.print("\"sale_per\": \"" + vo.getSale_per() + "\",");
                                out.print("\"end_date\": \"" + vo.getEnd_date() + "\"");
                                out.print("}");

                                // 마지막 요소가 아니면 쉼표 추가
                                if (i < coupons.size() - 1) {
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
                case "kakaopay":
                    // 쿠폰 목록
                    String order_code = request.getParameter("order_code");
                    String deli_no = request.getParameter("deli_no");
                    String save_point = request.getParameter("save_point");
                    String point_amount = request.getParameter("point_amount");
                    String total_amount = request.getParameter("total_amount");
                    String tax_free_amount = request.getParameter("tax_free_amount");
                    String productsJson = request.getParameter("products");  // JSON 문자열로 받음

                    List<CartVO> cartItems = (List<CartVO>) session.getAttribute("cartItems");

                    String prod_name = null;
                    String quantity = null;
                    if (cartItems != null && !cartItems.isEmpty()) {
                        if (cartItems.size() > 1) {
                            // 첫 번째 상품 이름 + "외" + (나머지 상품 개수) + "개"
                            prod_name = cartItems.get(0).getP_name() + " 외 " + (cartItems.size() - 1) + "개";

                            int totalQuantity = 0;
                            for (CartVO item : cartItems) {
                                totalQuantity += Integer.parseInt(item.getCount()); // 모든 아이템의 count 값을 누적
                            }
                            quantity = String.valueOf(totalQuantity); // 누적된 값을 문자열로 변환하여 저장
                        } else {
                            // 상품이 1개일 경우, 해당 상품 이름만 설정
                            prod_name = cartItems.get(0).getP_name();

                            // cartItems.size()가 1인 경우 첫 번째 아이템의 count를 가져옴
                            quantity = String.valueOf(cartItems.get(0).getCount());
                        }
                    }

                    try {
                        // 카카오페이 API에 보낼 파라미터 준비
                        HashMap<String, String> map = new HashMap<>();
                        map.put("cid", "TC0ONETIME"); // 테스트용 상점 ID
                        map.put("partner_order_id", order_code); // 주문 코드
                        map.put("partner_user_id", cvo.getId()); // 회원 번호
                        map.put("item_name", prod_name); // 상품 명
                        map.put("quantity", quantity); // 상품 수량
                        map.put("total_amount", total_amount); // 상품 가격
                        map.put("tax_free_amount", tax_free_amount); // 비과세 금액
                        map.put("approval_url", "http://localhost:8080/shop/user/customer/jsp/payment/approve.jsp"); // 성공 시 url
                        map.put("fail_url", "http://localhost:8080/fail"); // 실패 시 url
                        map.put("cancel_url", "http://localhost:8080/cancel"); // 취소 시 url

                        // HashMap을 JSONObject로 변환
                        JSONObject json = new JSONObject(map);
                        String jsonPayload = json.toString();

                        // API 요청
                        URL url = new URL(HOST + KAKAO_PAY_URL);
                        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                        conn.setRequestMethod("POST");
                        conn.setRequestProperty("Authorization", "SECRET_KEY " + SECRET_KEY);
                        conn.setRequestProperty("Content-Type", "application/json");
                        conn.setDoOutput(true);

                        // JSON 데이터 전송
                        try (OutputStream os = conn.getOutputStream()) {
                            os.write(jsonPayload.getBytes("UTF-8"));
                            os.flush();
                        }

                        // 응답 처리
                        int responseCode = conn.getResponseCode();
                        BufferedReader br = new BufferedReader(new InputStreamReader(
                                (responseCode == 200) ? conn.getInputStream() : conn.getErrorStream(), "UTF-8"
                        ));

                        StringBuilder responseStr = new StringBuilder();
                        String line;
                        while ((line = br.readLine()) != null) {
                            responseStr.append(line);
                        }
                        br.close();

                        // 응답에서 TID 추출
                        String jsonResponse = responseStr.toString();
                        JSONObject responseJson = new JSONObject(jsonResponse);

                        if (responseCode == 200) {
                            System.out.println("payment API 요청 성공: " + jsonResponse);

                            String tid = responseJson.optString("tid");

                            session.setAttribute("tid", tid);
                            session.setAttribute("deli_no", deli_no);
                            session.setAttribute("save_point", save_point); // 적립할 적립금
                            session.setAttribute("point_amount", point_amount); // 사용한 적립금
                            session.setAttribute("order_code", order_code);

                            if (productsJson != null) {
                                session.setAttribute("products", productsJson);
                            }

                            // JSON 응답을 클라이언트로 반환
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");

                            try (PrintWriter out = response.getWriter()) {
                                out.print("{");
                                out.print("\"success\": true,");
                                out.print("\"data\": {");
                                out.print("\"tid\": \"" + responseJson.optString("tid") + "\",");
                                out.print("\"next_redirect_pc_url\": \"" + responseJson.optString("next_redirect_pc_url") + "\"");
                                out.print("}");
                                out.print("}");

                                out.flush();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        } else {
                            System.out.println("payment API 요청 실패: " + jsonResponse);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    return null;
                case "approve":
                    String pg_token = request.getParameter("pg_token");
                    order_code = (String) session.getAttribute("order_code");
                    String tid = (String) session.getAttribute("tid");

                    HashMap<String, String> map = new HashMap<>();
                    map.put("cid", "TC0ONETIME"); // 가맹점 코드(테스트용)
                    map.put("tid", tid); // 결제 고유번호
                    map.put("partner_order_id", order_code); // 주문 번호
                    map.put("partner_user_id", cvo.getId()); // 회원 번호
                    map.put("pg_token", pg_token); // 결제 승인 요청 인증 토큰

                    // HashMap을 JSONObject로 변환
                    JSONObject json = new JSONObject(map);
                    String jsonPayload = json.toString();

                    // API 요청
                    try {
                        URL url = new URL(HOST + KAKAO_APPROVE);
                        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                        conn.setRequestMethod("POST");
                        conn.setRequestProperty("Authorization", "SECRET_KEY " + SECRET_KEY);
                        conn.setRequestProperty("Content-Type", "application/json");
                        conn.setDoOutput(true);

                        // JSON 데이터 전송
                        try (OutputStream os = conn.getOutputStream()) {
                            os.write(jsonPayload.getBytes("UTF-8"));
                            os.flush();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        // 응답 처리
                        int responseCode = conn.getResponseCode();
                        BufferedReader br = new BufferedReader(new InputStreamReader(
                                (responseCode == 200) ? conn.getInputStream() : conn.getErrorStream(), "UTF-8"
                        ));

                        StringBuilder responseStr = new StringBuilder();
                        String line;
                        while ((line = br.readLine()) != null) {
                            responseStr.append(line);
                        }
                        br.close();

                        // 응답에서 TID 추출
                        String jsonResponse = responseStr.toString();
                        JSONObject responseJson = new JSONObject(jsonResponse);

                        if (responseCode == 200) {
                            System.out.println("approve API 요청 성공: " + jsonResponse);

                            String productsJsonString = (String) session.getAttribute("products");

                            if (productsJsonString != null && !productsJsonString.isEmpty()) {
                                try {
                                    // JSON 파싱
                                    JSONObject products = new JSONObject(productsJsonString);

                                    // 각 제품 데이터 출력 및 처리
                                    for (String cartNo : products.keySet()) {
                                        JSONObject productData = products.getJSONObject(cartNo).getJSONObject("prod");

                                        // amount와 count 값 가져오기
                                        int amount = productData.optInt("amount", 0);
                                        int count = productData.optInt("count", 0);
                                        String a_prod_no = productData.optString("prodNo");
                                        String inventory_no = productData.optString("inventoryNo");

                                        // coupon 값 가져오기 (없을 경우 null 설정)
                                        String coupon = products.getJSONObject(cartNo).optString("coupon", null);

                                        // DB order 테이블, 주문 저장
                                        String i_tid = responseJson.optString("tid");
                                        String i_order_code = responseJson.optString("partner_order_id");
                                        String i_deli_no = (String) session.getAttribute("deli_no");
                                        OrderDAO.insertOrder(i_tid, cvo.getId(), a_prod_no, coupon, i_deli_no, i_order_code, String.valueOf(count), String.valueOf(amount), inventory_no);

                                        // DB customer 테이블, total 수정
                                        CustomerDAO.updateAddTotal(cvo.getId(), String.valueOf(amount));

                                        // DB cus_coupon 테이블, 사용 쿠폰 저장
                                        CouponDAO.insertCusCoupon(cvo.getId(), coupon, i_order_code);

                                        // DB log 테이블, 로그 저장
                                        LogVO lvo = new LogVO();
                                        StringBuffer sb = new StringBuffer();
                                        lvo.setCus_no(cvo.getId());
                                        lvo.setTarget("order 추가");
                                        sb.append("tid : " + i_tid + ", ");
                                        sb.append("inventory_no : " + inventory_no);
                                        lvo.setCurrent(sb.toString());
                                        LogDAO.insertLog(lvo);
                                    }

                                    // DB point 테이블, 사용한 적립금 저장
                                    String i_point_amount = (String) session.getAttribute("point_amount");
                                    if (i_point_amount != null && !i_point_amount.isEmpty()) {
                                        PointVO u_pvo = new PointVO();
                                        u_pvo.setCus_no(cvo.getId());
                                        u_pvo.setAmount(i_point_amount);
                                        u_pvo.setOrder_code(order_code);
                                        u_pvo.setP_type("1");
                                        PointDAO.insertUsePoint(u_pvo);
                                    }

//                                    // DB point 테이블, 적립할 적립금 저장
//                                    String i_save_point = (String) session.getAttribute("save_point");
//                                    if (i_save_point != null && !i_save_point.equals("0")) {
//                                        PointVO s_pvo = new PointVO();
//                                        s_pvo.setCus_no(cvo.getId());
//                                        s_pvo.setAmount(i_save_point);
//                                        s_pvo.setOrder_code(order_code);
//                                        s_pvo.setP_type("0");
//                                        PointDAO.insertUsePoint(s_pvo);
//                                    }

                                    // DB 장바구니 테이블 삭제
                                    cartItems = (List<CartVO>) session.getAttribute("cartItems");
                                    for (CartVO item : cartItems) {
                                        CartDAO.deleteCart(cvo.getId(), item.getId());
                                    }

                                    // 장바구니 수
                                    int cart_count = CartDAO.selectCartCount(cvo.getId());
                                    session.setAttribute("cart_count", cart_count);

                                    // 세션 삭제
                                    session.removeAttribute("cartItems");
                                    session.removeAttribute("order_code");
                                    session.removeAttribute("tid");
                                    session.removeAttribute("deli_no");
                                    session.removeAttribute("save_point");
                                    session.removeAttribute("point_amount");
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    System.out.println("Error parsing products JSON.");
                                }
                            } else {
                                System.out.println("No products data found in session.");
                            }
                        } else {
                            System.out.println("approve API 요청 실패: " + jsonResponse);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    viewPage = "/user/customer/jsp/payment/orderCompleted.jsp";
                    break;
            }
        }

        return viewPage;
    }
}
