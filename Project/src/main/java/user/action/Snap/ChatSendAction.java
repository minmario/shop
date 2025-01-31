package user.action.Snap;

import user.action.Action;
import user.dao.snap.ChatDao;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

public class ChatSendAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {
    JsonObject responseJson = new JsonObject();
    PrintWriter out = null;

    try {
      // ✅ 요청 데이터 UTF-8 인코딩 설정
      request.setCharacterEncoding("UTF-8");
      response.setContentType("application/json; charset=UTF-8");
      response.setCharacterEncoding("UTF-8");

      // ✅ JSON 데이터 읽기
      BufferedReader reader = request.getReader();
      StringBuilder jsonBuffer = new StringBuilder();
      String line;
      while ((line = reader.readLine()) != null) {
        jsonBuffer.append(line);
      }
      reader.close();

      // ✅ JSON 데이터 파싱
      JsonObject jsonObject = JsonParser.parseString(jsonBuffer.toString()).getAsJsonObject();

      int roomId = jsonObject.get("roomId").getAsInt();
      int senderId = jsonObject.get("senderId").getAsInt();
      String message = jsonObject.get("message").getAsString();

      System.out.println(" roomId: " + roomId);
      System.out.println(" senderId: " + senderId);
      System.out.println(" 요청된 데이터 - message: " + message);

      // ✅ DB 저장
      ChatDao chatDao = new ChatDao();
      boolean success = chatDao.sendMessage(roomId, senderId, message);

      // ✅ JSON 응답 반환
      responseJson.addProperty("success", success);
      responseJson.addProperty("message", success ? "메시지 전송 성공" : "메시지 전송 실패");

    } catch (Exception e) {
      e.printStackTrace();
      responseJson.addProperty("success", false);
      responseJson.addProperty("message", "서버 오류 발생: " + e.getMessage());
    }

    try {
      out = response.getWriter();
      out.print(responseJson.toString());
      out.flush();
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (out != null) out.close();
    }

    return null;
  }
}
