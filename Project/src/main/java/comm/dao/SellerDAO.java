package comm.dao;

import comm.vo.SellerVO;
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
    public static SellerVO getSellerInfo() {
        SqlSession session = FactoryService.getFactory().openSession();
        SellerVO vo = session.selectOne("seller.getSellerInfo");  // ✅ MyBatis 매핑 확인
        session.close();
        return vo;
    }
    public static int updateSeller(SellerVO sellerVO) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.update("seller.updateSellerInfo",sellerVO);
        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }
        ss.close();
        return cnt;
    }
}