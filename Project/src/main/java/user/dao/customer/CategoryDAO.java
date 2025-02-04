package user.dao.customer;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.customer.MajorCategoryVO;

import java.util.List;

public class CategoryDAO {
    public static List<MajorCategoryVO> getCategory() {
        List<MajorCategoryVO> categories = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            categories = ss.selectList("category.select_major_category");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return categories;
    }
}
