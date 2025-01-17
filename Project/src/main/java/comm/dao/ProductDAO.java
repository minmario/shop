package comm.dao;

import comm.service.FactoryService;
import comm.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class ProductDAO {

    public static ProductVO[] searchProduct(String seller_no,String category,String prod_name){
        SqlSession ss = FactoryService.getFactory().openSession();
        ProductVO[] ar = null;
        HashMap<String,String> map = new HashMap<>();
        map.put("seller_no",seller_no);
        map.put("category",category);
        map.put("prod_name",prod_name);

        List<ProductVO> list = null;
        System.out.println(seller_no+" / "+category+" / "+prod_name);
        if(category.equals("0")){
            list = ss.selectList("product.search_product_all",map);
        }else {
            list = ss.selectList("product.search_product", map);
        }
        list.toArray(ar);
        ss.close();
        return ar;
    }
}
