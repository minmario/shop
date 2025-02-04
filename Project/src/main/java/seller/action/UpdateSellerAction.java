package seller.action;

import javax.servlet.http.HttpServletRequest;

import comm.action.Action;
import comm.dao.SellerDAO;
import comm.vo.SellerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateSellerAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 폼에서 전달된 값 가져오기


        String sellerId = request.getParameter("sellerId");
        System.out.println(sellerId);
        String name = request.getParameter("brandName");
        String phone = request.getParameter("brandPhone");
        String email = request.getParameter("brandEmail");
        String address = request.getParameter("brandAddress");
        String desc = request.getParameter("brandDesc");

        // SellerVO 객체 생성 및 값 설정
        SellerVO sellerVO = new SellerVO();
        sellerVO.setSeller_id(sellerId);
        sellerVO.setName(name);
        sellerVO.setPhone(phone);
        sellerVO.setEmail(email);
        sellerVO.setAddress(address);
        sellerVO.setDesc(desc);

        // DAO를 통해 데이터베이스 업데이트 실행
        int updateSuccess = SellerDAO.updateSeller(sellerVO);

        if (updateSuccess == 1) {
            System.out.println("✅ UpdateSellerAction: 데이터 업데이트 성공!");
        } else {
            System.err.println("❌ UpdateSellerAction: 데이터 업데이트 실패!");
        }

        // 업데이트 후 브랜드 정보 페이지로 리다이렉트
        SellerVO updatedVO = SellerDAO.getSellerInfo();
        request.setAttribute("vo", updatedVO);
        return "/seller/jsp/brandinfo.jsp";
    }
}
