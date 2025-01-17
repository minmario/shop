<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="review-section">
    <div class="review-header">
        <span class="review-title">상품평 작성</span>
    </div>
    <div class="review-buttons">
        <div class="btn-group" role="group">
            <input type="radio" class="btn-check" name="btnradioreview" id="btnradio10" autocomplete="off" checked>
            <label class="btn btn-outline-secondary" for="btnradio10">후기 내역</label>
            <input type="radio" class="btn-check" name="btnradioreview" id="btnradio11" autocomplete="off">
            <label class="btn btn-outline-secondary" for="btnradio11">후기 작성</label>
        </div>
    </div>
</div>
<table id="review-table" class="table">
    <thead>
        <tr>
            <th>번호</th>
            <th>상품정보</th>
            <th>구매일자</th>
            <th>일반 후기</th>
            <th>스타일 후기</th>
        </tr>
    </thead>
    <tbody>
        <c:set var="cnt" value="2"/>
        <c:forEach begin="1" end="${cnt}" varStatus="st">
            <tr>
                <td class="order-id">${st.index}</td>
                <td class="product-info">
                    <div class="prod_info">
                        <div class="prod_img">
                            <img src="./user/images/product1.jpg"/>
                        </div>
                        <div class="prod_details">
                            <div class="prod_brand">
                                [페이퍼리즘]
                            </div>
                            <div class="prod_name">
                                ZIGGY LIGHTING 3/4 SLV T-SHIRT
                            </div>
                            <div class="prod_color">
                                [GRAY]
                            </div>
                            <div class="prod_option">
                                옵션&nbsp;:&nbsp;L&nbsp;/&nbsp;수량&nbsp;:&nbsp;${st.index}
                            </div>
                        </div>
                    </div>
                </td>
                <td class="purchase-date">2025-01-14</td>
                <td class="general-review">
                    <button type="button" class="btn btn-outline-secondary">작성하기</button>
                </td>
                <td class="style-review">
                    <button type="button" class="btn btn-outline-secondary">작성하기</button>
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
        <li class="page-item">
            <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>
