package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.CustomerVO;

public class CustomerDao {
   //로그인
  public static CustomerVO login(CustomerVO vo) {
    SqlSession ss = FactoryService.getFactory().openSession();
    CustomerVO vs = ss.selectOne("customer.loginSelect", vo);
    if(vs != null) {
      ss.commit();

    }
    ss.close();
    return vs;
  }

  //회원가입
  public static int cusadd(CustomerVO vo){
    SqlSession ss = FactoryService.getFactory().openSession();
    int cnt = ss.insert("customer.signupInsert",vo);

    if(cnt>0){
      ss.commit();
      ss.close();
    }
    return cnt;


  }
}
