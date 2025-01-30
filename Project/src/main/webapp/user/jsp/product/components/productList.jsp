<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${requestScope.products ne null}">
    <c:forEach var="item" items="${requestScope.products}">
        <div class="product-item" onclick="location.href='Controller?type=productDetails&action=select&prod_no=${item.id}'">
            <img src="${fn:split(item.prod_image, ',')[0]}" alt="상품 이미지" class="product-image">
            <div class="product-info">
                <p class="product-brand"><strong>${item.brand}</strong></p>
                <p class="product-name">${item.name}</p>
                <p class="product-price">
                    <del><fmt:formatNumber value="${item.price}"/>원</del>
                    <strong><fmt:formatNumber value="${item.saled_price}"/>원</strong>
                </p>
                <div class="product-reviews">
                    <div class="product-rating">
                        <span class="stars">
                            <c:if test="${item.avg_score ne null}">
                                <c:choose>
                                    <c:when test="${item.avg_score >= 4.5}">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                    </c:when>
                                    <c:when test="${item.avg_score >= 4.0}">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star"></i>
                                    </c:when>
                                    <c:when test="${item.avg_score >= 3.5}">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i>
                                        <i class="bi bi-star"></i>
                                    </c:when>
                                    <c:when test="${item.avg_score >= 3.0}">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                    </c:when>
                                    <c:when test="${item.avg_score >= 2.5}">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                    </c:when>
                                    <c:when test="${item.avg_score >= 2.0}">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                    </c:when>
                                    <c:when test="${item.avg_score >= 1.5}">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                    </c:when>
                                    <c:when test="${item.avg_score >= 1.0}">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                        <i class="bi bi-star"></i>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                            <span class="star-count">
                                <fmt:formatNumber value="${item.review_count}"/>
                            </span>
                        </span>
                    </div>
                </div>
                <div class="product-likes">
                    <i class="bi bi-heart-fill"></i>
                    <span class="like-count">
                        <fmt:formatNumber value="${item.like_count}"/>
                    </span>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>
