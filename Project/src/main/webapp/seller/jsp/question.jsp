<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>문의사항 게시판</title>
  <jsp:include page="./layout/header.jsp"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .question-item {
      margin-bottom: 20px;
    }
    .answer-section {
      display: none;
      margin-top: 20px;
    }
    .question-item .title {
      font-weight: bold;
    }
    .question-item .details {
      margin-top: 10px;
    }
    .question-item .answer {
      margin-top: 10px;
      border-top: 1px solid #ddd;
      padding-top: 10px;
    }
    .center{
      text-align: center;
    }
    .collapse{
      border-collapse: collapse;
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <h3 class="center">문의사항</h3>
  <hr/>

  <!-- 문의글이 없을 경우 안내 메시지 -->
  <c:if test="${empty questions}">
    <div class="alert alert-warning" role="alert">
      문의글이 없습니다.
    </div>
  </c:if>

  <!-- 문의글 목록 -->
  <div class="list-group">
    <c:forEach var="question" items="${questions}">
      <div class="list-group-item list-group-item-action question-item collapse" data-question-id="${question.id}">
        <div class="title">
          <strong>${question.senderName}</strong> - <span class="text-muted">${question.date}</span>
        </div>
        <div class="subject">
          <strong>${question.subject}</strong>
        </div>
        <div class="details">${question.content}</div>

        <!-- 답변 버튼 -->
        <button class="btn btn-primary btn-sm mt-2 view-answer" data-question-id="${question.id}">답변 보기/작성</button>

        <!-- 답변 섹션 (초기에는 숨김) -->
        <div class="answer-section" id="answer-section-${question.id}">
          <h5>답변</h5>
          <textarea class="form-control" id="answer-${question.id}" rows="4" placeholder="답변을 입력하세요..."></textarea>
          <button class="btn btn-success mt-2" onclick="submitAnswer(${question.id})">답변 제출</button>
        </div>

        <!-- 실제 답변 (있는 경우) -->
        <div class="answer">
          <c:if test="${not empty question.answer}">
            <div><strong>판매자의 답변:</strong></div>
            <div>${question.answer}</div>
          </c:if>
        </div>
      </div>
    </c:forEach>
    <div class="list-group-item list-group-item-action question-item" data-question-id="${question.id}">
      <div class="title">
        <strong>vldhtmxk</strong> - <span class="text-muted">2025-01-16</span>
      </div>
      <div>
        <span>상품 명: 반팔티</span>
      </div>
      <div class="subject">
        <strong>옷이 찢어져서 왔어요</strong>
      </div>
      <div class="details">옷을 시켰는데 이렇게 찢어져서 왔네요 환불해주세요</div>
      <!-- 답변 버튼 -->
      <button class="btn btn-primary btn-sm mt-2 view-answer" data-question-id="${question.id}">답변 보기/작성</button>

      <!-- 답변 섹션 (초기에는 숨김) -->
      <div class="answer-section" id="answer-section-${question.id}">
        <h5>답변</h5>
        <textarea class="form-control" id="answer-${question.id}" rows="4" placeholder="답변을 입력하세요..."></textarea>
        <button class="btn btn-success mt-2" onclick="submitAnswer(${question.id})">답변 제출</button>
      </div>

      <div class="answer">
        <c:if test="${not empty question.answer}">
          <div><strong>판매자의 답변:</strong></div>
          <div>${question.answer}</div>
        </c:if>
      </div>
  </div>
    <div class="list-group-item list-group-item-action question-item" data-question-id="${question.id}">
      <div class="title">
        <strong>vldhtmxk</strong> - <span class="text-muted">2025-01-16</span>
      </div>
      <div>
        <span>상품 명: 반팔티</span>
      </div>
      <div class="subject">
        <strong>옷이 찢어져서 왔어요</strong>
      </div>
      <div class="details">옷을 시켰는데 이렇게 찢어져서 왔네요 환불해주세요</div>

      <!-- 실제 답변 (있는 경우) -->
      <div class="answer">

        <div><strong>판매자의 답변:</strong></div>
        <div>찢어진 부분 굉장히 죄송합니다 교환신청 해주시면 교환 해드리겠습니다</div>

      </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  $(document).ready(function(){
    // '답변 보기/작성' 버튼 클릭 시 답변 섹션 표시/숨김
    $(".view-answer").click(function(){
      var questionId = $(this).data("question-id");
      var answerSection = $("#answer-section-" + questionId);

      if(answerSection.is(":visible")) {
        answerSection.hide();
      } else {
        answerSection.show();
      }
    });

    // 답변 제출 시 서버로 데이터 전송
    window.submitAnswer = function(questionId) {
      var answerText = $("#answer-" + questionId).val();

      if(answerText.trim() === "") {
        alert("답변을 입력해주세요.");
        return;
      }

      $.ajax({
        url: 'Controller?type=submitAnswer', // 답변 제출 처리 URL
        type: 'POST',
        data: {
          questionId: questionId,
          answer: answerText
        },
        success: function(response) {
          if(response.success) {
            alert("답변이 제출되었습니다.");
            $("#answer-section-" + questionId).hide();
            location.reload(); // 페이지 새로 고침하여 답변을 반영
          } else {
            alert("답변 제출에 실패했습니다. 다시 시도해주세요.");
          }
        },
        error: function() {
          alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
        }
      });
    }
  });
</script>
</body>
<footer>
  <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>
</html>