package comm.dao;

import comm.action.Action;
import comm.service.FactoryService;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;

public class InventoryDAO{

    public static int updateStock(String prodNo, String stock) {
        SqlSession ss = FactoryService.getFactory().openSession();
        HashMap<String,String> map = new HashMap<>();
        map.put("prod_no",prodNo);
        map.put("stock",stock);
        int cnt = ss.update("inventory.updateStock",map);
        if(cnt>0){
            ss.commit();
        }else{
            ss.rollback();
        }
        ss.close();
        return cnt;
    }
}
