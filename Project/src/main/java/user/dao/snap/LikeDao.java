package user.dao.snap;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.LikesVO;


import java.util.HashMap;
import java.util.Map;

public class LikeDao {

  public boolean toggleLike(LikesVO vo) {
    try (SqlSession session = FactoryService.getFactory().openSession()) {
      // 좋아요 여부 확인
      Integer existingLike = session.selectOne("likes.checkLikeExists", vo);

      if (existingLike == null) {
        // 좋아요 데이터 삽입
        vo.setStatus(0); // 초기 상태를 0으로 설정
        session.insert("likes.insertLike", vo);

        // like_count 증가
        session.update("board.incrementLikeCount", vo.getBoardNo());
      } else {
        // 좋아요 데이터 상태 변경
        Integer currentStatus = session.selectOne("likes.getCurrentStatus", vo);

        if (currentStatus == 1) {
          // 좋아요 활성화 (status = 0)
          vo.setStatus(0);
          session.update("likes.updateLike", vo);
          session.update("board.incrementLikeCount", vo.getBoardNo());
        } else if (currentStatus == 0) {
          // 좋아요 비활성화 (status = 1)
          vo.setStatus(1);
          session.update("likes.updateLike", vo);
          session.update("board.decrementLikeCount", vo.getBoardNo());
        }
      }

      session.commit();
      return true;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

}
