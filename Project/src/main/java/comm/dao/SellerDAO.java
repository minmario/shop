package comm.dao;

import comm.vo.SellerVO;
import org.apache.ibatis.session.SqlSession;
import comm.service.FactoryService;

import java.util.HashMap;
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
    public static int checkId(String seller_id){
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt= ss.selectOne("seller.check_id",seller_id);
        ss.close();
        return cnt;
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
    public static int addSeller(String seller_id,String seller_pw, String email,String phone,String name,
                                String address,String courier,String desc){
        SqlSession ss = FactoryService.getFactory().openSession();
        HashMap<String,String> map = new HashMap<>();
        map.put("seller_id",seller_id);
        map.put("seller_pw",seller_pw);
        map.put("email",email);
        map.put("phone",phone);
        map.put("name",name);
        map.put("address",address);
        map.put("courier",courier);
        map.put("desc",desc);
        int cnt=ss.insert("seller.add_seller",map);
        if(cnt>0){
            ss.commit();
        }else
            ss.rollback();
        ss.close();
        return cnt;
    }

}