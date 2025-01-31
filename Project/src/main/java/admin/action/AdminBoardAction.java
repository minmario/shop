package admin.action;

import admin.dao.BoardDao;
import admin.dao.BoardProdDao;

import admin.vo.BoardProdVO;
import admin.vo.BoardVO;

import user.action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class AdminBoardAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {





        BoardDao bdao = new BoardDao();

        List<BoardVO> list1 = bdao.allBoard();
        request.setAttribute("boardList", list1);
        List<String> list1_1 = bdao.allBoardCategory();
        request.setAttribute("boardName", list1_1);


        BoardProdDao bpdao = new BoardProdDao();
        List<BoardProdVO> list2 = bpdao.allBoardProd();
        request.setAttribute("boardprodList", list2);
        List<String> list2_1 = bpdao.allBoardProdCol();
        request.setAttribute("boardprodName", list2_1);






      return "/admin/jsp/boardmain.jsp";
    }
}
