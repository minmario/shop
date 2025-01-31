package comm.dao;

import comm.service.FactoryService;
import comm.vo.OrderVO;
import comm.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
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
    public static OrderVO getOrderOne(String order_no){
        SqlSession ss = FactoryService.getFactory().openSession();
        OrderVO vo = ss.selectOne("order.get_order_one",order_no);
        ss.close();
        return vo;
    }
    public static int changeStatus(String[] selectedOrders,String[] status){
        SqlSession ss= FactoryService.getFactory().openSession();
        int cnt = -1;
        boolean chk = true;
        HashMap<String,String> map = new HashMap<>();
        String str = new String();
        for(String s : status){
            System.out.println("status: "+s);
        }
        if(selectedOrders!=null && selectedOrders.length>0){
            for(int i=0;i<selectedOrders.length;i++){
                map.put("tid",selectedOrders[i].trim());
                if(status[i]!=null && !status[i].trim().isEmpty())
                    str= status[i].trim();
                map.put("status",str);
                if(ss.update("order.change_status",map)<0)
                    chk=false;
            }
        }
        if(chk) {
            cnt = 1;
            ss.commit();
        }else{
            ss.rollback();
        }

        ss.close();
        return cnt;
    }
}
