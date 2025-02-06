package seller.action;

import comm.action.Action;
import comm.dao.SellerDAO;
import comm.service.S3Uploader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

public class UploadLogoAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String sellerId = "2"; // 🚨 나중에 세션에서 가져오기
         response.setCharacterEncoding("utf-8");
         response.setContentType("application/json");
        System.out.println("액션반환성공 ");
        try {
            Part filePart = request.getPart("logoFile");
            if (filePart == null || filePart.getSize() == 0) {
                return "json:{\"result\":\"fail\", \"message\":\"파일이 없습니다.\"}";
            }

            // 파일명 가져오기
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            File tempFile = File.createTempFile("upload_", fileName);
            filePart.write(tempFile.getAbsolutePath());

            // S3Uploader를 사용하여 S3에 업로드
            S3Uploader s3Uploader = new S3Uploader();
            String fileUrl = s3Uploader.uploadFile(tempFile, fileName);
            System.out.println("sellerid"+sellerId);
            System.out.println("fileUrl:" + fileUrl);
            // DB 업데이트
            int result = SellerDAO.updateSellerIcon(sellerId, fileUrl);

            // 응답 JSON 반환
            if (result > 0) {
                return "json:{\"result\":\"success\", \"logoUrl\":\"" + fileUrl + "\"}";
            } else {
                return "json:{\"result\":\"fail\", \"message\":\"DB 업데이트 실패\"}";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "json:{\"result\":\"fail\", \"message\":\"서버 오류 발생\"}";
        }
    }
}
