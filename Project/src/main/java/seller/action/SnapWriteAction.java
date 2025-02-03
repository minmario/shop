//package seller.action;
//import comm.action.Action;
//import comm.service.S3Uploader;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.File;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
//import java.util.UUID;
//import java.util.stream.Collectors;
//
//public class SnapWriteAction implements Action {
//
//  @Override
//  public String execute(HttpServletRequest request, HttpServletResponse response) {
//    String uploadPath = request.getServletContext().getRealPath("/upload");
//    File uploadDir = new File(uploadPath);
//    if (!uploadDir.exists()) {
//      uploadDir.mkdir();
//    }
//
//    String mainImageUrl = null;
//
//    try {
//      // File Upload 처리
//      DiskFileItemFactory factory = new DiskFileItemFactory();
//      ServletFileUpload upload = new ServletFileUpload(factory);
//
//      List<FileItem> items = upload.parseRequest(request);
//
//      // 게시글 관련 데이터를 저장할 변수
//      String bname = "snap";
//      String title = null;
//      String content = null;
//      String gender = null;
//      String season = null;
//      String style = null;
//      String tags = null;
//      String prodNo = null;
//
//
//      List<String> additionalImageUrls = new ArrayList<>();
//      for (FileItem item : items) {
//        if (item.isFormField()) {
//          // Form 필드 처리
//          String fieldName = item.getFieldName();
//          String value = item.getString("UTF-8");
//
//          switch (fieldName) {
////            case "bname":
////              bname = value;
////              break;
//            case "tags":
//              tags = value;
//              break;
//            case "content":
//              content = value;
//              break;
//            case "gender":
//              gender = value;
//              break;
//            case "season":
//              season = value;
//              break;
//            case "style":
//              style = value;
//              break;
//            case "prod_no":
//              prodNo = value;
//              break;
//          }
//        } else {
//          // 파일 처리
//          String fieldName = item.getFieldName();
//          String originalFileName = new File(item.getName()).getName();
//
//          String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFileName;
//
//          File file = new File(uploadPath + File.separator + uniqueFileName);
//          item.write(file);
//
//          // S3 업로드 s3매서드로 메인이미지 서브이지미 db저장할 이름만듬
//          S3Uploader s3Uploader = new S3Uploader();
//          String s3Path = fieldName.equals("mainImage")
//              ? "main/" + uniqueFileName
//              : "additional/" + uniqueFileName;
//
//          String fileUrl = s3Uploader.uploadFile(file, s3Path);
//          System.out.println("prod_no:"+prodNo);
//
//          if (fieldName.equals("mainImage")) {
//            mainImageUrl = fileUrl;
//          } else if (fieldName.equals("additionalImages")) {
//            additionalImageUrls.add(fileUrl);
//          }
//        }
//      }
//      System.out.println("tags: " + tags);
//      // 게시글 정보 저장
//      BoardVO boardVO = new BoardVO();
//      boardVO.setBname(bname);
//      boardVO.setNickname((String) request.getSession().getAttribute("nickname"));
//      boardVO.setCus_no((Integer) request.getSession().getAttribute("cus_id"));
//      boardVO.setTags(tags);
//      boardVO.setContent(content);
//      boardVO.setSnapshot_image(mainImageUrl);
//      boardVO.setAdditional_images(String.join(",", additionalImageUrls));
//      boardVO.setGender(gender);
//      boardVO.setSeason(season);
//      boardVO.setStyle(style);
//      boardVO.setProd_no(prodNo);
//
//      user.dao.snap.SnapDao dao = new user.dao.snap.SnapDao();
//      int result = dao.insertBoard(boardVO);
//
//      if (result > 0) {
//        int boardNo = boardVO.getId();
//
//
//        if (prodNo != null && !prodNo.trim().isEmpty()) {
//          List<Integer> prodNoList = Arrays.stream(prodNo.split(","))
//              .map(String::trim)
//              .map(Integer::parseInt)
//              .collect(Collectors.toList());
//
//          // board_prod 테이블에 삽입
//          dao.insertBoardProd(boardNo, prodNoList);
//        }
//        return "Controller?type=snap";
//      } else {
//        request.setAttribute("error", "게시글저장문제");
//        return "/user/jsp/snap/snapWrite.jsp";
//      }
//    } catch (Exception e) {
//      e.printStackTrace();
//      request.setAttribute("error", "파일업로드문제");
//      return "/user/jsp/snap/snapWrite.jsp";
//    }
//  }
//}
