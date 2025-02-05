package user.action.customer;

import user.action.Action;
import user.dao.customer.BoardDAO;
import user.dao.customer.LogDAO;
import user.vo.customer.BoardVO;
import user.vo.customer.CustomerVO;
import user.vo.customer.LogVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class BoardAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        }

        String viewPage = null;
        if (action != null) {
            switch (action) {
                case "inquiry":
                    viewPage = "/user/customer/jsp/mypage/writeInquiry.jsp";
                    break;
                case "select":
                    List<BoardVO> all_list = BoardDAO.selectAll(cvo.getId());
                    request.setAttribute("inquiry_list", all_list);
                    viewPage = "/user/customer/jsp/mypage/components/inquiry.jsp";
                    break;
                case "search":
                    String status = request.getParameter("status");
                    status = (status != null && !status.trim().isEmpty()) ? status : null;

                    String startDate = request.getParameter("startDate");
                    startDate = (startDate != null && !startDate.trim().isEmpty()) ? startDate : null;

                    String endDate = request.getParameter("endDate");
                    endDate = (endDate != null && !endDate.trim().isEmpty()) ? endDate : null;

                    List<BoardVO> searchlist = BoardDAO.selectSearch(cvo.getId(), status, startDate, endDate);
                    request.setAttribute("inquiry_list", searchlist);
                    viewPage = "/user/customer/jsp/mypage/components/inquiry.jsp";
                    break;
                case "saveimg":
//                    String S3_BUCKET_NAME = "my-home-shoppingmall-bucket";
//                    String S3_REGION = "us-east-1";
//                    String S3_UPLOAD_DIRECTORY = "inquiry/";
//
//                    AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
//                            .withRegion("us-east-1") // 리전을 버킷에 맞게 설정
//                            .build();
//
//                    if (!ServletFileUpload.isMultipartContent(request)) {
//                        System.out.println("Form must be multipart.");
//                    }
//
//                    List<String> fileUrls = new ArrayList<>();
//
//                    try {
//                        DiskFileItemFactory factory = new DiskFileItemFactory();
//                        ServletFileUpload upload = new ServletFileUpload(factory);
//
//                        List<FileItem> formItems = upload.parseRequest(request);
//
//                        if (formItems != null && formItems.size() > 0) {
//                            for (FileItem item : formItems) {
//                                if (!item.isFormField()) {
//                                    String fileName = new File(item.getName()).getName();
//                                    File tempFile = File.createTempFile("upload-", fileName);
//                                    item.write(tempFile);
//
//                                    // S3에 업로드
//                                    String s3Key = S3_UPLOAD_DIRECTORY + fileName;
//                                    s3Client.putObject(new PutObjectRequest(S3_BUCKET_NAME, s3Key, tempFile));
//
//                                    // 업로드된 파일의 S3 URL 저장
//                                    String fileUrl = "https://" + S3_BUCKET_NAME + ".s3." + S3_REGION + ".amazonaws.com/" + s3Key;
//                                    fileUrls.add(fileUrl);
//
//                                    // 임시 파일 삭제
//                                    tempFile.delete();
//                                }
//                            }
//                        }
//
//                        request.setAttribute("fileUrls", fileUrls.toString());
//                    } catch (Exception ex) {
//                        ex.printStackTrace();
//                    }

//                    String uploadPath = "https://my-home-shoppingmall-bucket.s3.amazonaws.com/inquiry";
//
//                    try {
//                        // DiskFileItemFactory 및 ServletFileUpload 설정
//                        DiskFileItemFactory factory = new DiskFileItemFactory();
//                        ServletFileUpload upload = new ServletFileUpload(factory);
//
//                        System.out.println("request : " + request);
//
//                        // 요청에서 파일 항목 파싱
//                        List<FileItem> formItems = upload.parseRequest(request);
//
//                        if (formItems != null && formItems.size() > 0) {
//                            for (FileItem item : formItems) {
//                                if (!item.isFormField()) { // 파일인 경우 처리
//                                    String fileName = new File(item.getName()).getName();
//                                    String filePath = uploadPath + File.separator + fileName;
//                                    File storeFile = new File(filePath);
//
//                                    // 파일 저장
//                                    item.write(storeFile);
//
//                                    request.setAttribute("fileUrls", filePath);
//                                }
//                            }
//                        }
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }

                    break;
                case "insert":
                    String i_type = request.getParameter("inquiryType");
                    String i_orderCode = request.getParameter("orderCode");
                    String i_content = request.getParameter("content");
                    String i_additional_images = request.getParameter("");

                    BoardVO ivo = new BoardVO();
                    ivo.setCus_no(cvo.getId());
                    ivo.setContent(i_content);
                    ivo.setAdditional_images("");
                    ivo.setOrder_code(i_orderCode);
                    ivo.setType(i_type);

                    int cnt = BoardDAO.insertInquiry(ivo);

                    if (cnt > 0) {
                        request.setAttribute("response", "true");

                        // 추가 로그
                        LogVO lvo = new LogVO();
                        StringBuffer sb = new StringBuffer();
                        lvo.setCus_no(cvo.getId());
                        lvo.setTarget("inquiry 추가");
                        sb.append("content : " + i_content + ", ");
                        sb.append("order_code : " + i_orderCode + ", ");
                        sb.append("type : " + i_type + ", ");
                        sb.append("additional_images : " + i_additional_images);
                        lvo.setCurrent(sb.toString());
                        LogDAO.insertLog(lvo);
                    } else {
                        request.setAttribute("response", "false");
                    }

                    viewPage = "/user/customer/jsp/mypage/writeInquiry.jsp";
                    break;
                case "faq":
                    viewPage = "/user/customer/jsp/board/faq.jsp";
                    break;
            }
        }

        return viewPage;
    }
}
