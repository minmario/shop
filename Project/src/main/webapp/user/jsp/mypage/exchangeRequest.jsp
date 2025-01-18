<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>Musinsa</title>

    <%-- Google Font : Gothic A1 --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <%-- CSS --%>
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/exchangeRequest.css"/>
</head>
<body>
    <!-- header -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <!-- content -->
    <div class="wrap">
        <div class="row">
            <div class="container">

                <div class="wrap-title">
                    <span class="left bold">교환요청</span>
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

                    <!-- 교환 사유 선택 -->
                    <div class="wrap-reason">
                        <span class="bold">교환사유</span><br/>
                        <select class="form-select select" id="select-reason" name="select" onchange="addReasonInput()">
                            <option selected="selected">:: 교환 사유를 선택하세요 ::</option>
                            <option value="1">단순 변심(스타일)</option>
                            <option value="2">상품 불량</option>
                            <option value="3">오배송</option>
                            <option value="4">상품정보와 상이</option>
                            <option value="5">직접 입력</option>
                        </select>

                        <!-- 교환 사유 중 '직접 입력'을 선택할 때만 보이는 새로운 입력 필드 -->
                        <div id="exchange-input">
                            <input type="text" class="toggle" name="select-reason" placeholder="교환 사유를 입력해주세요"/>
                        </div>
                        <hr/>
                    </div>

                    <div class="wrap-option">
                        <span class="bold">변경옵션</span><br/>
                        <select class="form-select select" id="option-size" name="option-size">
                            <option selected="selected">:: 사이즈 ::</option>
                            <option value="1">S</option>
                            <option value="2">M</option>
                            <option value="3">L</option>
                            <option value="4">XL</option>
                        </select>&nbsp;

                        <select class="form-select select" id="option-color" name="option-color">
                            <option selected="selected">:: 색상 ::</option>
                            <option value="1">블랙</option>
                            <option value="2">화이트</option>
                            <option value="3">다크그린</option>
                            <option value="4">차콜</option>
                        </select>
                    </div>
                    <hr/>

                    <!-- 교환 방법 선택 -->
                    <div>
                        <span class="bold">교환 방법 선택</span><br/>
                        <input type="radio" id="shop-delivery" name="delivery" value="1" onclick="selectAddr()" checked/>
                        <label for="shop-delivery">회수해 주세요</label>
                        <span class="svg-icon" data-toggle="modal" data-target="#retrieveModal">
                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                            </svg>
                        </span>
                        <br/>
                        <input type="radio" id="direct" name="delivery" value="2" onclick="selectAddr()"/>
                        <label for="direct">직접 보낼게요</label>
                        <span class="svg-icon" data-toggle="modal" data-target="#personallyModal">
                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                            </svg>
                        </span>
                    </div>

                    <!-- '회수해 주세요'을 선택할 때만 보이는 필드 -->
                    <div class="custom-addr">
                        <div class="wrap-addrList">
                            <button type="button" class="btn btn-outline-secondary add-address-button" data-toggle="modal"
                                    data-target="#addrModalCenter">배송지 추가하기
                            </button>
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
        </div>

        <!-- footer -->
        <jsp:include page="../layout/footer.jsp"></jsp:include>
    </div>

    <!-- Modal -->

    <!-- 회수해주세요 설명 모달 -->
    <div class="modal fade" id="retrieveModal" tabindex="-1" role="dialog" aria-labelledby="retrieveModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="retrieveModalLabel">'회수해 주세요' 반품 방법</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                        <ul>
                            <li>이 옵션을 선택하면 무신사에서 배송 업체와 조율하여 회수 일정을 잡고, 상품을 집 앞에 두면 자동으로 수거됩니다.</li>
                            <li>교환할 상품을 보내지 않았다면 ‘회수해 주세요’를 선택해 주세요. 택배사에 접수하지 않아도 업체 지정 택배사에서 교환 상품을 직접 회수합니다.
                                (일부 업체의 경우, 자동 회수를 제공하지 않습니다.)</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 직접보낼게요 설명 모달 -->
    <div class="modal fade" id="personallyModal" tabindex="-1" role="dialog" aria-labelledby="personallyModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="personallyModalLabel">'직접 보낼게요' 반품 방법</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                        <ul>
                            <li>고객이 직접 택배를 예약하여 반품하는 방법입니다. 이 경우, 반품 배송비가 추가로 발생할 수 있습니다.</li>
                            <li>이미 교환 상품을 보냈다면 ‘직접 발송했어요’를 선택하고 반송장 정보를 입력해 주세요.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 배송지 추가 모달 -->
    <div class="modal fade" id="addrModalCenter" tabindex="-1" role="dialog" aria-labelledby="addrModalCenterTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addrModalCenterTitle">배송지 추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
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
                                    <button class="btn btn-primary" type="submit">주소검색</button>
                                    <br/>
                                    <input type="text" class="addr2" name="addr1" placeholder="주소"/><br/>
                                    <input type="text" class="addr2" name="addr2" placeholder="상세주소"/><br/>
                                </td>
                            </tr>
                            <tr>
                                <th class="modal-table-info">
                                    <span>배송 요청사항 (선택)</span>
                                </th>
                                <td>
                                    <select class="form-select" id="request-select" name="select" onchange="addInputRequest()">
                                        <option selected="selected">:: 배송 요청사항을 선택하세요 ::</option>
                                        <!--가장 먼저 작성하는 것이 선택되기 때문에 selected로 지정한다. -->
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
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-outline-primary" onclick="save()">등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- JQuery --%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <%-- Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // 교환 사유 필드 추가
        function addReasonInput() {
            let selectValue = document.getElementById("select-reason").value;
            let exchangeInput = document.getElementById("exchange-input");

            if (selectValue == "5") {
                exchangeInput.style.display = "block";
            } else {
                exchangeInput.style.display = "none";
            }
        }

        // 배송지 모달 > 요청 사항 필드 추가
        function addInputRequest() {
            let selectValue = document.getElementById("request-select").value;
            let customInput = document.getElementById("custom-input");

            if (selectValue == "5") {
                customInput.style.display = "block";
            } else {
                customInput.style.display = "none";
            }
        }

        function selectAddr() {
            // 교환 방법 라디오 버튼 값 가져오기
            const shopDelivery = document.getElementById("shop-delivery");
            const customAddr = document.querySelector(".custom-addr");

            // '회수해 주세요'를 선택했을 때만 custom-addr 보이기
            if (shopDelivery.checked) {
                customAddr.style.display = "block"; // 표시
            } else {
                customAddr.style.display = "none"; // 숨김
            }
        }
    </script>
</body>
</html>
