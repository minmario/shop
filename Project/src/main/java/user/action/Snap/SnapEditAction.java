package user.action.Snap;

import user.action.Action;
import user.dao.snap.SnapDao;
import user.vo.BoardVO;
import user.vo.snap.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class SnapEditAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {
    String idParam = request.getParameter("id");
    if(idParam == null || idParam.isEmpty()){
      request.setAttribute("error", "수정할 게시글이 지정되지 않았습니다.");
      return "/user/snap/jsp/snap/error.jsp";
    }
    int boardId = Integer.parseInt(idParam);
    SnapDao dao = new SnapDao();
    BoardVO board = dao.selectBoardById(boardId);
    if(board == null){
      request.setAttribute("error", "게시글을 찾을 수 없습니다.");
      return "/user/snap/jsp/snap/error.jsp";
    }
    List<ProductVO> productList = dao.selectProductsByBoardId(boardId);
    request.setAttribute("board", board);
    request.setAttribute("productList", productList);

    // snapEdit.jsp는 모달 내부 컨텐츠를 포함하는 JSP 파일입니다.
    return "/user/snap/jsp/snap/snapEdit.jsp";
  }
}
