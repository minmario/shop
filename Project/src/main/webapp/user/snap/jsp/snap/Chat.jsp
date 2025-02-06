<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>코디 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="/user/snap/css/Snap/mypage.css">
</head>

<body>
<%--<jsp:include page="../layout/header.jsp"></jsp:include>--%>

<div class="container-fluid mt-4">
    <div class="row">
        <!-- 왼쪽 메뉴바 -->
        <div class="col-md-2 border-end position-fixed" style="height: 100vh;">
            <jsp:include page="/user/snap/jsp/layout/left.jsp"></jsp:include>
        </div>

        <!-- 콘텐츠 영역 -->
        <div class="col-md-10 offset-md-2">
            <!-- 필터 상단 -->
            <div class="container-fluid">
                <div class="row">
                    <!-- ✅ 왼쪽 사이드바 (내 프로필 + 채팅 목록) -->
                    <div class="col-md-3 border-end p-3" style="height: 100vh; overflow-y: auto;">
                        <!-- 내 프로필 -->
                        <div class="d-flex align-items-center mb-4">
                            <img src="${myInfo.profile_image}" alt="Profile" class="rounded-circle" style="width: 50px; height: 50px;">
                            <span class="ms-2 fw-bold">${myInfo.nickname}</span>
                        </div>


                        <!-- 채팅방 목록 -->
                        <ul class="list-group">
                            <c:forEach var="room" items="${chatRooms}">
                                <li class="list-group-item d-flex justify-content-between align-items-center chat-room"
                                    data-room-id="${room.id}">
                                    <div class="d-flex align-items-center">
                                        <img src="${room.otherUserProfileImage}" alt="Profile" class="rounded-circle" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <span class="fw-bold">${room.otherUserNickname}</span><br>
                                            <span class="text-muted">${room.lastMessage}</span>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <span class="text-muted">${room.lastMessageTime}</span>
                                        <c:if test="${room.unreadCount > 0}">
                                            <span class="badge bg-danger">${room.unreadCount}</span>
                                        </c:if>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>


                    </div>

                    <!--  오른쪽 대화창 -->
                    <div class="col-md-9 p-3">
                        <!-- 대화 상대 정보 -->

                        <!--  상대방 정보 표시할 곳 -->
                        <div class="d-flex align-items-center p-3 border-bottom">
                            <img id="receiverProfileImg" src="" alt="상대방 프로필" class="rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
                            <span class="ms-2"><strong id="receiverNickname"></strong></span>
                        </div>


                        <!-- 채팅 메시지 영역 -->
                        <div id="chat-box" class="border p-3" style="height: 70vh; overflow-y: auto;">
                            <p class="text-muted text-center">대화를 선택하세요</p>
                        </div>

                        <!-- 메시지 입력 -->
                        <div class="d-flex mt-3">
                            <input type="text" id="messageInput" class="form-control" placeholder="메시지를 입력하세요...">
                            <button id="sendMessageBtn" class="btn btn-primary ms-2">전송</button>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
<jsp:include page="/user/snap/jsp/snap/snapModal.jsp"></jsp:include>
<script src="/JS/snapModal.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    let currentRoomId = '<%= request.getAttribute("selectedRoomId") %>';
    const selectedReceiverId = '<%= request.getAttribute("selectedReceiverId") %>';
    const messageInput = document.getElementById("messageInput");
    const sendMessageBtn = document.getElementById("sendMessageBtn");
    const chatBox = document.getElementById("chat-box");
    let messageInterval;
    // JSP에서 받아온 사용자 정보를 JavaScript 변수로 저장
    const currentUserId = '<%= session.getAttribute("cus_id") %>';


    if (currentRoomId && currentRoomId !== "null") {

      loadChatMessages(currentRoomId);

      // 자동으로 상대방 프로필 & 닉네임 업데이트
      document.querySelectorAll('.chat-room').forEach(room => {
        if (room.getAttribute("data-room-id") === currentRoomId) {
          room.classList.add('active');
          document.querySelector('#receiverProfileImg').src = room.getAttribute("data-profile");
          document.querySelector('#receiverNickname').textContent = room.getAttribute("data-nickname");
        }
      });
    }




    // 채팅방 클릭 이벤트 처리
    document.querySelectorAll('.chat-room').forEach(room => {
      room.addEventListener('click', function() {

        if (messageInterval) {
          clearInterval(messageInterval);
        }



        currentRoomId = this.dataset.roomId;
        const userId = this.dataset.userId;


        const profileImage = this.dataset.profile;
        const nickname = this.dataset.nickname;


        document.querySelector('#receiverProfileImg').src = profileImage;
        document.querySelector('#receiverNickname').textContent = nickname;



        // 선택된 채팅방 스타일 변경
        document.querySelectorAll('.chat-room').forEach(r => r.classList.remove('active'));
        this.classList.add('active');

        loadChatMessages(currentRoomId);

        messageInterval = setInterval(() => {
          loadChatMessages(currentRoomId);
        }, 2000);

      });
    });

    // 채팅 메시지 불러오기
    function loadChatMessages(roomId) {
      if (!roomId) return;

      fetch("/Controller?type=chatRoom&roomId=" + roomId)
          .then(response => {
            if (!response.ok) throw new Error('서버 응답 오류');
            return response.json();
          })
          .then(messages => {
            chatBox.innerHTML = '';
            let lastDate = ''; // 날짜 중복 방지용 변수

            messages.forEach((msg, index) => {
              let isMyMessage = parseInt(msg.sender_id) === parseInt(currentUserId);


              let messageDate = new Date(msg.created_at);
              let options = { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
              let formattedDate = messageDate.toLocaleDateString('ko-KR', options);


              let timeOptions = { hour: '2-digit', minute: '2-digit', hour12: true };
              let formattedTime = messageDate.toLocaleTimeString('ko-KR', timeOptions);


              if (formattedDate !== lastDate) {
                let dateHTML =
                    '<div class="text-center my-3 text-muted fw-bold">' +
                    formattedDate +
                    '</div>';
                chatBox.insertAdjacentHTML('beforeend', dateHTML);
                lastDate = formattedDate;
              }


              let messageHTML =
                  '<div class="d-flex ' + (isMyMessage ? 'justify-content-end' : 'justify-content-start') + ' align-items-end mb-2">' +
                  (isMyMessage
                      ? '<div class="small text-muted me-2">' + formattedTime + '</div>'
                      : '') +
                  '<div class="p-2 rounded ' + (isMyMessage ? 'bg-warning text-dark' : 'bg-light') + '" style="max-width: 60%; border-radius: 15px;">' +
                  msg.message +
                  '</div>' +
                  (!isMyMessage
                      ? '<div class="small text-muted ms-2">' + formattedTime + '</div>'
                      : '') +
                  '</div>';

              chatBox.insertAdjacentHTML('beforeend', messageHTML);
            });

            chatBox.scrollTop = chatBox.scrollHeight;
          })
          .catch(error => {
            console.error('메시지 로딩 오류:', error);
            chatBox.innerHTML = '<p class="text- text-center">채팅방을 선택해주세요.</p>';
          });
    }

    // 메시지 전송
    function sendMessage() {
      if (!currentRoomId) {
        alert('채팅방을 선택해주세요.');
        return;
      }

      const message = messageInput.value.trim();
      if (!message) return;

      console.log(" 전송하는 채팅방 ID (currentRoomId):", currentRoomId);
      console.log(" 현재 사용자 ID (currentUserId):", currentUserId);
      console.log(message)

      const messageData = {
        roomId: currentRoomId,
        message: message,
        senderId: currentUserId,
        timestamp: new Date().toISOString()
      };

      console.log(" 전송할 데이터:", messageData);

      fetch('/Controller?type=chatSend', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(messageData)
      })
          .then(response => {
            if (!response.ok) throw new Error('메시지 전송 실패');
            return response.json();
          })
          .then(data => {
            console.log(" 서버 응답 데이터:", data);
            if (data.success) {
              messageInput.value = '';
              loadChatMessages(currentRoomId);
            } else {
              throw new Error(data.message || '메시지 전송 실패');
            }
          })
          .catch(error => {
            console.error('전송 오류:', error);
            alert('메시지 전송에 실패했습니다. 다시 시도해주세요.');
          });
    }

    // 이벤트 리스너 등록
    sendMessageBtn.addEventListener('click', sendMessage);
    messageInput.addEventListener('keypress', function(e) {
      if (e.key === 'Enter') {
        e.preventDefault();
        sendMessage();
      }
    });

    // 주기적으로 메시지 업데이트
    if (currentRoomId) {
      setInterval(() => loadChatMessages(currentRoomId), 2000);
    }
  });
</script>


</body>
</html>
