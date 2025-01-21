package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.MajorCategoryVO;

import java.util.List;

public class CategoryDAO {
    public static List<MajorCategoryVO> getCategory() {
        List<MajorCategoryVO> categories = null;
        SqlSession ss = FactoryService.getFactory().openSession();
        categories = ss.selectList("category.select_major_category");
        ss.close();

        return categories;
    }
}
