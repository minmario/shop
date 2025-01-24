<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div>
        <button type="button" class="btn btn-outline-primary" onclick="location.href='Controller?type=writeInquiry'">문의 등록</button>
    </div>
</div>
<div class="inquiry-container">
    <c:if test="${requestScope.alllist eq null}">
        <div class="inquiry">
            <span>1:1문의 내역이 없습니다.</span>
        </div>
    </c:if>
    <c:if test="${requestScope.alllist ne null}">
        <c:forEach var="item" items="${requestScope.alllist}">
            <div class="inquiry">
                <div class="question">
                    <p><strong>Q</strong> No.${item.title}</p>
                    <p onclick="toggleText(this)" data-full-text="${item.content}">${item.content}...[더보기]</p>
                    <p class="date">${item.write_date}</p>
                </div>
                <div class="answer">
                    <c:choose>
                        <c:when test="${item.s_name ne null and item.r_content ne null}">
                            <p><strong>A</strong>${item.s_name}</p>
                            <p>${item.r_content}</p>
                            <p class="date">2023.09.27 17:51</p>
                        </c:when>
                        <c:otherwise>
                            <p><strong>A</strong>답변자 없음</p>
                            <p>아직 답변이 등록되지 않았습니다.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>