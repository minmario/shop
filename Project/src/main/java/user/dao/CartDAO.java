package user.dao;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.CartVO;

import java.util.HashMap;
import java.util.List;

public class CartDAO {
    // 장바구니 수 조회
    public static int selectCartCount(String cus_no) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.selectOne("cart.select_cart_count", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return cnt;
    }

    // 장바구니 조회
    public static List<CartVO> selectCart(String cus_no) {
        List<CartVO> c_list = null;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            c_list = ss.selectList("cart.select_cart", cus_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return c_list;
    }

    // 장바구니 추가
    public static int insertCart(CartVO vo) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.insert("cart.insert_cart", vo);

            if (cnt > 0) {
                ss.commit();
            } else {
                ss.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return cnt;
    }

    // 장바구니 수정
    public static int updateCart(CartVO vo) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.update("cart.update_cart", vo);

            if (cnt > 0) {
                ss.commit();
            } else {
                ss.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return cnt;
    }

    // 장바구니 단일 삭제
    public static int deleteCart(HashMap<String, Object> map) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.delete("cart.delete_cart", map);

            if (cnt > 0) {
                ss.commit();
            } else {
                ss.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return cnt;
    }

    // 장바구니 다중 삭제
    public static int deletesCart(HashMap<String, Object> map) {
        int cnt = 0;
        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.delete("cart.deletes_cart", map);

            if (cnt > 0) {
                ss.commit();
            } else {
                ss.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return cnt;
    }

    // 장바구니 전체 삭제
    public static int deleteAllCart(String cus_no) {
        int cnt = 0;

        SqlSession ss = FactoryService.getFactory().openSession();

        try {
            cnt = ss.delete("cart.delete_all_cart", cus_no);

            if (cnt > 0) {
                ss.commit();
            } else {
                ss.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ss.close();
        }

        return cnt;
    }
}
