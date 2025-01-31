package user.dao.snap;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.LikesVO;

import java.util.HashMap;
import java.util.Map;

public class LikeDao {

  public boolean toggleLike(LikesVO vo) {
    SqlSession session = FactoryService.getFactory().openSession();
    Integer existingLike = session.selectOne("likes.checkLikeExists", vo);

    if (existingLike == null) {
      vo.setStatus(0);
      session.insert("likes.insertLike", vo);
      session.update("board.incrementLikeCount", vo.getBoardNo());
    } else {
      Integer currentStatus = session.selectOne("likes.getCurrentStatus", vo);
      if (currentStatus == 1) {
        vo.setStatus(0);
        session.update("likes.updateLike", vo);
        session.update("board.incrementLikeCount", vo.getBoardNo());
      } else if (currentStatus == 0) {
        vo.setStatus(1);
        session.update("likes.updateLike", vo);
        session.update("board.decrementLikeCount", vo.getBoardNo());
      }
    }

    session.commit();
    session.close();
    return true;
  }
}
