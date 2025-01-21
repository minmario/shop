package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.CustomerVO;

public class CustomerDAO {
    // 로그인
    public static CustomerVO login(CustomerVO vo) {
        SqlSession ss = FactoryService.getFactory().openSession();
        CustomerVO vs = ss.selectOne("customer.loginSelect", vo);
        if (vs != null) {
            ss.commit();

        }
        ss.close();
        return vs;
    }

    // 회원가입
    public static int cusadd(CustomerVO vo) {
        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = ss.insert("customer.signupInsert", vo);

        if (cnt > 0) {
            ss.commit();
        }
        ss.close();
        return cnt;
    }

    public  static int getId(String nickname){
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            return ss.selectOne("customer.getId", nickname);
        } finally {
            ss.close(); // 세션은 반드시 닫아야 합니다.
        }
    }
}
