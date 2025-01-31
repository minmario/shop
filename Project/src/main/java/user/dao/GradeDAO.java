package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.GradeVO;

import java.util.List;

public class GradeDAO {
    // 등급 정보 전체 조회
    public static List<GradeVO> selectGradeAll() {
        List<GradeVO> list = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            list = ss.selectList("grade.select_grade_all");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return list;
    }

    // 등급 번호 조회
    public static GradeVO selectGradeById(String id) {
        GradeVO vo = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            vo = ss.selectOne("grade.select_grade_by_id", id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return vo;
    }
}
