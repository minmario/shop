package user.action.Snap;

import user.action.Action;
import user.dao.snap.SnapDao;
import user.vo.BoardVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateSnapAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {
    int id = Integer.parseInt(request.getParameter("id"));
    String content = request.getParameter("content");
    String gender = request.getParameter("gender");
    String season = request.getParameter("season");
    String style = request.getParameter("style");

    SnapDao dao = new SnapDao();
    BoardVO board = dao.getSnapDetail(id);

    if (board != null) {
      board.setContent(content);
      board.setGender(gender);
      board.setSeason(season);
      board.setStyle(style);

      boolean success = dao.updateBoard(board);

      if (success) {
        return "Controller?type=snap";
      } else {
        request.setAttribute("error", "수정에 실패했습니다.");
        return "/user/jsp/error.jsp";
      }
    }

    request.setAttribute("error", "존재하지 않는 게시물입니다.");
    return "/user/jsp/error.jsp";
  }
}
