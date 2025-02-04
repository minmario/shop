package user.dao.customer;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.customer.CustomerVO;

import java.util.HashMap;

public class CustomerDAO {
    // 로그인
    public static CustomerVO login(CustomerVO vo) {
        CustomerVO vs = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            vs = ss.selectOne("customer.login", vo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return vs;
    }

    // 회원 가입
    public static int insertCustomer(CustomerVO vo) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.insert("customer.insert_customer", vo);

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

    // 회원 정보 보기(id)
    public static CustomerVO selectCustomerById(String id) {
        CustomerVO vo = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            vo = ss.selectOne("customer.select_customer", id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return vo;
    }

    // 회원 정보 보기(cus_id)
    public static CustomerVO selectCustomerByCusId(String cus_id) {
        CustomerVO vo = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            vo = ss.selectOne("customer.select_customer_by_cus_id", cus_id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return vo;
    }

    // 회원 정보 수정
    public static int updateCustomer(CustomerVO vo) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.update("customer.update_customer", vo);

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

    // 누적 금액 수정(취소/반품)
    public static int updateTotal(String id, String total) {
        HashMap<String, String> map = new HashMap<>();
        map.put("id", id);
        map.put("total", total);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = 0;

        try {
            cnt = ss.update("customer.update_total", map);

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

    // 누적 금액 추가
    public static int updateAddTotal(String id, String total) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            HashMap<String, String> map = new HashMap<>();
            map.put("id", id);
            map.put("total", total);

            cnt = ss.update("customer.update_add_total", map);

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
