package admin.action;

import admin.dao.BoardProdDao;
import admin.dao.MajorCategoryDao;
import admin.vo.MajorCategoryVO;
import user.action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

public class AdminAddMajorCategoryAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 폼에서 전달된 파라미터를 받아오기


        String name = request.getParameter("name");
        String ename=request.getParameter("ename");
        MajorCategoryDao mcdao= new MajorCategoryDao();

        MajorCategoryVO mcvo=new MajorCategoryVO();
        mcvo.setName(name);
        mcvo.setEname(ename);
        mcdao.addMajorCategory(mcvo);

        return "Controller?type=categorymain";

    }

}