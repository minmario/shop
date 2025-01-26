package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.CustomerVO;

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
}
