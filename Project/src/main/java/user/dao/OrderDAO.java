package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.OrderVO;

import java.util.HashMap;
import java.util.List;

public class OrderDAO {

    public static List<OrderVO> selectAll(String cus_no){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<OrderVO> list = null;

        try{
            list = ss.selectList("order.select_all", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<OrderVO> selectDate(String cus_no, String startDate, String endDate){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("startDate", startDate);
        map.put("endDate", endDate);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<OrderVO> list = null;

        try{
            list = ss.selectList("order.select_date", map);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
