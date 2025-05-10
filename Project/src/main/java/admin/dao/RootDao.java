package admin.dao;

import org.apache.ibatis.session.SqlSession;
import comm.service.FactoryService;
import admin.vo.RootVO;

public class RootDao {
    public static RootVO login(String admin_id) {
        SqlSession ss = FactoryService.getFactory().openSession();
        RootVO vs = ss.selectOne("root.loginSelect", admin_id);
        ss.close();
        return vs;
    }
}
