package admin.dao;

import admin.vo.BoardProdVO;
import admin.vo.BoardVO;
import admin.vo.MajorCategoryVO;
import org.apache.ibatis.session.SqlSession;
import service.FactoryService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardDao {
    public static List<BoardVO> allBoard(){

        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> vo = new ArrayList<>();
        vo = ss.selectList("root.allBoard");
        ss.close();
        return vo;
    }
    public static List<String> allBoardCategory(){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<String> name = new ArrayList<>();
        name = ss.selectList("root.allBoardCol");
        ss.close();
        return name;

    }
    public static BoardVO[] searchBoard(String searchType, String searchValue){
        Map<String,String> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);
        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> list = ss.selectList("root.searchBoard", map);
        BoardVO[] ar = null;
        if(list != null && list.size() > 0){
            ar = new BoardVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }

}
