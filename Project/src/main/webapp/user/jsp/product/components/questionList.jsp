<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="question-button-container">
    <button type="button" class="btn btn-outline-dark" onclick="location.href='Controller?type=writeQuestion&prod_no=1223344'">
        판매자에게 문의하기
    </button>
</div>
<c:choose>
    <c:when test="${requestScope.questions ne null}">
        <c:forEach var="item" items="${requestScope.questions}">
            <div class="question-item">
                <c:choose>
                    <c:when test="${item.type == '19'}"><div class="question-type">사이즈</div></c:when>
                    <c:when test="${item.type == '20'}"><div class="question-type">배송</div></c:when>
                    <c:when test="${item.type == '21'}"><div class="question-type">재입고</div></c:when>
                    <c:when test="${item.type == '22'}"><div class="question-type">상품상세문의</div></c:when>
                </c:choose>

                <div class="question-header">
                    <c:if test="${item.is_private == '0'}">
                        <span class="question-title">${item.title}</span>
                    </c:if>
                    <c:if test="${item.is_private == '1'}">
                        <i class="bi bi-lock"></i>
                        <span class="question-title">비밀글로 설정된 글입니다.</span>
                    </c:if>
                </div>

                <c:choose>
                    <c:when test="${item.status == '1'}">
                        <div class="question-meta">답변대기 · ${item.c_cus_id} · ${item.write_date}</div>
                    </c:when>
                    <c:when test="${item.status == '2'}">
                        <div class="question-meta">답변확인중 · ${item.c_cus_id} · ${item.write_date}</div>
                    </c:when>
                    <c:when test="${item.status == '3'}">
                        <div class="question-meta">답변완료 · ${item.c_cus_id} · ${item.write_date}</div>
                    </c:when>
                </c:choose>

                <c:choose>
                    <c:when test="${item.status != '3'}">
                        <div class="question-content">
                            <p class="answer">답변이 등록되지 않았습니다.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="question-content">
                            <p class="question">${item.content}</p>
                            <div class="answer">
                                <strong>A. ${item.brand}</strong>
                                <p>${item.r_content}</p>
                                <span class="answer-date">${item.r_write_date}</span>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <div class="question-item">
            <span>해당 상품의 문의 내역이 없습니다.</span>
        </div>
    </c:otherwise>
</c:choose>