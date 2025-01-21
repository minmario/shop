package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.ProductVO;

import java.util.List;

public class ProductDAO {
    public static List<ProductVO> getProducts() {
        List<ProductVO> products = null;
        SqlSession ss= FactoryService.getFactory().openSession();
        products = ss.selectList("product.select_product");
        ss.close();

        return products;
    }
}
