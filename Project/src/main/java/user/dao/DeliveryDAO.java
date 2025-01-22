package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.DeliveryVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DeliveryDAO {

    //배송지 정보 가져오기
    public static List<DeliveryVO> searchDeliInfo(String cus_no){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<DeliveryVO> list = new ArrayList<DeliveryVO>();
        try {
            list = ss.selectList("delivery.deliInfoSelect", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return list;
    }

    //배송지 정보 입력하기
    public static int insertDeliInfo(String name, String phone, String pos_code, String addr1, String addr2,
                                     String chkDefault, String deli_request){

        DeliveryVO vo = new DeliveryVO();
        vo.setName(name);
        vo.setPhone(phone);
        vo.setPos_code(pos_code);
        vo.setAddr1(addr1);
        vo.setAddr2(addr2);
        vo.setIs_default(chkDefault);
        vo.setRequest(deli_request);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = 0;
        try {
            cnt = ss.insert("delivery.deliInfoInsert", vo);
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
    public static int updateDeliInfo(String id, String cus_no, String name, String phone, String pos_code, String addr1, String addr2,
                                     String chkDefault, String deli_request){
        DeliveryVO vo = new DeliveryVO();
        vo.setId(id);
        vo.setCus_no(cus_no);
        vo.setName(name);
        vo.setPhone(phone);
        vo.setPos_code(pos_code);
        vo.setAddr1(addr1);
        vo.setAddr2(addr2);
        vo.setIs_default(chkDefault);
        vo.setRequest(deli_request);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.update("delivery.deliInfoUpdate", vo);

        if (cnt > 0)
            ss.commit();
        else
            ss.rollback();
        ss.close();

        return cnt;
    }
}
