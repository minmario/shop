package seller.action;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import comm.action.Action;
import comm.service.S3Uploader;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class SaveImgAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 이미지 파일을 저장할 위치를 절대경로화 시킨다.
		String uploadPath = request.getServletContext().getRealPath("/upload");
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()){
			uploadDir.mkdir();
		}
		String fname = null;
		String mainImageUrl =null;
		List<String> additionalImageUrls = new ArrayList<>();
		try {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(request);

			// 이미 이미지 파일은 업로드가 된 상태이며, 이제는 호출한 곳으로
			// 저장된 이미지의 전체경로를 보내줘서 에디터에 포현하도록 해야 한다.
			for(FileItem item : items) {
				String fieldName = item.getFieldName();
				String originalFileName = new File(item.getName()).getName();
				String uniqueFileName =UUID.randomUUID().toString()+"_"+originalFileName;

				File file = new File(uploadPath+File.separator+uniqueFileName);
				item.write(file);

				S3Uploader s3Uploader = new S3Uploader();
				String s3Path = fieldName.equals("mainImage")
						? "main/" + uniqueFileName
						: "additional/" + uniqueFileName;
				String fileUrl = s3Uploader.uploadFile(file,s3Path);
				if(fieldName.equals("mainImage")){
					mainImageUrl = fileUrl;
				} else if(fieldName.equals("additionalImages")){
					additionalImageUrls.add(fileUrl);
				}
			}

			fname = mainImageUrl;
			request.setAttribute("f_name", fname);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/seller/jsp/saveImg.jsp";
	}


}
