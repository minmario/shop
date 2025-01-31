package admin.action;

import admin.dao.BoardDao;
import admin.vo.LogVO;
import user.action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminDeleteBoardAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

           String content = request.getParameter("content");
           int id = Integer.parseInt(request.getParameter("id"));
           String cus_no = request.getParameter("cus_no");

           BoardDao boardDao = new BoardDao();

              //게시판삭제 id_del 0
             boolean chk = boardDao.deleteBoard(id);


          String target = "board 삭제";

         HttpSession session = request.getSession();
      String rootIdStr = (String) session.getAttribute("id"); // 먼저 String으로 가져옴
      int rootId = Integer.parseInt(rootIdStr); // int로 변환


      LogVO log = new LogVO();
        log.setCus_no(cus_no);
        log.setRoot_no(rootId);
        log.setTarget("게시글삭제");
        log.setLog_type("0");
        log.setPrev("고객:"+cus_no+"게시판번호:"+id);
        log.setCurrent(content);

          int data  = boardDao.logininsert(log);







        return "/Controller?type=boardmain";
    }
}
