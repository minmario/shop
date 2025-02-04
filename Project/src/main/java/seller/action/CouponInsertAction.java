package seller.action;


import comm.action.Action;
import comm.dao.CouponDAO;
import comm.vo.CouponVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CouponInsertAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 폼에서 전달된 데이터 받기
        String name = request.getParameter("name");
        System.out.println(name);
        String sale_per = request.getParameter("sale_per");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String category_no = request.getParameter("category_no");
        System.out.println(category_no);
        String grade_no = request.getParameter("grade_no");

        // 쿠폰 객체 생성 및 값 설정
        CouponVO coupon = new CouponVO();
        coupon.setName(name);
        coupon.setSale_per(sale_per);
        coupon.setStart_date(start_date);
        coupon.setEnd_date(end_date);
        coupon.setCategory_no(category_no);
        coupon.setGrade_no(grade_no);

        // 쿠폰 추가 실행
        int result = CouponDAO.insertCoupon(coupon);
        System.out.println(coupon);

        if (result > 0) {
            System.out.println("✅ CouponInsertAction: Coupon inserted successfully!");
        } else {
            System.err.println("❌ CouponInsertAction: Failed to insert coupon.");
        }
        request.setAttribute("coupon", coupon);
        // 추가 후 쿠폰 목록 페이지로 이동
        return "/Controller?type=couponList";
    }
}