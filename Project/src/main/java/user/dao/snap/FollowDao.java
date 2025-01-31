package user.dao.snap;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.CustomerVO;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FollowDao {
  public static boolean addFollow(int customerId, int followingId) {
    try (SqlSession ss = FactoryService.getFactory().openSession();) {
      Map<String, Integer> params = new HashMap<>();
      params.put("customerId", customerId);
      params.put("followingId", followingId);
      ss.insert("FollowMapper.addFollow", params);
      ss.commit();
      return true;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  public static boolean removeFollow(int customerId, int followingId) {
    try (  SqlSession ss = FactoryService.getFactory().openSession();) {
      Map<String, Integer> params = new HashMap<>();
      params.put("customerId", customerId);
      params.put("followingId", followingId);
      ss.delete("FollowMapper.removeFollow", params);
      ss.commit();
      return true;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  public static boolean isFollowing(int customerId, int followingId) {
    try (  SqlSession ss = FactoryService.getFactory().openSession();) {
      Map<String, Integer> params = new HashMap<>();
      params.put("customerId", customerId);
      params.put("followingId", followingId);
      Integer count = ss.selectOne("FollowMapper.isFollowing", params);
      return count != null && count > 0;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }





    // 나를 팔로우한 사람 목록
    public List<CustomerVO> getFollowers(int userId, int sessionUserId) {
      try (SqlSession ss = FactoryService.getFactory().openSession()) {
        Map<String, Integer> params = new HashMap<>();
        params.put("userId", userId);
        params.put("sessionUserId", sessionUserId);
        return ss.selectList("FollowMapper.getFollowers", params);
      } catch (Exception e) {
        e.printStackTrace();
        return Collections.emptyList(); // 오류 발생 시 빈 리스트 반환
      }
    }

    // 내가 팔로우한 사람 목록
    public List<CustomerVO> getFollowings(int userId, int sessionUserId) {
      try (SqlSession ss = FactoryService.getFactory().openSession()) {
        Map<String, Integer> params = new HashMap<>();
        params.put("userId", userId);
        params.put("sessionUserId", sessionUserId);
        return ss.selectList("FollowMapper.getFollowings", params);
      } catch (Exception e) {
        e.printStackTrace();
        return Collections.emptyList();
      }
    }



  public int getFollowerCount(int userId) {
    try (SqlSession ss = FactoryService.getFactory().openSession()) {
      return ss.selectOne("FollowMapper.getFollowerCount", userId);
    } catch (Exception e) {
      e.printStackTrace();
      return 0;
    }
  }

  public int getFollowingCount(int userId) {
    try (SqlSession ss = FactoryService.getFactory().openSession()) {
      return ss.selectOne("FollowMapper.getFollowingCount", userId);
    } catch (Exception e) {
      e.printStackTrace();
      return 0;
    }
  }

}

