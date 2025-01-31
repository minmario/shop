package user.dao.snap;
import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.ChatRoomVO;
import user.vo.ChatMessageVO;
import user.vo.CustomerVO;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class ChatDao {
  // ✅ 1. 채팅방이 있는지 확인
  public ChatRoomVO getChatRoom(int user1Id, int user2Id) {
    try (SqlSession ss = FactoryService.getFactory().openSession()) {
      Map<String, Integer> params = new HashMap<>();
      params.put("user1Id", user1Id);
      params.put("user2Id", user2Id);
      return ss.selectOne("ChatMapper.getChatRoom", params);
    }
  }

  // ✅ 2. 채팅방 생성
  public int createChatRoom(int user1Id, int user2Id) {
    try (SqlSession ss = FactoryService.getFactory().openSession()) {
      Map<String, Integer> params = new HashMap<>();
      params.put("user1Id", user1Id);
      params.put("user2Id", user2Id);
      ss.insert("ChatMapper.createChatRoom", params);
      ss.commit();
      return params.get("id"); // 생성된 채팅방 ID 반환
    }
  }

  // ✅ 3. 사용자의 채팅방 목록 가져오기
  public List<ChatRoomVO> getChatRooms(int userId) {
    try (SqlSession ss = FactoryService.getFactory().openSession()) {
      return ss.selectList("ChatMapper.getChatRooms", userId);
    }
  }

  // ✅ 4. 특정 채팅방의 메시지 조회
  public List<ChatMessageVO> getChatMessages(int roomId) {
    try (SqlSession ss = FactoryService.getFactory().openSession()) {
      return ss.selectList("ChatMapper.getChatMessages", roomId);
    }
  }

  // ✅ 5. 메시지 전송
  public boolean sendMessage(int roomId, int senderId, String message) {
    try (SqlSession ss = FactoryService.getFactory().openSession()) {
      Map<String, Object> params = new HashMap<>();
      params.put("roomId", roomId);
      params.put("senderId", senderId);
      params.put("message", message);
      ss.insert("ChatMapper.sendMessage", params);
      ss.commit();
      return true;
    }
  }

  public CustomerVO getUserProfile(int userId) {
    try (SqlSession ss = FactoryService.getFactory().openSession()) {
      return ss.selectOne("ChatMapper.getUserInfo", userId);
    }
  }
}