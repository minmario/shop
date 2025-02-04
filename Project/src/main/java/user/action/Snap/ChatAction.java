package user.action.Snap;

import user.action.Action;
import user.dao.snap.ChatDao;
import user.vo.snap.ChatRoomVO;
import user.vo.snap.CustomerVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ChatAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {
    int userId = (int) request.getSession().getAttribute("cus_id"); // 현재 로그인한 유저 ID
    int receiverId = request.getParameter("receiverId") != null ? Integer.parseInt(request.getParameter("receiverId")) : -1;
    System.out.println("receiverId:" + receiverId);
    ChatDao chatDao = new ChatDao();

    // 채팅방이 있는지 확인
    ChatRoomVO chatRoom = null;
    if (receiverId > 0) {
      chatRoom = chatDao.getChatRoom(userId, receiverId);
      if (chatRoom == null) {
        // 채팅방이 없으면 생성
        int newRoomId = chatDao.createChatRoom(userId, receiverId);
        chatRoom = chatDao.getChatRoom(userId, receiverId);
      }
    }

    // 채팅방 목록 조회
    List<ChatRoomVO> chatRooms = chatDao.getChatRooms(userId);
    request.setAttribute("chatRooms", chatRooms);

    // 내 정보 조회 (프로필, 닉네임)
    CustomerVO myInfo = chatDao.getUserProfile(userId);
    request.setAttribute("myInfo", myInfo);

    // 채팅방이 새로 생성되었거나 기존 채팅방이 있을 경우 해당 방을 자동으로 열기
    if (chatRoom != null) {
      request.setAttribute("selectedRoomId", chatRoom.getId());
      request.setAttribute("selectedReceiverId", receiverId);
    }

    return "/user/jsp/snap/Chat.jsp";
  }
}
