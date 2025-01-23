package user.action;

import user.dao.CategoryDAO;
import user.vo.MajorCategoryVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class IndexAction implements Action {
      @Override
      public String execute(HttpServletRequest request, HttpServletResponse response) {
          HttpSession session = request.getSession();

          // 카테고리
          List<MajorCategoryVO> categories = CategoryDAO.getCategory();

          if (categories != null && categories.size() > 0) {
              session.setAttribute("categories", categories);
          }

          return "/user/jsp/index.jsp";
      }
}
