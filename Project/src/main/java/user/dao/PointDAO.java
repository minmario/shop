package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.PointVO;

import java.util.List;

public class PointDAO {
    // 적립금 내역 가져오기
    public static List<PointVO> getPoint(String cusno) {
        List<PointVO> points = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            points = ss.selectList("customer.select_point", cusno);
        } finally {
            ss.close(); // 세션은 반드시 닫아야 합니다.
        }

        return points;
    }
}
