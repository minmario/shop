package user.action.customer;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONObject;
import service.S3Uploader;
import user.action.Action;
import user.dao.customer.BoardDAO;
import user.dao.customer.CustomerDAO;
import user.dao.customer.OrderDAO;
import user.vo.customer.BoardVO;
import user.vo.customer.CustomerVO;
import user.vo.customer.OrderVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.Normalizer;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

public class WriteReviewAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String action = request.getParameter("action");
        String prod_no = request.getParameter("prod_no");
        String order_code = request.getParameter("order_code");
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        }
      System.out.println("action = " + action);
        String viewPath = null;
        if(action != null){
            switch(action){
                case "select":
                    OrderVO o_vo = OrderDAO.selectReviewProduct(cvo.getId(), prod_no, order_code);
                    request.setAttribute("o_vo", o_vo);
                    viewPath = "/user/customer/jsp/mypage/writeReview.jsp";
                    break;

              case "insert":
                try {
                  JSONObject responseJson = new JSONObject(); // JSON 응답을 위한 객체

                  // 파일 업로드 처리
                  DiskFileItemFactory factory = new DiskFileItemFactory();
                  ServletFileUpload upload = new ServletFileUpload(factory);
                  List<FileItem> items = upload.parseRequest(request);

                  prod_no = null;
                  order_code = null;
                  String rating = null;
                  String comment = null;
                  String gender = null;
                  String height = null;
                  String weight = null;
                  String photo = null;
                  String isUpdateChecked = null;

                  for (FileItem item : items) {
                    if (item.isFormField()) {
                      String fieldName = item.getFieldName();
                      String value = item.getString("UTF-8");

                      System.out.println("📌 필드: " + fieldName + " = " + value);

                      switch (fieldName) {
                        case "prod_no":
                          prod_no = value;
                          break;
                        case "order_code":
                          order_code = value;
                          break;
                        case "rating":
                          rating = value;
                          break;
                        case "comment":
                          comment = value;
                          break;
                        case "gender":
                          gender = value;
                          break;
                        case "height":
                          height = value;
                          break;
                        case "weight":
                          weight = value;
                          break;
                        case "isUpdateChecked":
                          isUpdateChecked = value;
                          break;
                      }
                    } else {
                      // 파일 업로드 처리

                      if (!item.getName().isEmpty()) {
                        String originalFileName = new File(item.getName()).getName();

                        String safeFileName = normalizeFileName(originalFileName);
                        String uniqueFileName = UUID.randomUUID().toString() + "_" + safeFileName;

                        File tempFile = new File(System.getProperty("java.io.tmpdir"), uniqueFileName);
                        item.write(tempFile);
                        // S3 업로드 처리
                        S3Uploader s3Uploader = new S3Uploader();
                        photo = s3Uploader.uploadFile(tempFile, "review_images/" + uniqueFileName);

                        // 임시 파일 삭제
                        tempFile.delete();
                      }
                    }
                  }
                  response.setContentType("application/json");
                  response.setCharacterEncoding("UTF-8");
                  // 필수 값 검증
                  if (rating == null || comment == null || rating.isEmpty() || comment.length() < 10) {

                    responseJson.put("success", false);
                    responseJson.put("message", "별점과 리뷰 내용을 올바르게 입력하세요.");
                    response.getWriter().write(responseJson.toString());
                    return null;
                  }

                  // DB 저장

                  BoardVO b_vo = new BoardVO();
                  b_vo.setProd_no(prod_no);
                  b_vo.setOrder_code(order_code);
                  b_vo.setCus_no(cvo.getId());
                  b_vo.setScore(String.valueOf(Integer.parseInt(rating)));
                  b_vo.setContent(comment);
                  b_vo.setGender(gender);
                  b_vo.setAdditional_images(photo);

                  if ("true".equals(isUpdateChecked)) {
                    CustomerDAO.updateBodyInfo(cvo.getId(), weight, height);
                  }

                  int result = BoardDAO.insertReview(b_vo);


                  if (result > 0) {
                    responseJson.put("success", true);
                    responseJson.put("message", "리뷰가 성공적으로 등록되었습니다.");
                  } else {
                    responseJson.put("success", false);
                    responseJson.put("message", "리뷰 저장 중 오류가 발생했습니다.");
                  }


                  response.getWriter().write(responseJson.toString());


                  return null;

                } catch (Exception e) {
                  e.printStackTrace();
                  JSONObject errorJson = new JSONObject();
                  errorJson.put("success", false);
                  errorJson.put("message", "서버 내부 오류 발생: " + e.getMessage());
                  response.setContentType("application/json");
                  response.getWriter().write(errorJson.toString());
                  return null;
                    }
        }
    }

        return viewPath;
}
  public static String normalizeFileName(String fileName) {
    String normalized = Normalizer.normalize(fileName, Normalizer.Form.NFD);
    Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
    return pattern.matcher(normalized).replaceAll("").replaceAll("[^a-zA-Z0-9._-]", "_");
  }

}
