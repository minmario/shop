package user.action.Snap;

import com.google.gson.JsonObject;
import service.S3Uploader;
import user.action.Action;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class UploadImageAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    JsonObject jsonResponse = new JsonObject();
    response.setContentType("application/json");



    Part filePart = request.getPart("file"); // input name="file"
    if (filePart == null) {
      jsonResponse.addProperty("success", false);
      jsonResponse.addProperty("message", "파일을 찾을 수 없습니다.");
      response.getWriter().write(jsonResponse.toString());
      return null;
    }

    String originalFileName = filePart.getSubmittedFileName();
    if (originalFileName == null || originalFileName.isEmpty()) {
      jsonResponse.addProperty("success", false);
      jsonResponse.addProperty("message", "파일 이름이 유효하지 않습니다.");
      response.getWriter().write(jsonResponse.toString());
      return null;
    }

    // ✅ 파일명 정리 (한글 및 특수문자 제거)
    String safeFileName = originalFileName.replaceAll("[^a-zA-Z0-9.]", "_");
    System.out.println("📌 변환된 파일명: " + safeFileName);

    // ✅ 파일을 로컬 임시 저장
    File tempFile = convertInputStreamToFile(filePart.getInputStream(), safeFileName);
    if (tempFile == null) {
      jsonResponse.addProperty("success", false);
      jsonResponse.addProperty("message", "파일 변환 실패");
      response.getWriter().write(jsonResponse.toString());
      return null;
    }

    // ✅ S3 업로드
    S3Uploader uploader = new S3Uploader();
    String imageUrl = uploader.uploadFile(tempFile, safeFileName);

    // ✅ 업로드 성공 여부 확인
    if (imageUrl == null || imageUrl.isEmpty()) {
      System.out.println("❌ S3 업로드 실패!");
      jsonResponse.addProperty("success", false);
      jsonResponse.addProperty("message", "S3 업로드 실패");
    } else {
      System.out.println("✅ S3 업로드 성공! 이미지 URL: " + imageUrl);
      jsonResponse.addProperty("success", true);
      jsonResponse.addProperty("imageUrl", imageUrl);
    }

    // ✅ 임시 파일 삭제
    tempFile.delete();

    response.getWriter().write(jsonResponse.toString());
    return null;
  }

  /**
   * ✅ InputStream을 File로 변환하는 메서드
   */
  private File convertInputStreamToFile(InputStream inputStream, String fileName) {
    try {
      File tempFile = File.createTempFile("upload_", "_" + fileName);
      Files.copy(inputStream, tempFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
      inputStream.close();
      return tempFile;
    } catch (IOException e) {
      System.err.println("❌ 파일 변환 오류: " + e.getMessage());
      return null;
    }
  }
}
