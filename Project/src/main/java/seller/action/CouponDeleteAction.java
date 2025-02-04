package seller.action;

import comm.action.Action;
import comm.dao.CouponDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CouponDeleteAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        System.out.println(id);

        int result = CouponDAO.deleteCoupon(id);

        if (result > 0) {
            System.out.println("✅ CouponDeleteAction: Coupon deleted successfully!");
        } else {
            System.err.println("❌ CouponDeleteAction: Failed to delete coupon.");
        }

        return null; // 삭제 후 쿠폰 목록 페이지로 이동
    }
}
