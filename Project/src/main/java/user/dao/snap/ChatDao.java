package user.dao.snap;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.snap.ChatRoomVO;
import user.vo.snap.ChatMessageVO;

import user.vo.snap.CustomerVO;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class ChatDao {




  public ChatRoomVO getChatRoom(int user1Id, int user2Id) {
    SqlSession ss = FactoryService.getFactory().openSession();
    Map<String, Integer> params = new HashMap<>();
    params.put("user1Id", user1Id);
    params.put("user2Id", user2Id);
    ChatRoomVO chatRoom = ss.selectOne("ChatMapper.getChatRoom", params);
    ss.close();
    return chatRoom;
  }

  public int createChatRoom(int user1Id, int user2Id) {
    SqlSession ss = FactoryService.getFactory().openSession();
    Map<String, Integer> params = new HashMap<>();
    params.put("user1Id", user1Id);
    params.put("user2Id", user2Id);
    ss.insert("ChatMapper.createChatRoom", params);
    ss.commit();
    int chatRoomId = params.get("id");
    ss.close();
    return chatRoomId;
  }

  public List<ChatRoomVO> getChatRooms(int userId) {
    SqlSession ss = FactoryService.getFactory().openSession();
    List<ChatRoomVO> chatRooms = ss.selectList("ChatMapper.getChatRooms", userId);
    ss.close();
    return chatRooms;
  }

  public List<ChatMessageVO> getChatMessages(int roomId) {
    SqlSession ss = FactoryService.getFactory().openSession();
    List<ChatMessageVO> chatMessages = ss.selectList("ChatMapper.getChatMessages", roomId);
    ss.close();
    return chatMessages;
  }

  public boolean sendMessage(int roomId, int senderId, String message) {
    SqlSession ss = FactoryService.getFactory().openSession();
    Map<String, Object> params = new HashMap<>();
    params.put("roomId", roomId);
    params.put("senderId", senderId);
    params.put("message", message);
    ss.insert("ChatMapper.sendMessage", params);
    ss.commit();
    ss.close();
    return true;
  }

  public static int getUnreadMessageCount(int roomId, int userId) {
     SqlSession ss = FactoryService.getFactory().openSession();
     Map<String, Object> params = new HashMap<>();
     params.put("roomId", roomId);
     params.put("userId", userId);
     int cnt = ss.selectOne("ChatMapper.getUnreadMessageCount", params);
     ss.close();
     return cnt;
  }

  public String getLastMessage(int roomId) {
       SqlSession session = FactoryService.getFactory().openSession();
      return session.selectOne("ChatMapper.getLastMessage", roomId);

  }


  public CustomerVO getUserProfile(int userId) {
    SqlSession ss = FactoryService.getFactory().openSession();
    CustomerVO userProfile = ss.selectOne("ChatMapper.getUserInfo", userId);
    ss.close();
    return userProfile;
  }



  public void markMessagesAsRead(int roomId, int userId) {
    SqlSession ss = FactoryService.getFactory().openSession();
    Map<String, Object> params = new HashMap<>();
    params.put("roomId", roomId);
    params.put("sender_id", userId);
    ss.update("ChatMapper.markMessagesAsRead", params);
    ss.commit();
    ss.close();
  }

  public LocalDateTime getLastMessageTime(int roomId) {
    SqlSession ss = FactoryService.getFactory().openSession();

    // DB에서 Timestamp 값 가져오기
    Timestamp lastMessageTimeTs = ss.selectOne("ChatMapper.getLastMessageTime", roomId);

    // 세션 종료
    ss.close();

    // Timestamp가 null이 아니라면 LocalDateTime으로 변환
    return (lastMessageTimeTs != null) ? lastMessageTimeTs.toLocalDateTime() : null;
  }



}
