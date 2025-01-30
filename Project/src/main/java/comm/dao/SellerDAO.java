package comm.dao;

import comm.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;
import comm.service.FactoryService;

import java.util.List;

public class SellerDAO {

    public static int updateStock(String id, String stock){
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.update("seller.updateStock", stock);
        if (cnt > 0){
            ss.commit();
        } else {
            ss.rollback();
        }
        ss.close();
        return cnt;
    }
    public static int deleteProduct(String id){
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.delete("seller.deleteProduct", id);
        if (cnt > 0){
            ss.commit();
        } else {
            ss.rollback();
        }
        ss.close();
        return cnt;
    }

}
