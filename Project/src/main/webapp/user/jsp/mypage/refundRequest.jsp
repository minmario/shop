<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" type="text/css" href="./user/css/mypage/refundRequest.css"/>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.customer_info}">
        <!-- header -->
        <jsp:include page="../layout/header.jsp"></jsp:include>

        <c:if test="${requestScope.o_list eq null}">
            <script>
                // alert("해당 주문의 정보를 불러올 수 없습니다.");
                // window.location.href = "Controller?type=mypage";
            </script>
        </c:if>

        <!-- content -->
        <div class="wrap">
            <div class="row">
                <div class="container">
                    <c:if test="${requestScope.o_list ne null and requestScope.d_list ne null}">
                        <div class="wrap-title">
                            <span class="left bold">반품요청</span>
                        </div>

                        <!-- 전체 틀 -->
                        <div class="box">
                            <!-- 반품 상품 정보 -->
                            <section class="wrap-product">
                                <div class="select-refund-all">
                                    <input type="checkbox" id="select-refund-all">
                                    <label for="select-refund-all">전체 선택</label>
                                </div>
                                <div class="wrap-product-content">
                                    <c:forEach var="product" items="${requestScope.o_list}" varStatus="status">
                                    <div class="product-content">
                                        <input type="hidden" name="prod_no" value="${product.prod_no}"/>
                                        <input type="hidden" id="point-used" value="${requestScope.o_list[0].point_amount}"/>
                                        <input type="checkbox" id="refund-product${status.index}" class="refund-checkbox"
                                               data-price="${product.prod_saled_price}" data-count="${product.count}">
                                        <label for="refund-product${status.index}" class="refund-product-label">
                                            <img src="${product.prod_image != null && not empty product.prod_image ? fn:split(product.prod_image, ',')[0] : './user/images/product1.jpg'}" alt="상품 이미지" class="product-img">
                                            <div class="product-detail">
                                                <span>${product.brand}</span><br/>
                                                ${product.prod_name}
                                                <div class="option-text">${product.option_name} / ${product.count}</div>
                                            </div>
                                        </label>
                                    </div>
                                    </c:forEach>
                                </div>
                            </section>
                            <hr/>

                            <!-- 반품 사유 선택 -->
                            <div class="wrap-reason">
                                <span class="bold">반품사유</span><br/>
                                <select class="form-select select" id="select" name="select" onchange="addReasonInput()">
                                    <option value="0" selected="selected">:: 반품 사유를 선택하세요 ::</option>
                                    <option value="1">단순 변심</option>
                                    <option value="2">상품 불량</option>
                                    <option value="3">배송 지연</option>
                                    <option value="4">상품정보와 상이</option>
                                    <option value="5">직접 입력</option>
                                </select>

                                <!-- '직접 입력'을 선택할 때만 보이는 새로운 입력 필드 -->
                                <div id="refund-input">
                                    <input type="text" class="toggle" name="request-reason" placeholder="환불 사유를 입력해주세요"/>
                                </div>
                                <hr/>
                            </div>


                            <div class="custom-addr">
                                <span class="bold">회수지 선택</span><br/>
                                <div class="wrap-addrList">
                                    <button type="button" class="btn btn-outline-secondary add-address-button" data-toggle="modal" data-target="#addrModal">
                                        배송지 추가하기
                                    </button>
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

                            <!-- 반품 계좌 정보-->
                            <div class="refund-account">
                                <span class="bold">반품 계좌 정보</span><br/>

                                <!-- 은행 선택 -->
                                <div class="margin">
                                    <label for="bank-select" class="bold">은행 선택</label><br>
                                    <select class="form-select select" id="bank-select" name="bank">
                                        <option value="" selected disabled>:: 은행을 선택하세요 ::</option>
                                        <option value="kb">KB국민은행</option>
                                        <option value="shinhan">신한은행</option>
                                        <option value="woori">우리은행</option>
                                        <option value="nh">NH농협은행</option>
                                    </select>
                                </div>

                                <!-- 계좌 번호 입력 -->
                                <div class="margin">
                                    <label for="account-number" class="bold">계좌번호</label><br>
                                    <input type="text" class="toggle" id="account-number" name="account-number" placeholder="계좌번호를 입력하세요"/><br/>
                                </div><hr/>

<%--                                <!-- 예금주 이름 -->--%>
<%--                                <div class="margin">--%>
<%--                                    <label for="account-holder" class="bold">예금주</label><br>--%>
<%--                                    <input type="text" class="toggle" id="account-holder" name="account-holder" placeholder="예금주 이름을 입력하세요"/>--%>
<%--                                </div><br/>--%>
<%--                                <hr/>--%>
                                <!-- 환불 정보 -->
                                <div class="refund-info">
                                    <span class="bold">환불 정보</span><br/>
                                    <ul>
                                        <li><span>상품 결제 금액</span><span class="item-price">0원</span></li>
                                        <li><span>적립금 사용</span><span class="points-used">0원</span></li>
                                        <li><span>기본 배송비</span><span>무료</span></li>
                                        <li><span>환불 예정 금액</span><span class="refund-amount">0원</span></li>
                                    </ul>
                                </div>
                                <!-- 반품요청 버튼-->
                                <button type="button" class="btn btn-outline-secondary add-address-button" onclick="refundRequest()">반품 신청</button>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- footer -->
            <jsp:include page="../layout/footer.jsp"></jsp:include>
        </div>

        <!-- Modal -->
        <!-- 배송지 추가 모달 -->
        <div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="addrModalTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addrModalTitle">배송지 추가</h5>
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
                            <button type="button" class="btn btn-outline-primary">등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <script>
            window.location.href = "Controller?type=error";
        </script>
    </c:otherwise>
</c:choose>

<%-- JQuery --%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<%-- Bootstrap --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<%-- JS --%>
<script src="./user/js/mypage/refundRequest.js"></script>
</body>
</html>
