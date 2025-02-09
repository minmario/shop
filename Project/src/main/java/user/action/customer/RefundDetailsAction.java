package user.action.customer;

import user.action.Action;
import user.dao.customer.DeliveryDAO;
import user.dao.customer.OrderDAO;
import user.dao.customer.PointDAO;
import user.vo.customer.CustomerVO;
import user.vo.customer.DeliveryVO;
import user.vo.customer.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class RefundDetailsAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        }

        String order_id = request.getParameter("order_id");
        String order_code = request.getParameter("order_code");
        String prod_no = request.getParameter("prod_no");

        // 주문 정보 조회
        OrderVO refund = OrderDAO.selectDetailsByStatus(order_id, cvo.getId(), prod_no, order_code, "7");

        // 배송 정보 조회
        DeliveryVO delivery = DeliveryDAO.selectRetrieveInfo(order_id);

        // 쿠폰 정보 조회 및 처리
        List<OrderVO> couponList = OrderDAO.selectOrderCoupons(order_id, cvo.getId(), order_code, prod_no);
        String couponName = null;
        int salePer = 0;
        if (couponList != null && !couponList.isEmpty()) {
            OrderVO coupon = couponList.get(0);
            couponName = coupon.getCoupon_name();
            salePer = (coupon.getSale_per() != null) ? Integer.parseInt(coupon.getSale_per()) : 0;
        }

        // 적립금 사용 금액 조회
        int pointAmount = PointDAO.selectPointAmount(cvo.getId(), order_code);

        // 반송지 정보 조회
        OrderVO sellerInfo = OrderDAO.selectSellerAddress(order_id);

        // JSP에 전달할 값 설정
        request.setAttribute("refund", refund);
        request.setAttribute("delivery", delivery);
        request.setAttribute("coupon_name", couponName);
        request.setAttribute("sale_per", salePer);
        request.setAttribute("point_amount", pointAmount);
        request.setAttribute("vo", sellerInfo);

        return "/user/customer/jsp/mypage/refundDetails.jsp";
    }
}
