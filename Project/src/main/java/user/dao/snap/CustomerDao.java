package user.dao.snap;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.CustomerVO;

import java.util.List;

public class CustomerDao {


  // 현재 로그인한 사용자 정보 가져오기
  public CustomerVO getUserProfile(int cusId) {
    try ( SqlSession ss = FactoryService.getFactory().openSession();) {
      return ss.selectOne("customer.getUserProfile", cusId);
    }
  }

  // 랜덤 추천 사용자 5명 가져오기
  public List<CustomerVO> getRandomUsers(int excludeCusId) {
    try ( SqlSession ss = FactoryService.getFactory().openSession();) {
      return ss.selectList("customer.getRandomUsers", excludeCusId);
    }
  }



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

  public  static int getId(String nickname){
    SqlSession ss = FactoryService.getFactory().openSession();

    try {
      return ss.selectOne("customer.getId", nickname);
    } finally {
      ss.close(); // 세션은 반드시 닫아야 합니다.
    }

  }
}
