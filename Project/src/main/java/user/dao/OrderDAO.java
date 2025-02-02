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
        } finally {
            ss.close();
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
        } finally {
            ss.close();
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
        } finally {
            ss.close();
        }

        return list;
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
        } finally {
            ss.close();
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
        } finally {
            ss.close();
        }

        return totalPrice;
    }

    //배송지 변경
    public static int updateOrderDelivery(String cus_no, String order_code, String deli_no){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("order_code", order_code);
        map.put("deli_no", deli_no);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = 0;

        try {
            cnt = ss.update("order.update_order_delivery", map);

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

    // 취소 요청
    public static int updateOrderCancel(String cus_no, String[] prod_nos, String order_code, String refund_bank, String refund_account, String reason, String retrieve_deli_no){
        HashMap<String, Object> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("prod_no_list", prod_nos);
        map.put("order_code", order_code);
        map.put("refund_bank", refund_bank);
        map.put("refund_account", refund_account);
        map.put("reason", reason);
        map.put("retrieve_deli_no", retrieve_deli_no);

        System.out.println(cus_no);
        System.out.println(prod_nos);
        System.out.println(order_code);
        System.out.println(refund_bank);
        System.out.println(reason);
        System.out.println(retrieve_deli_no);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = 0;

        try {
            cnt = ss.update("order.update_order_cancel", map);

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
    // 반품 요청
    public static int updateOrderRefund(String cus_no, String[] prod_nos, String order_code, String refund_bank, String refund_account, String reason, String retrieve_deli_no){
        HashMap<String, Object> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("prod_no_list", prod_nos);
        map.put("order_code", order_code);
        map.put("refund_bank", refund_bank);
        map.put("refund_account", refund_account);
        map.put("reason", reason);
        map.put("retrieve_deli_no", retrieve_deli_no);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = 0;

        try {
            cnt = ss.update("order.update_order_refund", map);

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
    // 교환 요청
    public static int updateOrderExchange(String cus_no, String prod_no, String order_code){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("prod_no", prod_no);
        map.put("order_code", order_code);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = 0;

        try {
            cnt = ss.update("order.update_order_exchange", map);

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

    // 주문 추가
    public static int insertOrder(String tid, String cus_no, String prod_no, String coupon_no, String deli_no, String order_code, String count, String amount, String inventory_no) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();
        
        try {
            HashMap<String, String> map = new HashMap<>();
            map.put("tid", tid);
            map.put("cus_no", cus_no);
            map.put("prod_no", prod_no);
            map.put("coupon_no", coupon_no);
            map.put("deli_no", deli_no);
            map.put("order_code", order_code);
            map.put("count", count);
            map.put("amount", amount);
            map.put("inventory_no", inventory_no);

            cnt = ss.insert("order.insert_order", map);

            if (cnt > 0) {
                ss.commit();
            } else {
                ss.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return cnt;
    }
}
