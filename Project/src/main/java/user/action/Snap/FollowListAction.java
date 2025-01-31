package user.action.Snap;

import com.google.gson.Gson;
import user.action.Action;
import user.dao.snap.FollowDao;
import user.vo.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

public class FollowListAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {
    try {
      int userId = Integer.parseInt(request.getParameter("userId"));
      System.out.println("userId = " + userId);
      String type = request.getParameter("typeValue"); // follower or following
      System.out.println("type = " + type);

      // 세션에서 사용자 ID 가져오기
      Object sessionUserIdObj = request.getSession().getAttribute("cus_id");
      if (sessionUserIdObj == null) {
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "로그인이 필요합니다.");
        return null;
      }
      int sessionUserId = (int) sessionUserIdObj;

      // 데이터 조회
      FollowDao followDao = new FollowDao();
      List<CustomerVO> followList = (type.equals("follower"))
          ? followDao.getFollowers(userId, sessionUserId)
          : followDao.getFollowings(userId, sessionUserId);

      // JSON 응답 반환
      response.setContentType("application/json; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.print(new Gson().toJson(followList));
      out.flush();
      out.close();  // 🚨 반드시 close() 추가
      return null;
    } catch (NumberFormatException e) {
      System.err.println("userId 변환 중 오류 발생: " + e.getMessage());

    } catch (Exception e) {
      e.printStackTrace();

    }
    return null;
  }
}
