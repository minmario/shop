package admin.dao;

import admin.vo.CustomerVO;
import admin.vo.MajorCategoryVO;
import org.apache.ibatis.session.SqlSession;
import service.FactoryService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MajorCategoryDao {
    public static List<MajorCategoryVO> allMajor(){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<MajorCategoryVO> vo = new ArrayList<MajorCategoryVO>();
        vo = ss.selectList("root.allMajor");
        return vo;
    }
    public static List<String> allMajorCategory(){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<String> name = new ArrayList<>();
        name = ss.selectList("root.allMajorCol");
        return name;
    }
    public static MajorCategoryVO[] searchMajorCategory(String searchType, String searchValue){
        Map<String,String> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);
        SqlSession ss = FactoryService.getFactory().openSession();
        List<MajorCategoryVO> list = ss.selectList("root.searchMajorCategory", map);
        MajorCategoryVO[] ar = null;
        if(list != null && list.size() > 0){
            ar = new MajorCategoryVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }
}
