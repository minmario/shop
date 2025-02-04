package user.vo.snap;

import java.util.Date;

public class ChatRoomVO {
  private int id;
  private int user1Id;
  private int user2Id;
  private Date createdAt;
  private String lastMessage;
  private Date lastMessageTime;
  private String otherUserNickname;
  private String otherUserProfileImage;

  public ChatRoomVO() {}

  public ChatRoomVO(int id, int user1Id, int user2Id, Date createdAt) {
    this.id = id;
    this.user1Id = user1Id;
    this.user2Id = user2Id;
    this.createdAt = createdAt;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getUser1Id() {
    return user1Id;
  }

  public void setUser1Id(int user1Id) {
    this.user1Id = user1Id;
  }

  public int getUser2Id() {
    return user2Id;
  }

  public void setUser2Id(int user2Id) {
    this.user2Id = user2Id;
  }

  public Date getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(Date createdAt) {
    this.createdAt = createdAt;
  }

  public String getLastMessage() {
    return lastMessage;
  }

  public void setLastMessage(String lastMessage) {
    this.lastMessage = lastMessage;
  }

  public Date getLastMessageTime() {
    return lastMessageTime;
  }

  public void setLastMessageTime(Date lastMessageTime) {
    this.lastMessageTime = lastMessageTime;
  }

  public String getOtherUserNickname() {
    return otherUserNickname;
  }

  public void setOtherUserNickname(String otherUserNickname) {
    this.otherUserNickname = otherUserNickname;
  }

  public String getOtherUserProfileImage() {
    return otherUserProfileImage;
  }

  public void setOtherUserProfileImage(String otherUserProfileImage) {
    this.otherUserProfileImage = otherUserProfileImage;
  }
}
