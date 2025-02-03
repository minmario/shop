<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./user/images/share_musinsa.png">
    <title>무신사</title>

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
    <c:choose>
        <c:when test="${not empty sessionScope.customer_info}">
            <!-- header -->
            <jsp:include page="../layout/header.jsp"></jsp:include>

            <!-- content -->
            <div class="wrap">
                <div class="row">
                    <div class="container">
                        <c:if test="${requestScope.o_vo ne null and requestScope.d_list ne null}">
                        <c:set var="o_vo" value="${requestScope.o_vo}"/>
                            <div class="wrap-title">
                                <span class="left bold">교환요청</span>
                            </div>
                            <div class="box">
                                <!-- 교환 상품 정보 -->
                                <section class="wrap-product">
                                    <div class="product-content">
                                        <input type="hidden" name="prod_no" value="${o_vo.prod_no}"/>
                                        <input type="hidden" name="orderCode" value="${o_vo.order_code}"/>
                                        <input type="hidden" name="order_count" value="${o_vo.count}"/>
                                        <input type="hidden" name="current_option" value="${o_vo.size}"/>
                                        <img src="${fn:split(o_vo.prod_image, ',')[0]}" alt="상품 이미지" class="product-img">
                                        <div class="product-detail">
                                            <span>${o_vo.brand}</span><br/>
                                            ${o_vo.prod_name}
                                            <div class="option-text">${o_vo.size} / ${o_vo.count}</div>
                                        </div>
                                    </div>
                                </section>
                                <hr/>

                                <!-- 교환 사유 선택 -->
                                <div class="wrap-reason">
                                    <span class="bold">교환사유</span><br/>
                                    <select class="form-select select" id="select-reason" name="select" onchange="addReasonInput()">
                                        <option selected="selected">:: 교환 사유를 선택하세요 ::</option>
                                        <option value="단순 변심(스타일)">단순 변심(스타일)</option>
                                        <option value="상품 불량">상품 불량</option>
                                        <option value="오배송">오배송</option>
                                        <option value="상품정보와 상이">상품정보와 상이</option>
                                        <option value="직접 입력">직접 입력</option>
                                    </select>

                                    <!-- 교환 사유 중 '직접 입력'을 선택할 때만 보이는 새로운 입력 필드 -->
                                    <div id="exchange-input">
                                        <input type="text" class="toggle" name="select-reason" placeholder="교환 사유를 입력해주세요"/>
                                    </div>
                                    <hr/>
                                </div>

                                <div class="wrap-option">
                                    <span class="bold">변경옵션</span><br/>
                                    <select class="form-select select" id="exchange-option-size" name="exchange-option-size">
                                        <option selected="selected">:: 사이즈 ::</option>
                                    </select>&nbsp;
                                </div>
                                <hr/>

                                <div class="custom-addr">
                                    <div class="wrap-addrList">
                                        <button type="button" class="btn btn-outline-secondary add-address-button" data-toggle="modal" data-target="#addrModalCenter">배송지 추가하기</button>
                                        <c:forEach var="delivery" items="${requestScope.d_list}" varStatus="status">
                                            <div class="address-box">
                                                <input type="radio" id="address-${status.index}" name="retrieve_deli_no" value="${delivery.id}">
                                                <label for="address-${status.index}">
                                                    <div class="address-details">
                                                        <input type="hidden" id="retrieve_deli_no" name="retrieve_deli_no" value="${delivery.id}">
                                                        <p class="name">${delivery.name} <c:if test="${delivery.is_default == '1'}"><span class="default">기본 배송지</span></c:if></p>
                                                        <p class="address">(${delivery.pos_code}) ${delivery.addr1} ${delivery.addr2}</p>
                                                        <p class="phone">${delivery.phone}</p>
                                                        <p class="deli_request">${delivery.request}</p>
                                                    </div>
                                                </label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <hr/>

                                <!-- 교환요청 버튼-->
                                <button type="button" class="btn btn-outline-secondary add-address-button" onclick="exchangeRequest()">교환 신청</button>
                            </div>
                        </c:if>
                    </div>
                </div>

                <!-- footer -->
                <jsp:include page="../layout/footer.jsp"></jsp:include>
            </div>
        </c:when>
        <c:otherwise>
            <script>
                alert("세션이 만료되었습니다. 다시 로그인해 주세요.");
                window.location.href = 'Controller?type=login';
            </script>
        </c:otherwise>
    </c:choose>

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

    <%-- JS --%>
    <script src="./user/js/mypage/exchangeRequest.js"></script>

</body>
</html>
