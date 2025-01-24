package admin.dao;

import admin.vo.CustomerVO;
import org.apache.ibatis.session.SqlSession;
import service.FactoryService;

import java.util.ArrayList;
import java.util.List;

public class CustomerDao {
    public static List<CustomerVO> allCustomer(){

        SqlSession ss = FactoryService.getFactory().openSession();
        List<CustomerVO> vo = new ArrayList<>();
        vo = ss.selectList("root.allCustomer");
        ss.close();
        return vo;
    }
}
