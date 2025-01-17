<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/mypage/refundRequest.css"/>
</head>
<body>
<!-- header -->
<jsp:include page="../layout/header.jsp"></jsp:include>

<!-- content -->
<div class="wrap">
    <div class="wrap-title">
        <span class="left">교환요청</span>
    </div>

    <!-- 전체 틀 -->
    <div class="box">

        <!-- 교환 상품 정보 -->
        <section class="wrap-product">
            <div class="product-content">
                <div class="thisisnever_img"></div>
                <div class="product-detail">
                    <span>[thisisnever]</span><br/>
                    Mesh Football Jersey Navy
                    <div class="option-text">옵션 : M / 수량 : 1</div>
                </div>
            </div>
        </section>
        <hr/>

        <div class="wrap-option">
            <span class="bold">교환옵션</span><br/>
            <select class="select" id="select-option" name="select" onchange="addReasonInput()">
                <option selected="selected">:: 환불 사유를 선택하세요 ::</option>
                <option value="1">단순 변심</option>
                <option value="2">상품 불량</option>
                <option value="3">오배송</option>
                <option value="4">상품정보와 상이</option>
                <option value="5">직접 입력</option>
            </select>

            <!-- 교환 옵션 중 '직접 입력'을 선택할 때만 보이는 새로운 입력 필드 -->
            <div id="exchange-option-input">
                <input type="text" class="toggle" name="request-reason" placeholder="환불 사유를 입력해주세요"/>
            </div><hr/>
        </div>

        <!-- 교환 사유 선택 -->
        <div class="wrap-reason">
            <span class="bold">교환사유</span><br/>
            <select class="select" id="select-reason" name="select" onchange="addReasonInput()">
                <option selected="selected">:: 환불 사유를 선택하세요 ::</option>
                <option value="1">단순 변심</option>
                <option value="2">상품 불량</option>
                <option value="3">오배송</option>
                <option value="4">상품정보와 상이</option>
                <option value="5">직접 입력</option>
            </select>

            <!-- 교환 사유 중 '직접 입력'을 선택할 때만 보이는 새로운 입력 필드 -->
            <div id="exchange-reason-input">
                <input type="text" class="toggle" name="request-reason" placeholder="환불 사유를 입력해주세요"/>
            </div><hr/>
        </div>

        <!-- 교환 방법 선택 -->
        <div>
            <span class="bold">반품 방법 선택</span><br/>
            <input type="radio" id="shop-delivery" name="delivery" value="1" onclick="selectAddr()" checked/>
            <label for="shop-delivery">쇼핑몰 지정 교환(CJ대한통운)</label><br/>
            <input type="radio" id="direct" name="delivery" value="2" onclick="selectAddr()"/>
            <label for="direct">직접발송</label>
        </div>

        <!-- '쇼핑몰 지정 교환'을 선택할 때만 보이는 필드 -->
        <div class="custom-addr">
            <div class="wrap-addrList">
                <button type="button" class="btn btn-outline-secondary add-address-button" onclick="onShowAddAddrBtn()">배송지 추가하기</button>
                <div class="address-box">
                    <input type="radio" id="default-address" name="address" checked>
                    <label for="default-address">
                        <div class="address-details">
                            <p class="name">홍길동 <span class="default">기본 배송지</span></p>
                            <p class="address">서울특별시 동작구 보라매로5길 15<br>1층 108호</p>
                            <p class="phone">010-1234-1234</p>
                        </div>
                    </label>
                </div>
                <div class="address-box">
                    <input type="radio" id="etc-address" name="address" checked>
                    <label for="etc-address">
                        <div class="address-details">
                            <p class="name">홍길동</p>
                            <p class="address">서울특별시 동작구 보라매로5길 15<br>1층 108호</p>
                            <p class="phone">010-1234-1234</p>
                        </div>
                    </label>
                </div>
            </div>
        </div>
        <hr/>

        <!-- 환불요청 버튼-->
        <button type="button" class="btn btn-outline-secondary add-address-button">환불 신청</button>
    </div>
</div>

<!-- footer -->
<jsp:include page="../layout/footer.jsp"></jsp:include>

<!-- Modal -->
<div class="modal fade" id="addrModalCenter" tabindex="-1" role="dialog" aria-labelledby="addrModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addrModalCenterTitle">배송지 추가</h5>
            </div>
            <div class="modal-body">
                <div class="modal-table-container">
                    <table class="modal-table">
                        <caption>배송지 정보 입력 테이블</caption>
                        <tbody>
                        <tr>
                            <th class="modal-table-info">
                                <span>이름</span>
                                <span class="asterisk"></span>
                            </th>
                            <td>
                                <input type="text" class="text" name="name" placeholder="받는 분의 이름을 입력하세요"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="modal-table-info">
                                <span>연락처</span>
                                <span class="asterisk"></span>
                            </th>
                            <td>
                                <input type="text" class="text" name="phone" placeholder="받는 분의 연락처를 입력하세요"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="modal-table-info">
                                <span>주소</span>
                                <span class="asterisk"></span>
                            </th>
                            <td>
                                <input type="text" class="addr1" name="pos_code" placeholder="우편번호"/>
                                <button class="btn btn-primary" type="submit">주소검색</button><br/>
                                <input type="text" class="addr2" name="addr1" placeholder="주소"/><br/>
                                <input type="text" class="addr2" name="addr2" placeholder="상세주소"/><br/>
                            </td>
                        </tr>
                        <tr>
                            <th class="modal-table-info">
                                <span>배송 요청사항 (선택)</span>
                            </th>
                            <td>
                                <select id="request-select" name="select" onchange="addInputRequest()">
                                    <option selected="selected">:: 배송 요청사항을 선택하세요 ::</option> <!--가장 먼저 작성하는 것이 선택되기 때문에 selected로 지정한다. -->
                                    <option value="1">문 앞에 놔주세요</option>
                                    <option value="2">경비실에 맡겨주세요</option>
                                    <option value="3">택배함에 넣어주세요</option>
                                    <option value="4">배송 전에 연락주세요</option>
                                    <option value="5">직접 입력</option>
                                </select>
                                <br/>
                                <!-- '직접 입력'을 선택할 때만 보이는 새로운 입력 필드 -->
                                <div id="custom-input">
                                    <input type="text" class="toggle" name="deli_request" placeholder="배송 요청 사항을 직접 입력하세요"/>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <div class="modal-footer-left">
                    <input type="checkbox" id="chkDefault" name="chk-default"/>
                    <label for="chkDefault">기본 배송지로 설정</label>
                </div>
                <div class="modal-footer-right">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-outline-primary" onclick="save()">등록</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    //환불 사유 필드 추가
    function addReasonInput() {
        let selectValue = document.getElementById("select").value;
        let refundInput = document.getElementById("refund-input");

        // 선택된 값이 '5'이면 input 필드를 표시하고, 아니면 숨긴다.
        if (selectValue == "5") {
            refundInput.style.display = "block";  // 새로운 input 필드를 보이게 한다.
        } else {
            refundInput.style.display = "none";   // 새로운 input 필드를 숨긴다.
        }
    }

    // 배송지 모달 > 요청 사항 필드 추가
    function addInputRequest() {
        let selectValue = document.getElementById("request-select").value;
        let customInput = document.getElementById("custom-input");

        // 선택된 값이 '5'이면 input 필드를 표시하고, 아니면 숨긴다.
        if (selectValue == "5") {
            customInput.style.display = "block";  // 새로운 input 필드를 보이게 한다.
        } else {
            customInput.style.display = "none";   // 새로운 input 필드를 숨긴다.
        }
    }

    function selectAddr(){
        // 반품 방법 라디오 버튼 값 가져오기
        const shopDelivery = document.getElementById("shop-delivery");
        const customAddr = document.querySelector(".custom-addr");

        // 쇼핑몰 지정 반품 택배를 선택했을 때만 custom-addr 보이기
        if (shopDelivery.checked) {
            customAddr.style.display = "block"; // 표시
        } else {
            customAddr.style.display = "none"; // 숨김
        }
    }

    // 배송지 추가 > 모달
    function onShowAddAddrBtn() {
        let modal = new bootstrap.Modal(document.getElementById('addrModalCenter'));
        modal.show();
    }

    // 배송지 추가 모달 닫기
    function onHideAddAddrBtn() {
        let modal = new bootstrap.Modal(document.getElementById('addrModalCenter'));
        modal.hide();
    }
</script>
</body>
</html>
