package user.action;

import user.dao.CategoryDAO;
import user.dao.ProductDAO;
import user.vo.MajorCategoryVO;
import user.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

public class IndexAction implements Action {
      @Override
      public String execute(HttpServletRequest request, HttpServletResponse response) {
          String action = request.getParameter("action");

          String viewPath = null;
          if (action != null) {
              switch (action) {
                  case "select":
                      String category = request.getParameter("category");
                      String sort = request.getParameter("sort");

                      List<ProductVO> products = ProductDAO.selectProduct(category, sort);
                      request.setAttribute("products", products);

                      viewPath = "/user/jsp/product/productList.jsp";
                      break;
              }
          } else {
              // 초기 로드 시 카테고리
              List<MajorCategoryVO> categories = CategoryDAO.getCategory();

              if (categories != null && categories.size() > 0) {
                  request.setAttribute("categories", categories);
              }

              viewPath = "/user/jsp/index.jsp";
          }

          return viewPath;
      }
}
