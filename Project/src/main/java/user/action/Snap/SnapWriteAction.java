package user.action.Snap;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.*;
import java.util.stream.Collectors;
import java.io.File;
import java.util.UUID;

import service.S3Uploader;
import user.action.Action;
import user.vo.BoardVO;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,   // 1MB 이상이면 임시 파일로 저장
    maxFileSize = 1024 * 1024 * 10,      // 최대 파일 크기 10MB
    maxRequestSize = 1024 * 1024 * 50    // 최대 요청 크기 50MB
)
public class SnapWriteAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    // --- 일반 폼 필드는 request.getParameter()로 받음 ---
    String content = request.getParameter("content");
    System.out.println();
    String gender = request.getParameter("gender");
    String season = request.getParameter("season");
    String style = request.getParameter("style");
    String tags = request.getParameter("tags");

  
    String[] prodNoArray = request.getParameterValues("prod_no");
    List<String> prodNoList = new ArrayList<>();
    if (prodNoArray != null) {
      for (String s : prodNoArray) {
        if (s != null && !s.trim().isEmpty()) {
          // 값에 쉼표가 포함된 경우 분리
          String[] parts = s.split(",");
          for (String part : parts) {
            String trimmed = part.trim();
            if (!trimmed.isEmpty()) {
              prodNoList.add(trimmed);
            }
          }
        }
      }
    }
    String prodNoCombined = String.join(",", prodNoList);

    // --- 파일 업로드 처리 ---
    // 로컬 업로드 경로 설정 (임시 저장용)
    String uploadPath = request.getServletContext().getRealPath("/upload");
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) {
      uploadDir.mkdir();
    }

    String mainImageUrl = null;
    List<String> additionalImageUrls = new ArrayList<>();

    try {
      // request.getParts()를 이용하여 파일 파트를 순회
      Collection<Part> parts = request.getParts();
      for (Part part : parts) {
        String fieldName = part.getName();
        // 파일 부분인 경우, 파일 크기가 0보다 크면 처리
        if (fieldName.equals("mainImage") && part.getSize() > 0) {
          String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
          String safeFileName = generateSafeFileName(originalFileName);
          File file = new File(uploadPath + File.separator + safeFileName);
          try (InputStream input = part.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
          }
          // S3 업로드 처리
          S3Uploader s3Uploader = new S3Uploader();
          String s3Path = "main/" + safeFileName;
          mainImageUrl = s3Uploader.uploadFile(file, s3Path);
        } else if (fieldName.equals("additionalImages") && part.getSize() > 0) {
          String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
          String safeFileName = generateSafeFileName(originalFileName);
          File file = new File(uploadPath + File.separator + safeFileName);
          try (InputStream input = part.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
          }
          S3Uploader s3Uploader = new S3Uploader();
          String s3Path = "additional/" + safeFileName;
          String fileUrl = s3Uploader.uploadFile(file, s3Path);
          additionalImageUrls.add(fileUrl);
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
      request.setAttribute("error", "파일 업로드 중 문제가 발생했습니다.");
      return "/user/snap/jsp/snap.mypage.jsp";
    }

    // --- BoardVO 객체에 값 설정 ---
    BoardVO boardVO = new BoardVO();
    boardVO.setBname("snap");
    boardVO.setNickname((String) request.getSession().getAttribute("nickname"));
    boardVO.setCus_no((Integer) request.getSession().getAttribute("cus_id"));
    boardVO.setContent(content);
    boardVO.setTags(tags);
    boardVO.setSnapshot_image(mainImageUrl);
    boardVO.setAdditional_images(String.join(",", additionalImageUrls));
    boardVO.setGender(gender);
    boardVO.setSeason(season);
    boardVO.setStyle(style);
    boardVO.setProd_no(prodNoCombined);

    // --- DB 저장 처리 (SnapDao 사용) ---
    user.dao.snap.SnapDao dao = new user.dao.snap.SnapDao();
    int result = dao.insertBoard(boardVO);
    if (result > 0) {
      int boardNo = boardVO.getId();
      if (prodNoCombined != null && !prodNoCombined.trim().isEmpty()) {
        // prod_no 값을 정수 리스트로 변환하여 board_prod 테이블에 저장
        List<Integer> prodNoIntList = Arrays.stream(prodNoCombined.split(","))
            .map(String::trim)
            .filter(s -> !s.isEmpty())
            .map(Integer::parseInt)
            .collect(Collectors.toList());
        dao.insertBoardProd(boardNo, prodNoIntList);

     }
      return "redirect:/Controller?type=snap";
    } else {
      request.setAttribute("error", "게시글 저장에 실패했습니다.");
      return "/Controller?type=snap";
    }
  }


  private String generateSafeFileName(String originalFileName) {
    if (originalFileName == null || originalFileName.isEmpty()) {
      return UUID.randomUUID().toString();
    }
    int lastDotIndex = originalFileName.lastIndexOf(".");
    String baseName = (lastDotIndex == -1) ? originalFileName : originalFileName.substring(0, lastDotIndex);
    String extension = (lastDotIndex == -1) ? "" : originalFileName.substring(lastDotIndex);
    baseName = baseName.replaceAll("[^a-zA-Z0-9]", "_");
    return UUID.randomUUID().toString() + "_" + baseName + extension;
  }
}
