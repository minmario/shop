package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.ProductVO;

import java.util.HashMap;
import java.util.List;

public class ProductDAO {
    // 상품 조회
    public static List<ProductVO> selectProduct(String category, String sort) {
        List<ProductVO> products = null;
        SqlSession ss= FactoryService.getFactory().openSession();

        try {
            HashMap<String, String> map = new HashMap<>();
            map.put("category_no", category);
            map.put("sort", sort);

            products = ss.selectList("product.select_product", map);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return products;
    }

    // 상품 상세 조회
    public static ProductVO selectProdDetails(String id) {
        ProductVO productDetails = null;
        SqlSession ss= FactoryService.getFactory().openSession();

        try {
            productDetails = ss.selectOne("product.select_product_details", id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return productDetails;
    }

    // 상품 사이즈 조회
    public static List<ProductVO> selectSize(String id) {
        List<ProductVO> productSize = null;
        SqlSession ss= FactoryService.getFactory().openSession();

        try {
            productSize = ss.selectList("product.select_size", id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return productSize;
    }
}
