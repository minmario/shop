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
            <div class="points-value text-right">1000원</div>
        </div>
        <div class="points-item">
            <div class="points-label text-left">소멸 예정 적립금(30일 이내)</div>
            <div class="points-value text-right">0원</div>
        </div>
    </div>
</div>
<div class="point-tabs">
    <ul class="nav nav-tabs" id="nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#" data-target="#table-all">전체</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-target="#table-earned">적립</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-target="#table-used">사용</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-target="#table-upcoming">예정</a>
        </li>
    </ul>
</div>
<div id="tables">
    <table id="table-all" class="table" style="display: table;">
        <thead>
            <tr>
                <th>전체</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>전체 내역 1</td>
            </tr>
        </tbody>
    </table>
    <table id="table-earned" class="table" style="display: none;">
        <thead>
            <tr>
                <th>적립</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>적립 내역 1</td>
            </tr>
        </tbody>
    </table>
    <table id="table-used" class="table" style="display: none;">
        <thead>
            <tr>
                <th>사용</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>사용 내역 1</td>
            </tr>
        </tbody>
    </table>
    <table id="table-upcoming" class="table" style="display: none;">
        <thead>
            <tr>
                <th>예정</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>예정 내역 1</td>
            </tr>
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
