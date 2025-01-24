package admin.action;

import admin.dao.BoardProdDao;
import admin.vo.BoardProdVO;
import user.action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminSearchBoardProdAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");

        BoardProdVO[] ar = BoardProdDao.searchBoardProd(searchType, searchValue);
        request.setAttribute("bpar", ar);
        return "/admin/jsp/ajaxBoardProdList.jsp";
    }

}
