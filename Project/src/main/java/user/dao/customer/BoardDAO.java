package user.dao.customer;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.customer.BoardVO;

import java.util.HashMap;
import java.util.List;

public class BoardDAO {
    // 1:1문의 전체 조회
    public static List<BoardVO> selectAll(String cus_no) {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> list = null;

        try{
            list = ss.selectList("inquiry.select_all", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return list;
    }

    // 1:1문의 검색 조건 조회
    public static List<BoardVO> selectSearch(String cus_no, String status, String startDate, String endDate) {
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("status", status);
        map.put("startDate", startDate);
        map.put("endDate", endDate);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> list = null;

        try{
            list = ss.selectList("inquiry.select_search", map);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return list;
    }

    // 1:1문의 등록
    public static int insertInquiry(BoardVO vo) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.insert("inquiry.insert_inquiry", vo);

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

    // 구매확정 리뷰 작성
    public static int insertReview(BoardVO vo) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.insert("review.insert_review", vo);

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
