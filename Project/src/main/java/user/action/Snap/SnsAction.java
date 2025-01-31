package user.action.Snap;

import user.action.Action;

import user.dao.snap.CustomerDao;
import user.dao.snap.FollowDao;
import user.dao.snap.SnapDao;
import user.vo.BoardVO;
import user.vo.CustomerVO;
import user.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class SnsAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {
    int boardNo = Integer.parseInt(request.getParameter("id"));

    // Snap 및 연관된 제품 데이터 가져오기
    SnapDao snapDao = new SnapDao();
    BoardVO snap = snapDao.getSnapDetail(boardNo);
    List<ProductVO> productList = snapDao.getProductsByBoardNo(boardNo);

    int cus_no = snap.getCus_no();
    int customerId = (int) request.getSession().getAttribute("cus_id");


    boolean isFollowing = FollowDao.isFollowing(customerId, cus_no);
    request.setAttribute("isFollowing", isFollowing);

    // ✅ 현재 로그인한 사용자 정보 가져오기
    CustomerDao userDao = new CustomerDao();
    CustomerVO myInfo = userDao.getUserProfile(customerId);
    request.setAttribute("myInfo", myInfo);

    // ✅ 추천 회원 목록 가져오기 (랜덤 5명)
    List<CustomerVO> recommendedUsers = userDao.getRandomUsers(5);
    request.setAttribute("recommendedUsers", recommendedUsers);

    // 데이터 전달
    request.setAttribute("snap", snap);
    request.setAttribute("productList", productList);

    return "user/jsp/snap/MySnap.jsp";
  }

}

