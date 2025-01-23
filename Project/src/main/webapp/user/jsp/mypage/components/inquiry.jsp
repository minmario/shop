<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="./user/js/mypage/components/inquiry.js"></script>
<div class="inquiry-section">
    <div class="inquiry-header">
        <div class="inquiry-title">1:1문의 내역</div>
    </div>
</div>
<div class="search-container">
    <div class="search-bar">
        <label for="status">처리 상태</label>
        <select class="form-select" id="status" name="status">
            <option value="all">전체 보기</option>
            <option value="">답변 대기</option>
            <option value="">답변 확인 중</option>
            <option value="">답변 완료</option>
        </select>
        <label for="date-range">기간 조회</label>
        <select class="form-select" id="date-range" name="date-range">
            <option value="all">전체 시기</option>
            <option value="1-week">1주일</option>
            <option value="1-month">1개월</option>
            <option value="3-months">3개월</option>
            <option value="custom">기간 설정</option>
        </select>
        <div class="date-picker" id="custom-date-picker">
            <input type="date" class="form-control" id="start-date" name="start-date"> ~
            <input type="date" class="form-control" id="end-date" name="end-date">
        </div>
        <button type="button" class="btn btn-outline-primary search-button">검색</button>
    </div>
</div>
<div class="inquiry-container">
    <div class="inquiry">
        <div class="question">
            <p><strong>Q</strong> No. 202109051105570001</p>
            <p onclick="toggleText(this)" data-full-text="안녕하세요. 예약 배송으로 9월 1일 주문한 상품에 대해 문의드립니다. 배송 지연에 대해 알고 싶습니다.">안녕하세요. 예약 배송으로 9월 1일 주문한 상품에 대... [더보기]</p>
            <p class="date">2021.09.24 11:13</p>
        </div>
        <div class="answer">
            <p><strong>A</strong> 무신사 담당자</p>
            <p>안녕하세요.<br>
                먼저, 이용에 혼동을 드려 죄송합니다.<br>
                고객님께서 구매 확정을 하지 않으시더라도 출고 완료 후 9일이 지나면 자동으로 구매확정됩니다.<br>
                일부 지역 파업, 물량 증가(특수 기간) 등의 사유로 인하여 배송이 지연되면서 상품 실수령 전 시스템 상 자동으로 구매 확정 처리가 될 수 있습니다.<br>
                번거로우시겠지만, 상품 실수령 후 7일 이내로 희망하시는 처리 방안과 함께 문의하시면 확인 후 접수 도와드리겠습니다.<br>
                이용에 불편을 드려 죄송합니다. 감사합니다.</p>
            <p class="date">2023.09.27 17:51</p>
        </div>
    </div>
    <div class="inquiry">
        <div class="question">
            <p><strong>Q</strong> No. 202109051105570001</p>
            <p onclick="toggleText(this)" data-full-text="안녕하세요. 예약 배송으로 9월 1일 주문한 상품에 대해 문의드립니다. 배송 지연에 대해 알고 싶습니다.">안녕하세요. 예약 배송으로 9월 1일 주문한 상품에 대... [더보기]</p>
            <p class="date">2021.09.24 11:13</p>
        </div>
        <div class="answer">
            <p><strong>A</strong> 무신사 담당자</p>
            <p>안녕하세요.<br>
                먼저, 이용에 혼동을 드려 죄송합니다.<br>
                고객님께서 구매 확정을 하지 않으시더라도 출고 완료 후 9일이 지나면 자동으로 구매확정됩니다.<br>
                일부 지역 파업, 물량 증가(특수 기간) 등의 사유로 인하여 배송이 지연되면서 상품 실수령 전 시스템 상 자동으로 구매 확정 처리가 될 수 있습니다.<br>
                번거로우시겠지만, 상품 실수령 후 7일 이내로 희망하시는 처리 방안과 함께 문의하시면 확인 후 접수 도와드리겠습니다.<br>
                이용에 불편을 드려 죄송합니다. 감사합니다.</p>
            <p class="date">2021.09.27 17:51</p>
        </div>
    </div>
</div>