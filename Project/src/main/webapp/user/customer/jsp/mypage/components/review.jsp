<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="earnings-section">
    <span class="earnings-title">후기</span>
</div>

<div class="earnings-container">
    <div class="earnings-content">
        <c:if test="${requestScope.list eq null}">
            <div class="product-item">
                <span>구매확정 주문 내역이 없습니다.</span>
            </div>
        </c:if>
        <c:if test="${requestScope.list ne null}">
            <c:forEach var="item" items="${requestScope.list}">
                <div class="product-item">
                    <img src="${fn:split(item.prod_image, ',')[0]}" alt="상품 이미지" class="product-img">
                    <div class="product-info-details">
                        <p class="item-name">${item.brand}</p>
                        <p class="item-description">${item.prod_name}</p>
                        <p class="item-size">${item.option_name} / ${item.count}개</p>
                        <p class="item-purchase-confirm-date">${item.purchase_confirm_date} 구매확정</p>
                    </div>
                </div>
                <div class="action-buttons">
                    <button class="btn btn-outline-secondary custom-btn" onclick="location.href='Controller?type=writeReview&action=select&prod_no=${item.prod_no}&order_code=${item.order_code}'">후기 작성</button>
                    <button class="btn btn-outline-secondary custom-btn">스타일 후기 작성</button>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>