<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="delivery-section">
    <div class="delivery-header">
        <div class="delivery-title">배송지 목록</div>
        <button type="button" class="btn btn-outline-primary add-address-button" data-toggle="modal" data-target="#addrModal">배송지 추가</button>
    </div>
</div>
<c:if test="${requestScope.dvo eq null}">
    <div>
        <span>입력된 정보가 없습니다.</span>
    </div>
</c:if>
<c:if test="${requestScope.dvo ne null}">
    <c:set var="dvo" value="${requestScope.dvo}"/>
    <div class="custom-addr">
        <div class="wrap-addrList">
            <c:if test="${dvo.is_default = 1}">
                <div class="address-box">
                    <input type="radio" id="default-address" name="address" checked>
                    <label for="default-address">
                        <div class="address-details">
                            <p class="name">${dvo.name} <span class="default">${dvo.is_default == '1' ? '기본 배송지' : ''}</span></p>
                            <p class="address">(${dvo.pos_code})&nbsp;${dvo.address}</p>
                            <p class="phone">${dvo.phone}</p>
                            <p class="request">${dvo.request}</p>
                            <button type="button" class="btn btn-outline-primary">수정</button>
                            <button type="button" class="btn btn-outline-danger">삭제</button>
                        </div>
                    </label>
                </div>
            </c:if>
            <c:if test="${dvo.is_default = 0}">
            <c:forEach var="dvo" items="${dvo.list}">
                <div class="address-box">
                    <input type="radio" id="etc-address" name="address">
                    <label for="etc-address">
                        <div class="address-details">
                            <p class="name">홍길동</p>
                            <p class="address">서울특별시 동작구 보라매로5길 15<br>1층 108호</p>
                            <p class="phone">010-1234-1234</p>
                            <button type="button" class="btn btn-outline-primary">수정</button>
                            <button type="button" class="btn btn-outline-danger">삭제</button>
                        </div>
                    </label>
                </div>
            </c:forEach>
            </c:if>
        </div>
    </div>
</c:if>
<div class="delivery-notice">
    <ol>
        <li>배송 주소록은 최대 3개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
        <li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
    </ol>
</div>