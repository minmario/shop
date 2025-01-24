<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="point-section">
    <div class="point-header">
        <span class="point-title">적립금</span>
    </div>
</div>
<div class="loyalty-points-section">
    <div class="points-list">
        <div class="points-item">
            <div class="points-label text-left">예정 적립금</div>
            <div class="points-value text-right">${sessionScope.upcoming}원</div>
        </div>
        <div class="points-item">
            <div class="points-label text-left">소멸 예정 적립금(30일 이내)</div>
            <div class="points-value text-right">${sessionScope.expireTotal}원</div>
        </div>
    </div>
</div>
<div class="point-tabs">
    <ul class="nav nav-tabs" id="point-nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#" data-target="#table-all" onclick="selectPoint('all')">전체</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-target="#table-earned" onclick="selectPoint('earned')">적립</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-target="#table-used" onclick="selectPoint('used')">사용</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-target="#table-upcoming" onclick="selectPoint('upcoming')">예정</a>
        </li>
    </ul>
</div>
<div id="tables">
    <table id="table-all" class="table" style="display: table;">
        <tbody>
            <c:if test="${sessionScope.points eq null}">
                <tr>
                    <td colspan="3">표시할 포인트 데이터가 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${sessionScope.all ne null}">
            <c:forEach var="item" items="${sessionScope.all}">
                <tr>
                    <td>
                        <div class="custom-points-item">
                            <div class="custom-points-title-container">
                                <p class="custom-points-title">주문 적립</p>
                                <c:if test="${item.p_type eq '0'}">
                                    <p class="custom-points-amount">+${item.amount}</p>
                                </c:if>
                                <c:if test="${item.p_type eq '1'}">
                                    <p class="custom-points-amount custom-negative">-${item.amount}</p>
                                </c:if>
                            </div>
                            <p class="custom-points-description">${item.order_code}</p>
                            <c:if test="${item.p_type eq '0'}">
                                <p class="custom-points-status">적립</p>
                            </c:if>
                            <c:if test="${item.p_type eq '1'}">
                                <p class="custom-points-status">사용</p>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </c:if>
        </tbody>
    </table>
    <table id="table-earned" class="table" style="display: none;">
        <tbody>
            <c:if test="${sessionScope.earned eq null}">
                <tr>
                    <td colspan="3">표시할 포인트 데이터가 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${sessionScope.earned ne null}">
            <c:forEach var="item" items="${sessionScope.earned}">
                <tr>
                    <td>
                        <div class="custom-points-item">
                            <div class="custom-points-title-container">
                                <p class="custom-points-title">주문 적립</p>
                                <p class="custom-points-amount">+${item.amount}</p>
                            </div>
                            <p class="custom-points-status">적립・${item.save_date} (${item.expire_date} 소멸 예정)</p>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </c:if>
        </tbody>
    </table>
    <table id="table-used" class="table" style="display: none;">
        <tbody>
            <c:if test="${sessionScope.used eq null}">
                <tr>
                    <td colspan="3">표시할 포인트 데이터가 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${sessionScope.used ne null}">
            <c:forEach var="item" items="${sessionScope.used}">
                <tr>
                    <td>
                        <div class="custom-points-item">
                            <div class="custom-points-title-container">
                                <p class="custom-points-title">적립금 결제</p>
                                <p class="custom-points-amount custom-negative">-${item.amount}</p>
                            </div>
                            <p class="custom-points-status">사용・${item.use_date}</p>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </c:if>
        </tbody>
    </table>
    <table id="table-upcoming" class="table" style="display: none;">
        <tbody>
            <c:if test="${sessionScope.upcoming eq null}">
                <tr>
                    <td colspan="3">표시할 포인트 데이터가 없습니다.</td>
                </tr>
            </c:if>
            <c:if test="${sessionScope.upcoming ne null}">
            <c:forEach var="item" items="${sessionScope.upcoming}">
                <tr>
                    <td>
                        <div class="custom-points-item">
                            <div class="custom-points-title-container">
                                <p class="custom-points-title">주문 적립</p>
                                <p class="custom-points-amount">+${item.amount}</p>
                            </div>
                            <p class="custom-points-description">${item.order_code}</p>
                            <p class="custom-points-status">예정</p>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </c:if>
        </tbody>
    </table>
</div>
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
