package admin.dao;

import admin.vo.BoardProdVO;
import org.apache.ibatis.session.SqlSession;
import service.FactoryService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardProdDao {
    public static List<BoardProdVO> allBoardProd(){

        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardProdVO> vo = new ArrayList<>();
        vo = ss.selectList("root.allBoardProd");
        ss.close();
        return vo;
    }
    public static List<String> allBoardProdCol(){
        SqlSession ss = FactoryService.getFactory().openSession();
        List<String> name = new ArrayList<>();
        name = ss.selectList("root.allBoardProdCol");
        ss.close();
        return name;
    }
    public static BoardProdVO[] searchBoardProd(String searchType, String searchValue){
        Map<String,String> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("searchValue", searchValue);
        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardProdVO> list = ss.selectList("root.searchBoardProd", map);
        BoardProdVO[] ar = null;
        if(list != null && list.size() > 0){
            ar = new BoardProdVO[list.size()];
            list.toArray(ar);
        }
        ss.close();
        return ar;
    }
}
