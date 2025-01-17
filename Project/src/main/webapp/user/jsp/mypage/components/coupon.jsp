<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="coupon-section">
    <div class="coupon-header">
        <span class="coupon-title">쿠폰 목록</span>
    </div>
    <div class="coupon-sort">
        <select class="form-select coupon-sort-options">
            <option>최신순</option>
            <option>할인순</option>
        </select>
    </div>
</div>
<table id="coupon-table" class="table">
    <thead>
    <tr>
        <th>번호</th>
        <th>할인율</th>
        <th>쿠폰명</th>
        <th>만료일</th>
        <th>적용 상품</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="cnt" value="5"/>
    <c:forEach begin="1" end="${cnt}" varStatus="st">
        <tr>
            <td>${st.index}</td>
            <td>${st.index * 3}%</td>
            <td>${st.index}월 무신사 회원 정기 쿠폰</td>
            <td>2025-01-${st.index + 5}까지</td>
            <td>
                <a href="">적용 상품</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<nav aria-label="Page navigation" class="navigation">
    <ul class="pagination">
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>