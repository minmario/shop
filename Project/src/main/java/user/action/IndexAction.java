package user.action;

import user.dao.CategoryDAO;
import user.dao.ProductDAO;
import user.util.Paging;
import user.vo.MajorCategoryVO;
import user.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
                      String search = request.getParameter("search");

                      System.out.println("category:" + category);
                      System.out.println("sort:" + sort);
                      System.out.println("search:" + search);

                      // 페이징
                      Paging paging = new Paging(14, 3);

                      // 상품 수 가져오기
                      int totalCount = ProductDAO.selectTotalCountProduct(category, search);
                      System.out.println("totalCount : " + totalCount);
                      paging.setTotalRecord(totalCount);

                      // 현재 페이지 값을 파라미터로 받는다.
                      String current_page = request.getParameter("page");
                      System.out.println("paging current_page : " + current_page);

                      if (current_page == null) {
                          paging.setNowPage(1);
                      } else {
                          int currentPage = Integer.parseInt(current_page);
                          paging.setNowPage(currentPage);
                      }

                      // 상품 목록
                      ProductVO[] products = ProductDAO.selectProduct(category, sort, search, paging.getBegin(), paging.getEnd());
                      System.out.println("products : " + products.length);

                      request.setAttribute("products", products);
                      request.setAttribute("paging", paging);

                      viewPath = "/user/jsp/product/components/productList.jsp";
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
