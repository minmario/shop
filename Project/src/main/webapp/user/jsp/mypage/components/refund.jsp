<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="point-section">
    <div class="point-header">
        <span class="point-title">취소/반품/교환</span>
    </div>
</div>
<div class="refund-tabs">
    <ul class="nav nav-tabs" id="nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#" data-target="#list-all">전체</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-target="#list-cancelRefund">취소/반품</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-target="#list-exchange">교환</a>
        </li>
    </ul>
</div>
<div id="list">
    <%-- 전체 조회 --%>
    <div id="list-all" class="list">
        <div class="wrap-refund-list">

            <div class="refund-summary">
                <div class="refund-header">
                    <div class="refund-date">24.12.16</div>
                    <div class="refund-details-link">
                        <a href="#">주문 상세</a>
                    </div>
                </div>
                <div class="refund-status">취소완료</div>
                <div class="order-product">
                    <div class="product-image"></div>
                    <div class="product-info">
                        <p class="product-brand">thisisnever</p>
                        <p class="product-name">Mesh Football Jersey Navy</p>
                        <p class="product-options">M / 1개</p>
                        <p class="product-price">25,770원</p>
                    </div>
                </div>
                <div class="wrap-buttons">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='Controller?type=cancelDetails'">취소 상세</button>
                    <button type="button" class="btn btn-outline-secondary">재구매</button>
                </div>
            </div><hr/>

            <div class="refund-summary">
                <div class="refund-header">
                    <div class="refund-date">24.12.16</div>
                    <div class="refund-details-link"><a href="#">주문 상세</a></div>
                </div>
                <div class="refund-status">반품완료</div>
                <div class="order-product">
                    <div class="product-image"></div>
                    <div class="product-info">
                        <p class="product-brand">thisisnever</p>
                        <p class="product-name">Mesh Football Jersey Navy</p>
                        <p class="product-options">M / 1개</p>
                        <p class="product-price">25,770원</p>
                    </div>
                </div>
                <div class="wrap-buttons">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='Controller?type=refundDetails'">반품 상세</button>
                    <button type="button" class="btn btn-outline-secondary">재구매</button>
                    <button type="button" class="btn btn-outline-secondary">회수 배송 조회</button>
                </div>
            </div><hr/>

            <div class="exchange-summary">
                <div class="exchange-header">
                    <div class="exchange-date">22.05.16</div>
                    <div class="exchange-details-link">
                        <a href="#">주문 상세</a>
                    </div>
                </div>
                <div class="exchange-status">교환완료</div>
                <div class="order-product">
                    <div class="product-image"></div>
                    <div class="product-info">
                        <p class="product-brand">thisisnever</p>
                        <p class="product-name">Mesh Football Jersey Navy</p>
                        <p class="product-options">M / 1개</p>
                        <p class="product-price">25,770원</p>
                    </div>
                </div>
                <div class="wrap-buttons">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='Controller?type=exchangeDetails'">교환 상세</button>
                    <button type="button" class="btn btn-outline-secondary">교환 배송 조회</button>
                    <button type="button" class="btn btn-outline-secondary">회수 배송 조회</button>
                </div>
            </div>

        </div>
    </div>

    <%-- 반품/취소 조회 --%>
    <div id="list-cancelRefund" class="list" style="display: none;">
        <div class="wrap-refund-list">

            <div class="refund-summary">
                <div class="refund-header">
                    <div class="refund-date">24.12.16</div>
                    <div class="refund-details-link">
                        <a href="#">주문 상세</a>
                    </div>
                </div>
                <div class="refund-status">취소완료</div>
                <div class="order-product">
                    <div class="product-image"></div>
                    <div class="product-info">
                        <p class="product-brand">thisisnever</p>
                        <p class="product-name">Mesh Football Jersey Navy</p>
                        <p class="product-options">M / 1개</p>
                        <p class="product-price">25,770원</p>
                    </div>
                </div>
                <div class="wrap-buttons">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='Controller?type=cancelDetails'">취소 상세</button>
                    <button type="button" class="btn btn-outline-secondary">재구매</button>
                </div>
            </div><hr/>

            <div class="refund-summary">
                <div class="refund-header">
                    <div class="refund-date">24.12.16</div>
                    <div class="refund-details-link"><a href="#">주문 상세</a></div>
                </div>
                <div class="refund-status">반품완료</div>
                <div class="order-product">
                    <div class="product-image"></div>
                    <div class="product-info">
                        <p class="product-brand">thisisnever</p>
                        <p class="product-name">Mesh Football Jersey Navy</p>
                        <p class="product-options">M / 1개</p>
                        <p class="product-price">25,770원</p>
                    </div>
                </div>
                <div class="wrap-buttons">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='Controller?type=refundDetails'">반품 상세</button>
                    <button type="button" class="btn btn-outline-secondary">재구매</button>
                    <button type="button" class="btn btn-outline-secondary">회수 배송 조회</button>
                </div>
            </div>

        </div>
    </div>

    <%-- 교환 조회 --%>
    <div id="list-exchange" class="list" style="display: none;">
        <div class="wrap-refund-list">

            <div class="exchange-summary">
                <div class="exchange-header">
                    <div class="exchange-date">22.05.16</div>
                    <div class="exchange-details-link">
                        <a href="#">주문 상세</a>
                    </div>
                </div>
                <div class="exchange-status">교환완료</div>
                <div class="order-product">
                    <div class="product-image"></div>
                    <div class="product-info">
                        <p class="product-brand">thisisnever</p>
                        <p class="product-name">Mesh Football Jersey Navy</p>
                        <p class="product-options">M / 1개</p>
                        <p class="product-price">25,770원</p>
                    </div>
                </div>
                <div class="wrap-buttons">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='Controller?type=exchangeDetails'">교환 상세</button>
                    <button type="button" class="btn btn-outline-secondary">교환 배송 조회</button>
                    <button type="button" class="btn btn-outline-secondary">회수 배송 조회</button>
                </div>
            </div><hr/>

            <div class="exchange-summary">
                <div class="exchange-header">
                    <div class="exchange-date">22.05.16</div>
                    <div class="exchange-details-link"><a href="#">주문 상세</a></div>
                </div>
                <div class="exchange-status">교환완료</div>
                <div class="order-product">
                    <div class="product-image"></div>
                    <div class="product-info">
                        <p class="product-brand">thisisnever</p>
                        <p class="product-name">Mesh Football Jersey Navy</p>
                        <p class="product-options">M / 1개</p>
                        <p class="product-price">25,770원</p>
                    </div>
                </div>
                <div class="wrap-buttons">
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='Controller?type=exchangeDetails'">교환 상세</button>
                    <button type="button" class="btn btn-outline-secondary">교환 배송 조회</button>
                    <button type="button" class="btn btn-outline-secondary">회수 배송 조회</button>
                </div>
            </div>

        </div>
    </div>
</div>