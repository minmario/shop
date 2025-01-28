package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.OrderVO;

import java.util.HashMap;
import java.util.List;

public class OrderDAO {

    //전체 주문내역 조회
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

    //날짜 별 주문내역 조회
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

    //주문상세내역 조회
    public static List<OrderVO> selectOrderCode(String cus_no, String order_code){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("order_code", order_code);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<OrderVO> list = null;

        try{
            list = ss.selectList("order.select_order_code", map);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //주문날짜, 결제방법, 주문상태 조회
    public static OrderVO selectOrder(String cus_no, String order_code){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("order_code", order_code);

        SqlSession ss = FactoryService.getFactory().openSession();
        OrderVO vo = null;

        try{
            vo = ss.selectOne("order.select_order", map);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
    }

    //총 상품 금액(원가)
    public static int selectTotalPrice(String cus_no, String order_code){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("order_code", order_code);

        SqlSession ss = FactoryService.getFactory().openSession();
        int totalPrice = 0;

        try{
            totalPrice = ss.selectOne("order.select_total_price", map);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalPrice;
    }

    //총 결제 금액(할인가)
    public static int selectTotalSaledPrice(String cus_no, String order_code){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("order_code", order_code);

        SqlSession ss = FactoryService.getFactory().openSession();
        int totalPrice = 0;

        try{
            totalPrice = ss.selectOne("order.select_total_saled_price", map);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalPrice;
    }
}
