package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.BoardVO;

import java.util.HashMap;
import java.util.List;

public class BoardDAO {

    public static List<BoardVO> selectAll(String cus_no) {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> list = null;

        try{
            list = ss.selectList("board.select_all", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ss.close();

        return list;
    }

    public static List<BoardVO> selectSearch(String cus_no, String status, String dateRange,
                                             String startDate, String endDate) {

        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("status", status);
        map.put("dateRange", dateRange);
        map.put("startDate", startDate);
        map.put("endDate", endDate);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> list = null;

        try{
            list = ss.selectList("board.select_search", map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ss.close();

        return list;
    }
}
