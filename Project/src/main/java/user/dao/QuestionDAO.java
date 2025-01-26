package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.BoardVO;

import java.util.HashMap;
import java.util.List;

public class QuestionDAO {

    public static List<BoardVO> selectAll(String cus_no) {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> list = null;

        try{
            list = ss.selectList("question.select_all", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ss.close();

        return list;
    }

    public static List<BoardVO> selectProdQuestion(String prod_no) {
        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> list = null;

        try{
            list = ss.selectList("question.select_prod_question", prod_no);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ss.close();

        return list;
    }

    public static List<BoardVO> selectOption(String cus_no, String status, String startDate, String endDate){
        HashMap<String, String> map = new HashMap<>();
        map.put("cus_no", cus_no);
        map.put("status", status);
        map.put("startDate", startDate);
        map.put("endDate", endDate);

        SqlSession ss = FactoryService.getFactory().openSession();
        List<BoardVO> list = null;

        try{
            list = ss.selectList("question.select_option", map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ss.close();

        return list;
    }

    public static int insertQuestion(String cus_no, String prod_no, String title, String content, String type, String is_private, String additional_images){
        BoardVO vo = new BoardVO();
        vo.setCus_no(cus_no);
        vo.setProd_no(prod_no);
        vo.setTitle(title);
        vo.setContent(content);
        vo.setType(type);
        vo.setIs_private(is_private);
        vo.setAdditional_images(additional_images);

        SqlSession ss = FactoryService.getFactory().openSession();
        int cnt = 0;

        try{
            cnt = ss.insert("question.insert_question", vo);

            if (cnt > 0)
                ss.commit();
            else
                ss.rollback();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return cnt;
    }
}