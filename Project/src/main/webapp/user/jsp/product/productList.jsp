<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${requestScope ne null}">
    <c:forEach var="item" items="${requestScope.products}">
        <div class="product-item" onclick="location.href='Controller?type=productDetails'">
            <img src="${fn:split(item.prod_image, ',')[0]}" alt="상품 이미지" class="product-image">
            <div class="product-info">
                <p class="product-brand"><strong>${item.brand}</strong></p>
                <p class="product-name">${item.name}</p>
                <p class="product-price">
                    <del>${item.price}</del>
                    <strong>${item.saled_price}</strong>
                </p>
                <div class="product-rating">
                <span class="stars">
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <span class="star-count">137</span>
                </span>
                </div>
                <div class="product-likes">
                    <i class="bi bi-heart-fill"></i>
                    <span class="like-count">100</span>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>
