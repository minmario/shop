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
    public static int cusInsert(CustomerVO vo) {
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

    // 회원 정보 보기
    public static CustomerVO selectById(String id) {
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

    // 회원 정보 수정
    public static int cusUpdate(CustomerVO vo) {
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
