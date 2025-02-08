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
<style>
    .chat-meta {
        position: relative;  /* 부모 요소 설정 */
        display: flex;
        flex-direction: column; /* 요소를 세로로 정렬 */
        align-items: center; /* 가운데 정렬 */
    }

    .last-message-time {
        font-size: 12px;
        color: #666;
        margin-bottom: 10px; /* 시간과 배지 간격 조정 */
    }

    .unread-badge {
        position: absolute;
        bottom: -10px;  /* 숫자 뱃지를 아래쪽으로 이동 */
        left: 50%;
        transform: translateX(-50%); /* 가운데 정렬 */
        font-size: 12px;
        font-weight: bold;
        min-width: 20px;
        height: 20px;
        line-height: 18px;
        text-align: center;
        color: white;
        background-color: red;
        border-radius: 50%;
    }
    .unread-message-badge {
        position: absolute;
        top: -5px;
        right: -5px;
        background-color: red;
        color: white;
        font-size: 12px;
        font-weight: bold;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
    }



</style>

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
                                    data-room-id="${room.id}" data-profile="${room.otherUserProfileImage}"
                                    data-nickname="${room.otherUserNickname}">
                                    <div class="d-flex align-items-center">
                                        <img src="${room.otherUserProfileImage}" alt="Profile" class="rounded-circle" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <span class="fw-bold">${room.otherUserNickname}</span><br>
                                            <span class="text-muted">${room.lastMessage}</span>
                                        </div>
                                    </div>
                                    <div class="chat-meta">
                                        <span class="last-message-time">${room.lastMessageTimeStr}</span>
                                        <c:if test="${room.unreadCount > 0}">
                                            <span class="unread-badge">${room.unreadCount}</span>
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
                        <div class="d-flex mt-3 align-items-center">
                            <form id="uploadForm" enctype="multipart/form-data" class="d-flex w-100">
                                <!-- 파일 업로드 아이콘 (기존 클립 모양을 다운로드 아이콘으로 변경) -->
                                <label for="fileInput" class="btn btn-outline-secondary me-2 d-flex align-items-center justify-content-center"
                                       style="width: 40px; height: 40px; padding: 0;">
                                    <i class="bi bi-download" style="font-size: 20px;"></i>
                                </label>

                                <input type="file" id="fileInput" accept="image/*" style="display: none;">

                                <!-- 메시지 입력창 -->
                                <input type="text" id="messageInput" class="form-control me-2" placeholder="메시지를 입력하세요..." style="flex: 1;">

                                <!-- 전송 버튼 -->
                                <button type="button" id="sendMessageBtn" class="btn btn-primary d-flex align-items-center justify-content-center"
                                        style="width: 100px;">
                                    전송
                                </button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>


        </div>
    </div>
</div>

<!-- 이미지 모달 -->
<div id="imageModal" class="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">이미지 보기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body text-center">
                <img id="modalImage" src="" class="img-fluid" style="max-height: 500px; object-fit: contain;">
            </div>
            <div class="modal-footer">
                <a id="downloadImage" href="#" class="btn btn-primary" download>다운로드</a>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
    const fileInput = document.getElementById("fileInput");

    let selectedProfileImage = "";
    let selectedNickname = "";
    let messageInterval;

    const currentUserId = '<%= session.getAttribute("cus_id") %>';



    const userId = currentUserId; // 현재 로그인된 사용자 ID
    const socket = new WebSocket(`ws://localhost:8080/chatSocket?userId=${userId}`);

    socket.onmessage = function(event) {
      const data = JSON.parse(event.data);
      // 메시지를 채팅 UI에 표시하는 로직 추가
      console.log(data);
    };

    function sendMessage(roomId, receiverId, messageText, imageUrl) {
      const message = {
        roomId: roomId,
        senderId: userId,
        receiverId: receiverId,
        message: messageText,
        imageUrl: imageUrl || null
      };
      socket.send(JSON.stringify(message));
    }

    // 이벤트 리스너 등록 (중복 제거)
    sendMessageBtn.addEventListener("click", sendMessage);
    fileInput.addEventListener("change", function() {
      console.log("파일 선택됨: " + fileInput.files[0].name);
    });

    if (currentRoomId && currentRoomId !== "null") {
      loadChatMessages(currentRoomId);

      document.querySelectorAll('.chat-room').forEach(room => {
        if (room.getAttribute("data-room-id") === currentRoomId) {
          room.classList.add('active');
          document.getElementById("receiverProfileImg").src = room.getAttribute("data-profile");
          document.getElementById("receiverNickname").textContent = room.getAttribute("data-nickname");
        }
      });
    }
    document.getElementById("uploadForm").addEventListener("submit", function(e) {
      e.preventDefault(); // 폼 전송 기본 동작 막기 (새로고침 방지)
    });

    // 채팅방 클릭 이벤트 처리
    document.querySelectorAll('.chat-room').forEach(room => {
      room.addEventListener('click', function() {
        if (messageInterval) {
          clearInterval(messageInterval);
        }

        currentRoomId = this.dataset.roomId;
        selectedProfileImage = this.dataset.profile;
        selectedNickname = this.dataset.nickname;

        document.getElementById("receiverProfileImg").src = selectedProfileImage;
        document.getElementById("receiverNickname").textContent = selectedNickname;

        document.querySelectorAll('.chat-room').forEach(r => r.classList.remove('active'));
        this.classList.add('active');

        loadChatMessages(currentRoomId);

        // messageInterval = setInterval(() => {
        //   loadChatMessages(currentRoomId);
        // }, 2000);
      });
    });

    // 채팅 메시지 불러오기
    function loadChatMessages(roomId) {
      if (!roomId) return;

      fetch("/Controller?type=chatRoom&roomId=" + roomId)
          .then(response => response.json())
          .then(messages => {
            chatBox.innerHTML = '';
            let lastDate = '';

            messages.forEach((msg, index) => {
              let isMyMessage = parseInt(msg.sender_id) === parseInt(currentUserId);
              let messageDate = new Date(msg.created_at);
              let formattedDate = messageDate.toLocaleDateString('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' });
              let formattedTime = messageDate.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit', hour12: true });

              let unreadBadge = msg.is_read == 0 ? `<span class="unread-message-badge">1</span>` : '';

              if (formattedDate !== lastDate) {
                chatBox.insertAdjacentHTML('beforeend', `<div class="text-center my-3 text-muted fw-bold">${formattedDate}</div>`);
                lastDate = formattedDate;
              }

              let messageHTML = isMyMessage
                  ? '<div class="d-flex flex-column align-items-end mb-2">' +
                  '<div class="d-flex flex-column align-items-end">' +
                  (msg.image_url
                      ? '<img src="' + msg.image_url + '" class="chat-image rounded mb-1" ' +
                      'style="max-width: 200px; max-height: 250px; object-fit: cover; cursor: pointer;">'
                      : '') +
                  '<div class="d-flex align-items-center">' +
                  '<div class="small text-muted me-2">' +
                  (msg.is_read == 0 ? '<span class="text-warning fw-bold me-1">1</span>' : '') +formattedTime +
                  '</div>' +
                  '<div class="p-2 rounded bg-warning text-dark" style="max-width: 60%; border-radius: 15px;">' +
                  msg.message +
                  '</div>' +
                  '</div>' +
                  '</div>' +
                  '</div>'
                  : '<div class="d-flex align-items-start mb-2">' +
                  '<img src="' + selectedProfileImage + '" class="rounded-circle me-2" ' +
                  'style="width: 40px; height: 40px; object-fit: cover;">' +
                  '<div>' +
                  '<div class="fw-bold text-dark">' + selectedNickname + '</div>' +
                  '<div class="d-flex flex-column">' +
                  (msg.image_url
                      ? '<img src="' + msg.image_url + '" class="chat-image rounded mb-1" ' +
                      'style="max-width: 200px; max-height: 250px; object-fit: cover; cursor: pointer;">'
                      : '') +
                  '<div class="d-flex align-items-center">' +
                  '<div class="p-2 rounded bg-light" style="max-width: 60%; border-radius: 15px;">' +
                  msg.message +
                  '</div>' +
                  '<div class="small text-muted ms-2">' + formattedTime + '</div>' +
                  '</div>' +
                  '</div>' +
                  '</div>' +
                  '</div>';

              chatBox.insertAdjacentHTML('beforeend', messageHTML);




              markMessagesAsRead(roomId);
            });
            // updateChatRoomList(roomId, latestMessage, latestTime);

            chatBox.scrollTop = chatBox.scrollHeight;
          })
          .catch(error => {
            console.error('메시지 로딩 오류:', error);
            chatBox.innerHTML = '<p class="text-muted text-center">채팅방을 선택해주세요.</p>';
          });
    }

    // 채팅방 읽음 처리
    function markMessagesAsRead(roomId) {
      fetch("/Controller?type=markAsRead&roomId=" + roomId, { method: "POST" })
          .then(response => response.json())
          .then(data => {
            if (data.success) {
              console.log("메시지를 읽음 상태로 변경 완료");
              updateUnreadCount(roomId);
            }
          })
          .catch(error => console.error("읽음 상태 업데이트 오류:", error));
    }

    // 채팅 목록에서 숫자 제거
    function updateUnreadCount(roomId) {
      let chatRoomElement = document.querySelector('.chat-room[data-room-id="' + roomId + '"]');
      if (chatRoomElement) {
        let unreadBadge = chatRoomElement.querySelector(".unread-badge");
        if (unreadBadge) {
          unreadBadge.remove();
        }
      }
    }

    // 메시지 전송
    async function sendMessage() {
      if (!currentRoomId) {
        alert('채팅방을 선택해주세요.');
        return;
      }

      const message = messageInput.value.trim();
      let imageUrl = null;



      if (fileInput.files.length > 0) {
        const formData = new FormData();
        formData.append("file", fileInput.files[0]);
         console.log("좋이"+fileInput.files[0].name)
        try {
          let response = await fetch('/Controller?type=uploadImage', {
            method: 'POST', body: formData });
          let data = await response.json();

          if (data.success) {
            imageUrl = data.imageUrl;

          } else {
            alert("이미지 업로드 실패");

            return;
          }
        } catch (error) {
          console.error('이미지 업로드 오류:', error);

          return;
        }
      }

      sendChatMessage(message, imageUrl);
    }

    function sendChatMessage(message, imageUrl) {
      const messageData = {
        roomId: currentRoomId,

        message: message,
        senderId: currentUserId,
        imageUrl: imageUrl
      };

      fetch('/Controller?type=chatSend', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify(messageData)
      })
          .then(response => response.json())
          .then(data => {
            if (data.success) {
              messageInput.value = '';
              fileInput.value = '';
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

  });

  document.addEventListener("DOMContentLoaded", function () {
    const chatBox = document.getElementById("chat-box");

    // 이미지 클릭 이벤트 (모달 띄우기)
    chatBox.addEventListener("click", function (event) {
      if (event.target.tagName === "IMG" && event.target.classList.contains("chat-image")) {
        let imageUrl = event.target.src;
        document.getElementById("modalImage").src = imageUrl;
        document.getElementById("downloadImage").setAttribute("data-url", imageUrl); // 다운로드 버튼에 이미지 URL 저장
        new bootstrap.Modal(document.getElementById("imageModal")).show();
      }
    });

    // 다운로드 버튼 클릭 이벤트
    document.getElementById("downloadImage").addEventListener("click", function() {
      const imageUrl = this.getAttribute("data-url"); // 저장된 이미지 URL 가져오기
      if (!imageUrl) {
        alert("이미지를 찾을 수 없습니다.");
        return;
      }



      // 이미지 다운로드 처리 (fetch -> blob -> 다운로드 실행)
      fetch(imageUrl)
          .then(response => response.blob()) // 이미지 데이터를 Blob으로 변환
          .then(blob => {
            const url = window.URL.createObjectURL(blob); // Blob을 객체 URL로 변환
            const a = document.createElement("a");
            a.style.display = "none";
            a.href = url;
            a.download = imageUrl.split('/').pop(); // 파일 이름 설정
            document.body.appendChild(a);
            a.click(); // 자동으로 클릭하여 다운로드 실행
            window.URL.revokeObjectURL(url); // 다운로드 후 URL 해제
            document.body.removeChild(a); // 요소 제거
          })
          .catch(error => {
            console.error(" 다운로드 오류:", error);
            alert("파일을 다운로드할 수 없습니다.");
          });
    });
  });

  // 웹소켓 연결
  const userId = '<%= session.getAttribute("cus_id") %>';
  const socket = new WebSocket("ws://localhost:8080/chatSocket?userId=" + userId);

  socket.onopen = function(event) {
    console.log("✅ 웹소켓 연결 성공");
  };

  socket.onmessage = function(event) {
    console.log("📩 웹소켓 메시지 수신: ", event.data);
    const msg = JSON.parse(event.data);
    displayMessage(msg);
  };

  socket.onclose = function(event) {
    console.log("❌ 웹소켓 연결 종료");
  };

  // 웹소켓으로 메시지 보내기
  function sendMessage() {
    if (!currentRoomId) {
      alert('채팅방을 선택해주세요.');
      return;
    }

    const message = messageInput.value.trim();
    let imageUrl = null;

    if (fileInput.files.length > 0) {
      const formData = new FormData();
      formData.append("file", fileInput.files[0]);

      fetch('/Controller?type=uploadImage', {
        method: 'POST',
        body: formData
      })
          .then(response => response.json())
          .then(data => {
            if (data.success) {
              imageUrl = data.imageUrl;
              sendWebSocketMessage(message, imageUrl);
            } else {
              alert("이미지 업로드 실패");
            }
          })
          .catch(error => console.error('이미지 업로드 오류:', error));
    } else {
      sendWebSocketMessage(message, null);
    }
  }

  function sendWebSocketMessage(message, imageUrl) {
    const msgData = {
      roomId: currentRoomId,
      senderId: userId,
      message: message,
      imageUrl: imageUrl
    };

    if (socket.readyState === WebSocket.OPEN) {
      socket.send(JSON.stringify(msgData));
    } else {
      console.error("❌ 웹소켓이 닫혀있음");
    }
  }


  // function updateChatRoomList(roomId, message, time) {
  //   let chatRoomElement = document.querySelector('.chat-room[data-room-id="' + roomId + '"]');
  //
  //   if (chatRoomElement) {
  //     let lastMessageElement = chatRoomElement.querySelector(".text-muted");
  //     let lastMessageTimeElement = chatRoomElement.querySelector(".last-message-time");
  //
  //     if (lastMessageElement) {
  //       lastMessageElement.textContent = message;
  //     }
  //     if (lastMessageTimeElement) {
  //       lastMessageTimeElement.textContent = time;
  //     }
  //   }
  // }

</script>


</body>
</html>
