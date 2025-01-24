package admin.action;

import admin.dao.MajorCategoryDao;
import admin.vo.MajorCategoryVO;
import user.action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminSearchMajorCategoryAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");

        MajorCategoryVO[] ar = MajorCategoryDao.searchMajorCategory(searchType, searchValue);
        request.setAttribute("ar", ar);
        return "/admin/jsp/ajaxMajorCategoryList.jsp";
    }
}
