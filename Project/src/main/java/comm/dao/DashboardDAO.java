package comm.dao;

import comm.service.FactoryService;
import comm.vo.StatusVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class DashboardDAO {
    public static Map[] getDashboard(String seller_no){
        SqlSession ss= FactoryService.getFactory().openSession();
        List<Map<String,Object>> list = ss.selectList("order.count",seller_no);
        Map<String,Object>[] ar = null;
        if(list!=null) {
            ar = new Map[list.size()];
            list.toArray(ar);
        }

        ss.close();
        return ar;

    }
    public static int[] getQuestConfirm(String seller_no){
        SqlSession ss = FactoryService.getFactory().openSession();
        int[] ar = new int[2];

        ar[0] = ss.selectOne("question.count",seller_no);
        ar[1] = ss.selectOne("order.get_confirm_month",seller_no);
        ss.close();
        return ar;
    }
}
