<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="coupon-section">
    <div class="coupon-header">
        <span class="coupon-title">쿠폰 목록</span>
    </div>
</div>
<div class="coupon-search">
    <input type="text" class="form-control search-input" placeholder="브랜드, 쿠폰명으로 검색해보세요.">
</div>
<div class="coupon-controls">
    <div class="coupon-count">전체 100개</div>
    <div class="coupon-sort">
        <select class="form-select sort-select">
            <option value="latest">최신순</option>
            <option value="discount">할인순</option>
        </select>
    </div>
</div>
<div class="coupon-list">
    <div class="coupon-item">
        <div class="coupon-discount">20% <span class="discount-label">브랜드</span></div>
        <div class="coupon-title">내셔널지오그래픽 20% 특별 쿠폰</div>
        <div class="coupon-expiry">오늘 만료</div>
        <div class="coupon-action">
            <a href="#" class="apply-btn">적용상품</a>
        </div>
    </div>
    <div class="coupon-item">
        <div class="coupon-discount">15%</div>
        <div class="coupon-title">[kids] 책가방 페스티벌 15% 쿠폰</div>
        <div class="coupon-expiry">2025.01.27까지</div>
        <div class="coupon-action">
            <a href="#" class="apply-btn">적용상품</a>
        </div>
    </div>
    <div class="coupon-item">
        <div class="coupon-discount">23만원</div>
        <div class="coupon-title">삼성전자 갤럭시북5 특별 쿠폰</div>
        <div class="coupon-expiry">2025.02.28까지</div>
        <div class="coupon-action">
            <a href="#" class="apply-btn">적용상품</a>
        </div>
    </div>
</div>
