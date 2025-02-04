package user.dao.snap;

import org.apache.ibatis.session.SqlSession;
import service.FactoryService;
import user.vo.snap.ChatRoomVO;
import user.vo.snap.ChatMessageVO;
import user.vo.snap.CustomerVO;

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

  public CustomerVO getUserProfile(int userId) {
    SqlSession ss = FactoryService.getFactory().openSession();
    CustomerVO userProfile = ss.selectOne("ChatMapper.getUserInfo", userId);
    ss.close();
    return userProfile;
  }
}
