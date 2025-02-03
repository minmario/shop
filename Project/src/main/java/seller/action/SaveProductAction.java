package seller.action;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import comm.action.Action;
import comm.dao.InventoryDAO;
import comm.dao.ProductDAO;
import comm.vo.InventoryVO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

public class SaveProductAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try {
            ServletContext application = request.getServletContext();
            String realPath = application.getRealPath("/upload");
            File uploadDir = new File(realPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            MultipartRequest mr = new MultipartRequest(request, realPath, 1024 * 1024 * 50, "utf-8", new DefaultFileRenamePolicy());

            String prod_name = mr.getParameter("prod_name");
            String middle_category = mr.getParameter("middle_category");
            String[] prod_option = mr.getParameterValues("prod_option[]");
            String[] inventory_option = mr.getParameterValues("inventory_option[]");
            String seller_no = (String) session.getAttribute("seller_no");
            String price = mr.getParameter("price");
            String sale = mr.getParameter("sale");
            String prod_no = mr.getParameter("prod_no");
            File main_image = mr.getFile("main_image");
            String content = mr.getParameter("content");
            System.out.println("price: "+price+"/sale: "+sale);
            String saled_price = String.valueOf((int) (Double.parseDouble(price) - (Double.parseDouble(price) * Double.parseDouble(sale) / 100)));
            // 파일 경로 처리
            String prod_image = main_image.getAbsolutePath();
            List<String> additionalImagePaths = new ArrayList<>();
            System.out.println("prod_image : "+prod_image);
            Enumeration<?> fileNames = mr.getFileNames();
            while (fileNames.hasMoreElements()) {
                String fileField = (String) fileNames.nextElement();
                File uploadedFile = mr.getFile(fileField);
                if (uploadedFile != null) {
                    additionalImagePaths.add(uploadedFile.getAbsolutePath());
                }
            }
            String additional_image = String.join(",", additionalImagePaths);
            System.out.println("추가 이미지: " + additional_image);
            InventoryVO[] ar = new InventoryVO[prod_option.length];

            int cnt = -1;
            if (prod_no == null) {
                prod_no = ProductDAO.addProduct(prod_name, middle_category, price, sale, seller_no, prod_image, additional_image, content, saled_price);
                cnt = InventoryDAO.addOptions(setArr(prod_option,inventory_option,prod_no));
            }
            else{
                System.out.println("else문");
                ProductDAO.updateProduct(prod_no,prod_name, middle_category, price, sale, prod_image, additional_image, content, saled_price);
                cnt = InventoryDAO.updateOptions(setArr(prod_option,inventory_option,prod_no));
            }

            request.setAttribute("cnt", cnt);
            request.setAttribute("seller_no", seller_no);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/Controller?type=productList";
    }
    public InventoryVO[] setArr(String[] p_option, String[] i_option,String prod_no){
       InventoryVO[] ar = new InventoryVO[p_option.length];
       InventoryVO[] ex_ar = InventoryDAO.getOptions(prod_no);

        for(int i =0;i<ar.length;i++){
            ar[i] = new InventoryVO();
            ar[i].setOption_name(p_option[i]);
            ar[i].setCount(i_option[i]);
            ar[i].setProd_no(prod_no);
        }
        return ar;
    }
}
