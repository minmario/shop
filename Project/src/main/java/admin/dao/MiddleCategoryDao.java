package admin.dao;

import admin.vo.MajorCategoryVO;
import admin.vo.MiddleCategoryVO;
import org.apache.ibatis.session.SqlSession;
import service.FactoryService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MiddleCategoryDao {
    public static List<MiddleCategoryVO> allMiddle(){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<MiddleCategoryVO> vo = new ArrayList<>();
        vo = ss.selectList("root.allMiddle");
        return vo;
    }

    public static List<String> allMiddleCategory(){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<String> name = new ArrayList<>();
        name= ss.selectList("root.allMiddleCol");
        return name;
    }
    public static MiddleCategoryVO[] searchMiddleCategory(String searchType, String searchValue){
        Map<String,String> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);
        SqlSession ss = FactoryService.getFactory().openSession();
        List<MiddleCategoryVO> list = ss.selectList("root.searchMiddleCategory", map);
        MiddleCategoryVO[] ar = null;
        if(list != null && list.size() > 0){
            ar = new MiddleCategoryVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }
}
