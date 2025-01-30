package user.action;

import user.dao.ProdLikeDAO;
import user.vo.CustomerVO;
import user.vo.ProdLikeVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class LikeAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        String viewPath = null;
        if (action != null) {
            HttpSession session = request.getSession();
            CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

            if (cvo == null) {
                return "/user/jsp/error/error.jsp";
            }

            switch (action) {
                case "select":
                    ProdLikeVO vo = new ProdLikeVO();
                    vo.setCus_no(cvo.getId());

                    List<ProdLikeVO> like_list = ProdLikeDAO.selectProdLikeList(vo);
                    request.setAttribute("like_list", like_list);

                    viewPath = "/user/jsp/like/like.jsp";
                    break;
                case "unlike":
                    String prod_no = request.getParameter("prod_no");

                    ProdLikeVO d_vo = new ProdLikeVO();
                    d_vo.setCus_no(cvo.getId());
                    d_vo.setProd_no(prod_no);

                    ProdLikeDAO.deleteProdLike(d_vo);

                    viewPath = "/user/jsp/like/like.jsp";
                    break;
            }
        }

        return viewPath;
    }
}
