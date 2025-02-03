package seller.action;

import comm.action.Action;
import comm.dao.OrderDAO;
import comm.vo.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DashBoardAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        return "/seller/jsp/dash_board.jsp";
    }
}
