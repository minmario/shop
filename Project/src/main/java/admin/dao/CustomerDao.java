package admin.dao;

import admin.vo.CustomerVO;
import admin.vo.MajorCategoryVO;
import org.apache.ibatis.session.SqlSession;
import service.FactoryService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerDao {
    public static List<CustomerVO> allCustomer(){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<CustomerVO> vo = new ArrayList<CustomerVO>();
        vo = ss.selectList("root.allCustomer");
        return vo;
    }
    public static List<String> allCustomerName(){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<String> name = new ArrayList<>();
        name = ss.selectList("root.allCustomerCol");
        ss.close();
        return name;
    }
    public static CustomerVO[] searchCustomer(String searchType, String searchValue){
        Map<String,String> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);
        SqlSession ss = FactoryService.getFactory().openSession();
        List<CustomerVO> list = ss.selectList("root.searchCustomer", map);
        CustomerVO[] ar = null;
        if(list != null && list.size() > 0){
            ar = new CustomerVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }

}
