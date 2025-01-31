package user.dao.snap;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.BoardVO;
import user.vo.ProductVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SnapDao {

  public static int insertBoard(BoardVO vo){
    SqlSession session = FactoryService.getFactory().openSession();
    int result = 0;
    try {
      result = session.insert("board.insertBoard", vo); // MyBatis 쿼리 호출
      if (result > 0) session.commit(); // 삽입 성공 시 커밋
    } catch (Exception e) {
      e.printStackTrace();
      session.rollback(); // 오류 발생 시 롤백
    } finally {
      session.close(); // 세션 종료
    }
    return result; // 삽입 결과 반환
  }

  public int insertBoardProd(int boardNo, List<Integer> prodNos) {
    SqlSession session = FactoryService.getFactory().openSession();
    Map<String, Object> params = new HashMap<>();
    params.put("boardNo", boardNo);
    params.put("prodNos", prodNos);
    int result = 0;
    try {
      result = session.insert("board.insertBoardProd", params); // board_prod 테이블 삽입
      session.commit(); // 삽입 성공 시 커밋
      System.out.println("boardNo: " + boardNo + ", prodNos: " + prodNos); // 로그 출력
    } catch (Exception e) {
      e.printStackTrace();
      session.rollback(); // 오류 발생 시 롤백
    } finally {
      session.close();
    }
    return result;
  }


//추가한거
public List<BoardVO> getSnapList(int offset, int limit) {
  List<BoardVO> list = new ArrayList<>();
  try (SqlSession session = FactoryService.getFactory().openSession();) {
    // Map.of() 대신 HashMap 사용
    Map<String, Integer> params = new HashMap<>();
    params.put("offset", offset);
    params.put("limit", limit);

    list = session.selectList("board.getSnapList", params);
  } catch (Exception e) {
    e.printStackTrace();
  }
  return list;
}



  public int getTotalSnapCount() {
    int count = 0;
    try ( SqlSession session = FactoryService.getFactory().openSession();) {
      count = session.selectOne("board.getTotalSnapCount");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return count;
  }

  public List<BoardVO> getFilteredSnapList(Map<String, Object> filters) {
    try (SqlSession session = FactoryService.getFactory().openSession()) {
      return session.selectList("board.getFilteredSnapList", filters);
    }
  }


  public int getFilteredSnapCount(Map<String, Object> filters) {
    try (SqlSession session = FactoryService.getFactory().openSession()) {
      return session.selectOne("board.getTotalFilteredSnapCount", filters);
    }
  }

  public boolean checkLikeStatus(int boardId, int cusId) {
    try (SqlSession session = FactoryService.getFactory().openSession()) {
      Map<String, Integer> params = new HashMap<>();
      params.put("boardNo", boardId);
      params.put("cusNo", cusId);
      Integer result = session.selectOne("likes.checkLikeExists", params);
      return result != null && result > 0;
    }
  }
  //이미지클릭하면 상세페이지 가져오기
  public BoardVO getBoardSns(int boardId) {
    SqlSession session = FactoryService.getFactory().openSession();
    BoardVO vo = session.selectOne("board.getSnapWithCustomerData", boardId);
    session.close();

    return vo;
  }


//구매한 상품가져오기

  public List<ProductVO> getPurchasedProducts(int cusNo) {
    List<ProductVO> productList = new ArrayList<>();
    try (SqlSession session = FactoryService.getFactory().openSession()) {
      productList = session.selectList("board.getPurchasedProducts", cusNo);
      // session.close(); 제거
    } catch (Exception e) {
      e.printStackTrace();
    }
    return productList;
  }

  public List<ProductVO> getProductsByKeyword(String keyword) {
    List<ProductVO> productList = new ArrayList<>();
    try (SqlSession session = FactoryService.getFactory().openSession()) {
      productList = session.selectList("board.getProductsByKeyword", keyword);
      // session.close(); 제거
    } catch (Exception e) {
      e.printStackTrace();
    }
    return productList;
  }


 public  List<BoardVO> profile(int cus_no){
    SqlSession session = FactoryService.getFactory().openSession();
    List<BoardVO> boardList = session.selectList("board.getProfile",cus_no);
    session.close();
    return boardList;
 }

  public List<ProductVO> getProductsByBoardNo(int boardNo) {
    List<ProductVO> productList = new ArrayList<>();
    try (SqlSession session = FactoryService.getFactory().openSession()) {
      productList = session.selectList("board.getProductsByBoardNo", boardNo);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return productList;
  }


  public BoardVO getSnapDetail(int boardNo) {
    BoardVO snap = null;
    try (SqlSession session = FactoryService.getFactory().openSession()) {
      snap = session.selectOne("board.getSnapDetail", boardNo);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return snap;
  }

  public boolean updateBoard(BoardVO board) {
    try (SqlSession session = FactoryService.getFactory().openSession()) {
      int rows = session.update("board.updateSnap", board);
      if (rows > 0) {
        session.commit();
        return true;
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return false;
  }


}


