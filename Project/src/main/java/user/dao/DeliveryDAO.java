package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.DeliveryVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DeliveryDAO {
    //배송지 정보 가져오기
    public static List<DeliveryVO> selectDelivery(String cus_no){
        SqlSession ss = FactoryService.getFactory().openSession();

        List<DeliveryVO> list = null;
        try {
            list = ss.selectList("delivery.select_delivery", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return list;
    }

    //배송지 정보 입력하기
    public static int insertDelivery(String cus_no, String name, String phone, String pos_code, String addr1, String addr2, String chkDefault, String deli_request){
        SqlSession ss = FactoryService.getFactory().openSession();

        DeliveryVO vo = new DeliveryVO();
        vo.setCus_no(cus_no);
        vo.setName(name);
        vo.setPhone(phone);
        vo.setPos_code(pos_code);
        vo.setAddr1(addr1);
        vo.setAddr2(addr2);
        vo.setIs_default(chkDefault);
        vo.setRequest(deli_request);

        int cnt = 0;
        try {
            cnt = ss.insert("delivery.insert_delivery", vo);

            if (cnt > 0)
                ss.commit();
            else
                ss.rollback();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }
        return cnt;
    }

    //배송지 수정하기
    public static int updateDelivery(String id, String name, String phone, String pos_code, String addr1, String addr2, String chkDefault, String deli_request){
        SqlSession ss = FactoryService.getFactory().openSession();

        DeliveryVO vo = new DeliveryVO();
        vo.setId(id);
        vo.setName(name);
        vo.setPhone(phone);
        vo.setPos_code(pos_code);
        vo.setAddr1(addr1);
        vo.setAddr2(addr2);
        vo.setIs_default(chkDefault);
        vo.setRequest(deli_request);

        int cnt = 0;
        try {
            cnt = ss.update("delivery.update_delivery", vo);

            if (cnt > 0)
                ss.commit();
            else
                ss.rollback();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return cnt;
    }

    //배송지 삭제하기
    public static int deleteDelivery(String id){
        SqlSession ss = FactoryService.getFactory().openSession();

        int cnt = 0;
        try {
            cnt = ss.update("delivery.delete_delivery", id);

            if (cnt > 0)
                ss.commit();
            else
                ss.rollback();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return cnt;
    }
}
