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
            vs = ss.selectOne("customer.loginSelect", vo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return vs;
    }

    // 회원 가입
    public static int cusadd(CustomerVO vo) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.insert("customer.signupInsert", vo);

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
