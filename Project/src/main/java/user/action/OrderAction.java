package user.action;

import org.json.JSONArray;
import org.json.JSONObject;
import user.dao.DeliveryDAO;
import user.dao.OrderDAO;
import user.dao.PointDAO;
import user.vo.CustomerVO;
import user.vo.DeliveryVO;
import user.vo.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
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
            return "/user/jsp/error/error.jsp";
        }

        String viewPage = null;
        if (action != null){
            switch (action) {
                case "all":
                    List<OrderVO> a_list = OrderDAO.selectAll(cvo.getId());
                    request.setAttribute("o_list", a_list);
                    viewPage = "/user/jsp/mypage/components/order.jsp";
                    break;
                case "date":
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");
                    List<OrderVO> d_list = OrderDAO.selectDate(cvo.getId(), startDate, endDate);
                    request.setAttribute("o_list", d_list);
                    viewPage = "/user/jsp/mypage/components/order.jsp";
                    break;
                case "payment":
                    String order_code = request.getParameter("order_code");
                    String prod_name = request.getParameter("prod_name");
                    String quantity =  request.getParameter("quantity");
                    String total_amount = request.getParameter("total_amount");
                    String tax_free_amount = request.getParameter("tax_free_amount");

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
                        map.put("approval_url", "http://localhost:8080/shop/user/jsp/payment/approve.jsp"); // 성공 시 url
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
                        String tid = null;

                        if (responseCode == 200) {
                            System.out.println("payment API 요청 성공: " + jsonResponse);

                            tid = responseJson.optString("tid");
                        } else {
                            System.out.println("payment API 요청 실패: " + jsonResponse);
                        }

                        session.setAttribute("order_code", order_code);
                        session.setAttribute("tid", tid);

                        // JSON 응답을 클라이언트로 반환
                        response.setContentType("application/json; charset=UTF-8");
                        response.getWriter().write(responseJson.toString());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    break;
                case "approve":
                    String pg_token = request.getParameter("pg_token");
                    order_code = session.getAttribute("order_code").toString();
                    String tid = session.getAttribute("tid").toString();

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

                        if (responseCode == 200) {
                            System.out.println("approve API 요청 성공: " + jsonResponse);
                        } else {
                            System.out.println("approve API 요청 실패: " + jsonResponse);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    viewPage = "/user/jsp/payment/orderCompleted.jsp";
                    break;
                case "complete":
                    // DB order 테이블 저장
                    // DB log 테이블 저장

                    viewPage = "/user/jsp/payment/orderCompleted.jsp";
                    break;
            }
        }

        return viewPage;
    }
}
