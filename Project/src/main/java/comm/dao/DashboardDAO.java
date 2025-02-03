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
        System.out.println("size="+list.size());
        if(list!=null) {
            ar = new Map[list.size()];
            list.toArray(ar);
        }

        ss.close();
        return ar;

    }
    public static int getQuestionCount(String seller_no){
        SqlSession ss = FactoryService.getFactory().openSession();

        int cnt = ss.selectOne("question.count",seller_no);
        ss.close();
        return cnt;
    }
}
