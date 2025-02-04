package user.action.Snap;

import user.action.Action;
import user.dao.snap.SnapDao;
import user.vo.BoardVO;
import user.vo.snap.BoardProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import com.google.gson.Gson;

public class UpdateSnapAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {
    try {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("application/json; charset=UTF-8");

      int boardNo = Integer.parseInt(request.getParameter("board_no"));
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      String gender = request.getParameter("gender");
      String season = request.getParameter("season");
      String style = request.getParameter("style");
      String tags = request.getParameter("tags");

      String mainImage = request.getParameter("mainImage"); // 메인 이미지
      String additionalImages = request.getParameter("additionalImages"); // 서브 이미지

      // 선택한 제품 목록 받아오기 (null 체크 추가)
      String selectedProducts = request.getParameter("selectedProducts");

      //  selectedProducts가 null이거나 빈 문자열이면 기본값 설정
      if (selectedProducts == null || selectedProducts.trim().isEmpty()) {
        selectedProducts = "0"; // 기본값 (유효하지 않은 제품 ID)
      }

      List<String> productList = Arrays.asList(selectedProducts.split(","));

      // Snap 객체 생성 및 업데이트 수행
      BoardVO snap = new BoardVO();
      snap.setId(boardNo);
      snap.setTitle(title);
      snap.setContent(content);
      snap.setGender(gender);
      snap.setSeason(season);
      snap.setStyle(style);
      snap.setTags(tags);
      snap.setSnapshot_image(mainImage);
      snap.setAdditional_images(additionalImages);

      SnapDao snapDao = new SnapDao();
      boolean updateSuccess = snapDao.updateBoard(snap);

      //  기존 제품 목록 삭제 후 새로 추가
      snapDao.deleteBoardProducts(boardNo);
      for (String prodId : productList) {
        if (prodId.trim().isEmpty() || prodId.equals("0")) {
          continue; // 빈 값 또는 기본값(0)이면 건너뜀
        }
        try {
          int productId = Integer.parseInt(prodId.trim());
          BoardProductVO boardProduct = new BoardProductVO();
          boardProduct.setBoard_no(boardNo);
          boardProduct.setProd_no(productId);
          snapDao.insertBoardProduct(boardProduct);
        } catch (NumberFormatException e) {
          System.err.println(" 잘못된 제품 ID: " + prodId);
        }
      }

      //  JSON 응답 반환
      PrintWriter out = response.getWriter();
      Gson gson = new Gson();
      String jsonResponse = gson.toJson(updateSuccess ?
          new ResponseMessage("success", "게시글이 수정되었습니다.") :
          new ResponseMessage("error", "수정 실패")
      );
      out.print(jsonResponse);
      out.flush();
      out.close();

    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  //  JSON 응답을 위한 내부 클래스
  private class ResponseMessage {
    String status;
    String message;

    public ResponseMessage(String status, String message) {
      this.status = status;
      this.message = message;
    }
  }
}
