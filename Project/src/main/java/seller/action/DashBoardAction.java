package seller.action;

import comm.action.Action;
import comm.dao.DashboardDAO;
import comm.dao.OrderDAO;
import comm.vo.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

public class DashBoardAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String seller_no = (String) session.getAttribute("seller_no");
        System.out.println("seller_no:"+seller_no);
        int newOrder = 0;
        int readyDeli =0;
        int changeProd =0;
        int returnProd=0;
        Map<String,Object>[] ar = DashboardDAO.getDashboard(seller_no);
        request.setAttribute("ar",ar);
        for(Map<String,Object> map : ar){
            switch ((Integer)map.get("status")){
                case 1: newOrder=((Number)map.get("count")).intValue();
                    break;
                case 2: readyDeli=((Number)map.get("count")).intValue();
                    break;
                case 8: changeProd=((Number)map.get("count")).intValue();
                    break;
                case 7: returnProd=((Number)map.get("count")).intValue();

            }
        }
        int quest = DashboardDAO.getQuestionCount(seller_no);
        request.setAttribute("quest",quest);
        request.setAttribute("newOrder",newOrder);
        request.setAttribute("readyDeli",readyDeli);
        request.setAttribute("changeProd",changeProd);
        request.setAttribute("returnProd",returnProd);
        return "/seller/jsp/dash_board.jsp";
    }
}
