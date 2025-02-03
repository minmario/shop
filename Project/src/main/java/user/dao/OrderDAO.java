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

    //취소, 반품, 교환할 상품 조회
    public static OrderVO selectOrderProduct(String id, String cus_no, String order_code){
        HashMap<String, String> map = new HashMap<>();
        map.put("id", id);
        map.put("cus_no", cus_no);
        map.put("order_code", order_code);

        SqlSession ss = FactoryService.getFactory().openSession();
        OrderVO vo = null;

        try{
            vo = ss.selectOne("order.select_order_product", map);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return vo;
    }

    //주문 총 금액
    public static int selectTotalAmount(String cus_no, String order_code){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("order_code", order_code);

        SqlSession ss = FactoryService.getFactory().openSession();
        int totalAmount = 0;

        try{
            totalAmount = ss.selectOne("order.select_total_amount", map);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return totalAmount;
    }

    //상품 총 원가 금액
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
    public static int updateOrderCancel(String cus_no, String prod_no, String order_code, String refund_bank, String refund_account, String reason){
        HashMap<String, Object> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("prod_no", prod_no);
        map.put("order_code", order_code);
        map.put("refund_bank", refund_bank);
        map.put("refund_account", refund_account);
        map.put("reason", reason);

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
    public static int updateOrderRefund(String cus_no, String prod_no, String order_code, String refund_bank, String refund_account, String reason, String retrieve_deli_no){
        HashMap<String, Object> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("prod_no", prod_no);
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
    public static int updateOrderExchange(String cus_no, String prod_no, String order_code, String reason, String exchange_option, String retrieve_deli_no){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("prod_no", prod_no);
        map.put("order_code", order_code);
        map.put("reason", reason);
        map.put("exchange_option", exchange_option);
        map.put("retrieve_deli_no", retrieve_deli_no);

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

    // 취소/반품/교환 상품 전체 조회
    public static List<OrderVO> selectRefundAll(String cus_no){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<OrderVO> list = null;

        try{
            list = ss.selectList("order.select_refund_all", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return list;
    }

    // 취소/반품 상품 전체 조회
    public static List<OrderVO> selectCancelRefund(String cus_no){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<OrderVO> list = null;

        try{
            list = ss.selectList("order.select_refund_cancelRefund", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return list;
    }

    // 교환 전체 상품 조회
    public static List<OrderVO> selectRefundExchange(String cus_no){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<OrderVO> list = null;

        try{
            list = ss.selectList("order.select_refund_exchange", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return list;
    }

    // 교환 전체 상품 조회
    public static OrderVO selectOrderCoupon(String cus_no, String order_code){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("order_code", order_code);

        SqlSession ss = FactoryService.getFactory().openSession();
        OrderVO vo = null;

        try{
            vo = ss.selectOne("order.select_order_coupon", map);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return vo;
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
