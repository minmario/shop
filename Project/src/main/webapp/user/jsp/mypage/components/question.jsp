<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="question-section">
    <div class="question-header">
        <div class="question-title">상품 문의 내역</div>
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
<div class="question-container">
    <div class="inquiry">
        <div class="question">
            <p><strong>Q</strong> 배송</p>
            <p>언제 배송되나요?<br/>안녕하세요.<br/>해당 제품을 구매했는데 배송이 언제쯤 되는지 알 수 있을까요?</p>
            <p class="date">2022-05-17</p>
        </div>
        <div class="answer">
            <p><strong>A</strong> 라퍼지스토어 담당자</p>
            <p>안녕하세요 고객님 라퍼지스토어입니다.<br/>
                상품 주문해주시면 평일 1~2일내로 출고되는 상품으로<br/>
                월요일 주문건은 화~수요일 중으로 출고 예정입니다~!<br/>
                고객님 주문건 금일 출고 예정 확인됩니다.<br/>
                운송장은 저녁에 입력등록되니 참고 부탁드립니다.<br/>
                감사합니다.</p>
        </div>
        <div class="product-info">
            <a href="#" class="product-link">
                <img src="./user/images/product7.jpg" alt="상품 이미지" class="product-image">
                <div class="product-details">
                    <p><strong>[라퍼지스토어]</strong></p>
                    <p class="product-name">헤비 코튼 오버 럭비 맨투맨_Melange Gray</p>
                </div>
            </a>
        </div>
    </div>
    <div class="inquiry">
        <div class="question">
            <p><strong>Q</strong> 배송</p>
            <p>언제 배송되나요?<br/>안녕하세요.<br/>해당 제품을 구매했는데 배송이 언제쯤 되는지 알 수 있을까요?</p>
            <p class="date">2022-05-17</p>
        </div>
        <div class="answer">
            <p><strong>A</strong> 라퍼지스토어 담당자</p>
            <p>안녕하세요 고객님 라퍼지스토어입니다.<br/>
                상품 주문해주시면 평일 1~2일내로 출고되는 상품으로<br/>
                월요일 주문건은 화~수요일 중으로 출고 예정입니다~!<br/>
                고객님 주문건 금일 출고 예정 확인됩니다.<br/>
                운송장은 저녁에 입력등록되니 참고 부탁드립니다.<br/>
                감사합니다.</p>
        </div>
        <div class="product-info">
            <a href="#" class="product-link">
                <img src="./user/images/product4.jpg" alt="상품 이미지" class="product-image">
                <div class="product-details">
                    <p><strong>[라퍼지스토어]</strong></p>
                    <p class="product-name">헤비 코튼 오버 럭비 맨투맨_Melange Gray</p>
                </div>
            </a>
        </div>
    </div>
</div>