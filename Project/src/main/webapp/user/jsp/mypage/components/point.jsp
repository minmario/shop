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
        <tbody>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">주문 적립</p>
                            <p class="custom-points-amount">+712원</p>
                        </div>
                        <p class="custom-points-description">[2PACK] 클 코튼 티셔츠 블랙+화이트</p>
                        <p class="custom-points-status">예정</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">적립금 결제</p>
                            <p class="custom-points-amount custom-negative">-2,373원</p>
                        </div>
                        <p class="custom-points-description">2025.01.17</p>
                        <p class="custom-points-status">사용</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">주문 적립</p>
                            <p class="custom-points-amount">+372원</p>
                        </div>
                        <p class="custom-points-description">VAMOS LABEL CREWNECK BLACK</p>
                        <p class="custom-points-status">적립・2024.10.29 (2029.10.28 소멸 예정)</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">주문 적립</p>
                            <p class="custom-points-amount">+544원</p>
                        </div>
                        <p class="custom-points-description">[2PACK] 170g 에어+ 그림 반팔티 (JP5TSU152BK)</p>
                        <p class="custom-points-status">적립・2024.10.04 (2029.10.03 소멸 예정)</p>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <table id="table-earned" class="table" style="display: none;">
        <tbody>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">랜덤뽑기 - 참여/혜택 적립</p>
                            <p class="custom-points-amount">+100원</p>
                        </div>
                        <p class="custom-points-status">적립・2025.01.17 (2025.01.23 소멸 예정)</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">주문 적립</p>
                            <p class="custom-points-amount">+372원</p>
                        </div>
                        <p class="custom-points-description">VAMOS LABEL CREWNECK BLACK</p>
                        <p class="custom-points-status">적립・2024.10.29 (2029.10.28 소멸 예정)</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">주문 적립</p>
                            <p class="custom-points-amount">+540원</p>
                        </div>
                        <p class="custom-points-description">[2PACK] 170g 에어+ 그램 반팔티 (JP5TSU152BK)</p>
                        <p class="custom-points-status">적립・2024.10.04 (2029.10.03 소멸 예정)</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">주문 적립</p>
                            <p class="custom-points-amount">+754원</p>
                        </div>
                        <p class="custom-points-description">PHYPS® 2PACK LEATHER LABEL  LONG SLEEVE WHITE / NAVY</p>
                        <p class="custom-points-status">적립・2024.08.06 (2029.08.05 소멸 예정)</p>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <table id="table-used" class="table" style="display: none;">
        <tbody>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">적립금 결제</p>
                            <p class="custom-points-amount custom-negative">-2,373원</p>
                        </div>
                        <p class="custom-points-status">사용・2025.01.17</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">적립금 결제</p>
                            <p class="custom-points-amount custom-negative">-3,780원</p>
                        </div>
                        <p class="custom-points-status">사용・2024.02.02</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">적립금 결제</p>
                            <p class="custom-points-amount custom-negative">-2,500원</p>
                        </div>
                        <p class="custom-points-status">사용・2024.01.28</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">적립금 결제</p>
                            <p class="custom-points-amount custom-negative">-706원</p>
                        </div>
                        <p class="custom-points-status">사용・2023.12.13</p>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <table id="table-upcoming" class="table" style="display: none;">
        <tbody>
            <tr>
                <td>
                    <div class="custom-points-item">
                        <div class="custom-points-title-container">
                            <p class="custom-points-title">주문 적립</p>
                            <p class="custom-points-amount">+712원</p>
                        </div>
                        <p class="custom-points-description">[2PACK] 클 코튼 티셔츠 블랙+화이트</p>
                        <p class="custom-points-status">예정</p>
                    </div>
                </td>
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
