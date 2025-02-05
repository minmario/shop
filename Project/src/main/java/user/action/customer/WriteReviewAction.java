package user.action.customer;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
import java.util.List;
import java.util.UUID;

public class WriteReviewAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        String prod_no = request.getParameter("prod_no");
        String order_code = request.getParameter("order_code");
        HttpSession session = request.getSession();
        CustomerVO cvo = (CustomerVO) session.getAttribute("customer_info");

        if (cvo == null) {
            request.setAttribute("session_expired", true);
            return "/user/customer/jsp/error/error.jsp";
        }

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
                        // 업로드 경로 설정
                        String uploadPath = request.getServletContext().getRealPath("/upload");
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) {
                            uploadDir.mkdir();
                        }

                        // 파일 업로드 및 데이터 처리
                        DiskFileItemFactory factory = new DiskFileItemFactory();
                        ServletFileUpload upload = new ServletFileUpload(factory);

                        List<FileItem> items = upload.parseRequest(request);

                        String rating = null;
                        String comment = null;
                        String gender = null;
                        String height = null;
                        String weight = null;
                        String photoUrl = null;
                        String isUpdateChecked = null;

                        for (FileItem item : items) {
                            if (item.isFormField()) {
                                String fieldName = item.getFieldName();
                                String value = item.getString("UTF-8");

                                switch (fieldName) {
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
                                String originalFileName = new File(item.getName()).getName();
                                String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFileName;

                                File file = new File(uploadPath + File.separator + uniqueFileName);
                                item.write(file);

//                                // S3 업로드 처리
//                                S3Uploader s3Uploader = new S3Uploader();
//                                photoUrl = s3Uploader.uploadFile(file, "additional/" + uniqueFileName);
                            }
                        }

                        // 데이터베이스에 리뷰 저장
                        BoardVO b_vo = new BoardVO();
                        b_vo.setProd_no(prod_no);
                        b_vo.setOrder_code(order_code);
                        b_vo.setCus_no(cvo.getId());
                        b_vo.setScore(String.valueOf(Integer.parseInt(rating)));
                        b_vo.setContent(comment);
                        b_vo.setGender(gender);
                        b_vo.setAdditional_images(photoUrl);

                        // 체크박스가 체크된 경우에만 키와 몸무게 업데이트
                        if ("true".equals(isUpdateChecked)) {
                            CustomerDAO.updateBodyInfo(cvo.getId(), weight, height);
                        }

                        int i_b_cnt = BoardDAO.insertReview(b_vo);

                        if (i_b_cnt > 0) {
                            return "Controller?type=myPage";
                        } else {
                            request.setAttribute("error", "리뷰 저장 중 오류가 발생했습니다.");
                            return "/user/customer/jsp/mypage/writeReview.jsp";
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                        request.setAttribute("error", "파일 업로드 중 오류가 발생했습니다.");
                        return "/user/customer/jsp/mypage/writeReview.jsp";
                    }
        }
    }

        return viewPath;
}
}
