package comm.dao;

import comm.service.FactoryService;
import comm.vo.OrderVO;
import comm.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.SimpleTimeZone;

public class OrderDAO {
    public static OrderVO[] getOrderList(String seller_no){
        SqlSession ss = FactoryService.getFactory().openSession();
        OrderVO[] ar = null;
        List<OrderVO> list = ss.selectList("order.new_order_list",seller_no);
        if(list!=null){
            ar = new OrderVO[list.size()];
            System.out.println("배열 길이 : "+ar.length);
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }
}
