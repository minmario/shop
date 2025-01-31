package user.vo;

import java.util.Date;

public class ChatMessageVO {
  private int id;
  private int roomId;
  private int sender_id;  // ✅ 정확한 명칭으로 변경
  private String senderNickname;
  private String senderProfileImage;
  private String message;
  private Date created_at; // ✅ 정확한 명칭으로 변경
  private boolean isRead;

  public ChatMessageVO() {}

  public ChatMessageVO(int id, int roomId, int sender_id, String message, Date created_at, boolean isRead) {
    this.id = id;
    this.roomId = roomId;
    this.sender_id = sender_id;
    this.message = message;
    this.created_at = created_at;
    this.isRead = isRead;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getRoomId() {
    return roomId;
  }

  public void setRoomId(int roomId) {
    this.roomId = roomId;
  }

  public int getSender_id() {  // ✅ Getter 수정
    return sender_id;
  }

  public void setSender_id(int sender_id) {  // ✅ Setter 수정
    this.sender_id = sender_id;
  }

  public String getSenderNickname() {
    return senderNickname;
  }

  public void setSenderNickname(String senderNickname) {
    this.senderNickname = senderNickname;
  }

  public String getSenderProfileImage() {
    return senderProfileImage;
  }

  public void setSenderProfileImage(String senderProfileImage) {
    this.senderProfileImage = senderProfileImage;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public Date getCreated_at() {  // ✅ Getter 수정
    return created_at;
  }

  public void setCreated_at(Date created_at) {  // ✅ Setter 수정
    this.created_at = created_at;
  }

  public boolean isRead() {
    return isRead;
  }

  public void setRead(boolean isRead) {
    this.isRead = isRead;
  }
}
