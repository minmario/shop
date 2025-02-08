package user.action.Snap;

import user.dao.snap.ChatDao;
import user.vo.snap.ChatMessageVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint("/chatSocket") // WebSocket 엔드포인트 정의
public class ChatWebSocketServer {

  // 현재 연결된 사용자 목록 (세션 저장)
  private static ConcurrentHashMap<String, Session> clients = new ConcurrentHashMap<>();
  private static ChatDao chatDao = new ChatDao(); // ChatDao 인스턴스화 (공유 사용)

  @OnOpen
  public void onOpen(Session session, EndpointConfig config) {
    String query = session.getQueryString(); // URL의 쿼리 문자열 가져오기
    Map<String, String> params = parseQueryString(query);

    String userId = params.get("userId");
    if (userId != null) {
      clients.put(userId, session);
      System.out.println("웹소켓 연결됨: " + userId);
    } else {
      System.out.println("userId가 없음, 연결 실패");
      try {
        session.close(new CloseReason(CloseReason.CloseCodes.CANNOT_ACCEPT, "Missing userId"));
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  @OnMessage
  public void onMessage(String message, Session session) throws IOException {
    System.out.println("웹소켓 메시지 수신: " + message);

    // JSON 파싱
    ObjectMapper objectMapper = new ObjectMapper();
    JsonNode jsonNode = objectMapper.readTree(message);

    String roomId = jsonNode.get("roomId").asText();
    String senderId = jsonNode.get("senderId").asText();
    String receiverId = jsonNode.get("receiverId").asText();
    String messageText = jsonNode.get("message").asText();
    String imageUrl = jsonNode.has("imageUrl") ? jsonNode.get("imageUrl").asText() : null;

    // 메시지 저장
    ChatMessageVO chatMessage = new ChatMessageVO();
    chatMessage.setRoomId(Integer.parseInt(roomId));
    chatMessage.setSender_id(Integer.parseInt(senderId));
    chatMessage.setMessage(messageText);
    chatMessage.setImage_url(imageUrl);
    chatDao.sendMessage(chatMessage);

    // 상대방에게 메시지 전송
    Session receiverSession = clients.get(receiverId);
    if (receiverSession != null && receiverSession.isOpen()) {
      receiverSession.getBasicRemote().sendText(message);
    }
  }

  @OnClose
  public void onClose(Session session) {
    clients.values().remove(session);
    System.out.println("웹소켓 연결 종료됨");
  }

  @OnError
  public void onError(Session session, Throwable throwable) {
    System.err.println("웹소켓 오류 발생: " + throwable.getMessage());
    throwable.printStackTrace();
  }

  // 쿼리 문자열 파싱 메서드
  private Map<String, String> parseQueryString(String query) {
    Map<String, String> params = new HashMap<>();
    if (query == null || query.isEmpty()) return params;

    String[] pairs = query.split("&");
    for (String pair : pairs) {
      String[] keyValue = pair.split("=");
      if (keyValue.length == 2) {
        params.put(keyValue[0], keyValue[1]);
      }
    }
    return params;
  }
}
