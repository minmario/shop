<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 25. 1. 20.
  Time: 오후 2:55
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매자 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">


    <style>
       <jsp:include page="css/table.css"></jsp:include>

    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container-fluid mt-4">


    <!-- Main Content -->
    <div class="col-9">
        <div class="d-flex justify-content-between align-items-center">
            <h5>구매자 목록(is_del == 0)</h5>

        </div>

        <div class="mt-3">
            <div class="input-group">
                <!-- 검색 아이콘 -->
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
                <select class="form-select" aria-label="Default select example" id="customer_name0">

                    <option value="grade_name">등급이름</option>
                    <option value="cus_id">사용자 id</option>
                    <option value="name">이름</option>
                    <option value="nickname">닉네임</option>
                    <option value="gender">성별</option>
                    <option value="birth_date">생일</option>
                    <option value="phone">전화번호</option>
                    <option value="email">이메일</option>
                    <option value="weight">무게</option>
                    <option value="height">키</option>
                    <option value="total">전체</option>
                    <option value="grade_expire_date">등급만기일자</option>
                </select>


                <!-- 검색 입력 -->
                <input type="text" class="form-control" placeholder="검색할 열을 선택" aria-label="Search" id="customer_word0">
                <!-- 드롭다운 버튼 -->
                <button class="btn btn-outline-secondary" type="button" aria-expanded="false" id="customer_search_btn0">
                    검색
                </button>
                <!-- 드롭다운 메뉴 -->
                <%--<ul class="dropdown-menu dropdown-menu-end">
                    <c:forEach var="name" items="${majorcategoryName}" begin="1">
                        <li><a class="dropdown-item" href="#">${name}</a></li>
                    </c:forEach>
                </ul>--%>
            </div>
        </div>

        <table class="table mt-3" id="customer_table0">
            <thead class="table-light">
            <tr>


                <c:forEach var="name" items="${customerName}">
                    <c:if test="${name ne 'id' &&name ne 'cus_pw'&&name ne 'profile_image'&& name ne 'is_del'&& name ne'Introduce'}">
                        <th class="column-name">${name}</th>
                    </c:if>
                </c:forEach>
                <th></th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var ="cus0l"  items="${customerList}">
            <c:if test ="${cus0l.is_del eq 0}">
            <tr id="row-${cus0l.id}">
                <td>${cus0l.grade_name}</td>


                <td>${cus0l.cus_id}</td>

                <th>${cus0l.name}</th>
                <td>${cus0l.nickname}</td>
                <td>
                    <c:choose>
                        <c:when test="${cus0l.gender == 1}">남자</c:when>
                        <c:when test="${cus0l.gender == 2}">여자</c:when>
                        <c:otherwise>알 수 없음</c:otherwise>
                    </c:choose>
                </td>
                <td>${cus0l.birth_date}</td>
                <td>${cus0l.phone}</td>
                <th>${cus0l.email}</th>


                <td>${cus0l.weight}</td>
                <td>${cus0l.height}</td>
                <td>${cus0l.total}</td>
                <td>${cus0l.grade_expire_date}</td>
                <td><button class="btn btn-secondary add-user-btn" data-bs-toggle="modal" data-bs-target="#stopCustomerModal"
                                     onclick="setCustomerId('${cus0l.id}')"> 정지</button></td></td>


            </tr>
            </c:if>
            </c:forEach>
            </tbody>

        </table>

        <div class="mt-3 mb-4">
            <button class="btn btn-outline-secondary">초기화</button>
        </div>

        <div class="d-flex justify-content-between align-items-center">
            <h5>탈퇴 목록(is_del == 1)</h5>

        </div>

        <div class="mt-3">
            <div class="input-group">
                <!-- 검색 아이콘 -->
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
                <select class="form-select" aria-label="Default select example" id="customer_name1">

                    <option value="grade_name">등급이름</option>
                    <option value="cus_id">사용자 id</option>
                    <option value="name">이름</option>
                    <option value="nickname">닉네임</option>
                    <option value="gender">성별</option>
                    <option value="birth_date">생일</option>
                    <option value="phone">전화번호</option>
                    <option value="email">이메일</option>
                    <option value="weight">무게</option>
                    <option value="height">키</option>
                    <option value="total">전체</option>
                    <option value="grade_expire_date">등급만기일자</option>
                </select>


                <!-- 검색 입력 -->
                <input type="text" class="form-control" placeholder="검색할 열을 선택" aria-label="Search" id="customer_word1">
                <!-- 드롭다운 버튼 -->
                <button class="btn btn-outline-secondary" type="button" aria-expanded="false" id="customer_search_btn1">
                    검색
                </button>
                <!-- 드롭다운 메뉴 -->
                <%--<ul class="dropdown-menu dropdown-menu-end">
                    <c:forEach var="name" items="${majorcategoryName}" begin="1">
                        <li><a class="dropdown-item" href="#">${name}</a></li>
                    </c:forEach>
                </ul>--%>
            </div>
        </div>

        <table class="table mt-3" id="customer_table1">
            <thead class="table-light">
            <tr>


                <c:forEach var="name" items="${customerName}">
                    <c:if test="${name ne 'id' &&name ne 'cus_pw'&&name ne 'profile_image'&& name ne 'is_del' && name ne'Introduce'}">
                        <th class="column-name">${name}</th>
                    </c:if>
                </c:forEach>

            </tr>
            </thead>
            <tbody>
            <c:forEach var ="cus1l"  items="${customerList}">
                <c:if test ="${cus1l.is_del eq 1}">
                    <tr>
                        <td>${cus1l.grade_name}</td>


                        <td>${cus1l.cus_id}</td>

                        <th>${cus1l.name}</th>
                        <td>${cus1l.nickname}</td>
                        <td>
                            <c:choose>
                                <c:when test="${cus1l.gender == 1}">남자</c:when>
                                <c:when test="${cus1l.gender == 2}">여자</c:when>
                                <c:otherwise>알 수 없음</c:otherwise>
                            </c:choose>
                        </td>
                        <td>${cus1l.birth_date}</td>
                        <td>${cus1l.phone}</td>
                        <th>${cus1l.email}</th>
                        <td>${cus1l.weight}</td>
                        <td>${cus1l.height}</td>
                        <td>${cus1l.total}</td>
                        <td>${cus1l.grade_expire_date}</td>

                    </tr>
                </c:if>
            </c:forEach>
            </tbody>

        </table>

        <div class="mt-3 mb-4">
            <button class="btn btn-outline-secondary">초기화</button>
        </div>


        <div class="d-flex justify-content-between align-items-center">
            <h5>정지 목록(is_del == 2)</h5>

        </div>

        <div class="mt-3">
            <div class="input-group">
                <!-- 검색 아이콘 -->
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
                <select class="form-select" aria-label="Default select example" id="customer_name2">

                    <option value="grade_name">등급이름</option>
                    <option value="cus_id">사용자 id</option>
                    <option value="name">이름</option>
                    <option value="nickname">닉네임</option>
                    <option value="gender">성별</option>
                    <option value="birth_date">생일</option>
                    <option value="phone">전화번호</option>
                    <option value="email">이메일</option>
                    <option value="weight">무게</option>
                    <option value="height">키</option>
                    <option value="total">전체</option>
                    <option value="grade_expire_date">등급만기일자</option>
                </select>


                <!-- 검색 입력 -->
                <input type="text" class="form-control" placeholder="검색할 열을 선택" aria-label="Search" id="customer_word2">
                <!-- 드롭다운 버튼 -->
                <button class="btn btn-outline-secondary" type="button" aria-expanded="false" id="customer_search_btn2">
                    검색
                </button>
                <!-- 드롭다운 메뉴 -->
                <%--<ul class="dropdown-menu dropdown-menu-end">
                    <c:forEach var="name" items="${majorcategoryName}" begin="1">
                        <li><a class="dropdown-item" href="#">${name}</a></li>
                    </c:forEach>
                </ul>--%>
            </div>
        </div>

        <table class="table mt-3" id="customer_table2">
            <thead class="table-light">
            <tr>


                <c:forEach var="name" items="${customerName}">
                    <c:if test="${name ne 'id' &&name ne 'cus_pw'&&name ne 'profile_image'&& name ne 'is_del' && name ne'Introduce'}">
                        <th class="column-name">${name}</th>
                    </c:if>

                </c:forEach>
                <td></td>

            </tr>
            </thead>
            <tbody>
            <c:forEach var ="cus2l"  items="${customerList}">
                <c:if test ="${cus2l.is_del eq 2}">
                    <tr id="row-${cus2l.id}">
                        <td>${cus2l.grade_name}</td>


                        <td>${cus2l.cus_id}</td>

                        <th>${cus2l.name}</th>
                        <td>${cus2l.nickname}</td>
                        <td>
                            <c:choose>
                                <c:when test="${cus2l.gender == 1}">남자</c:when>
                                <c:when test="${cus2l.gender == 2}">여자</c:when>
                                <c:otherwise>알 수 없음</c:otherwise>
                            </c:choose>
                        </td>
                        <td>${cus2l.birth_date}</td>
                        <td>${cus2l.phone}</td>
                        <th>${cus2l.email}</th>
                        <td>${cus2l.weight}</td>
                        <td>${cus2l.height}</td>
                        <td>${cus2l.total}</td>
                        <td>${cus2l.grade_expire_date}</td>
                        <td><button class="btn btn-danger add-user-btn" data-bs-toggle="modal" data-bs-target="#admitCustomerModal"
                                    onclick="setCustomerId('${cus2l.id}')"> 복귀</button></td></td>

                    </tr>
                </c:if>
            </c:forEach>
            </tbody>

        </table>



    </div>
    <%--판매자 정지 모달 창--%>
    <div class="modal fade" id="stopCustomerModal" tabindex="-1" aria-labelledby="stopModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="stopModalLabel">정지 사유</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="stopCustomerForm">
                    <div class="modal-body">
                        <input type="hidden" id="stopCustomerId" name="id">

                        <textarea class="form-control" id="stopCustomerReason" name="content" rows="3" placeholder="해당 구매자를 정지할 이유를 적어주세요."></textarea>
                        <span class="text-danger">*특수문자사용시 스마트스토어 정책에 따라 전송 에러가 발생합니다. 텍스트와 숫자로 안내문구를 작성해주시기 바랍니다.</span>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="submit" class="btn btn-primary">저장</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%--판매자 복귀 모달 창--%>
    <div class="modal fade" id="admitCustomerModal" tabindex="-1" aria-labelledby="admitModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="admitModalLabel">복귀 사유</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="admitCustomerForm">
                    <div class="modal-body">
                        <input type="hidden" id="admitCustomerId" name="id">

                        <textarea class="form-control" id="admitCustomerReason" name="content" rows="3" placeholder="해당 구매자를 복귀할 이유를 적어주세요."></textarea>
                        <span class="text-danger">*특수문자사용시 스마트스토어 정책에 따라 전송 에러가 발생합니다. 텍스트와 숫자로 안내문구를 작성해주시기 바랍니다.</span>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="submit" class="btn btn-primary">저장</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    $(function (){
        $("#customer_search_btn0").click(function(){
            //검색버튼을 클릭할 때마다 수행하는 곳
            let category_name = $("#customer_name0").val();

            let word = $("#customer_word0").val();
            if (word =="남자"){
                word = 1
            }else if (word =="여자"){
                word= 2
            }
            alert(category_name+"/"+word);
            let param = "type=searchCustomer0&searchType="+
                encodeURIComponent(category_name)+
                "&searchValue="+encodeURIComponent(word);
            //비동기식 통신
            $.ajax({
                url: "Controller",
                type: "POST",
                data: param,
            }).done(function(data){
                $("#customer_table0 tbody").html(data);
            });
        });
        $("#customer_search_btn1").click(function(){
            //검색버튼을 클릭할 때마다 수행하는 곳
            let category_name = $("#customer_name1").val();

            let word = $("#customer_word1").val();
            if (word =="남자"){
                word = 1
            }else if (word =="여자"){
                word= 2
            }
            alert(category_name+"/"+word);
            let param = "type=searchCustomer1&searchType="+
                encodeURIComponent(category_name)+
                "&searchValue="+encodeURIComponent(word);
            //비동기식 통신
            $.ajax({
                url: "Controller",
                type: "POST",
                data: param,
            }).done(function(data){
                $("#customer_table1 tbody").html(data);
            });
        });
        $("#customer_search_btn2").click(function(){
            //검색버튼을 클릭할 때마다 수행하는 곳
            let category_name = $("#customer_name2").val();

            let word = $("#customer_word2").val();
            if (word =="남자"){
                word = 1
            }else if (word =="여자"){
                word= 2
            }
            alert(category_name+"/"+word);
            let param = "type=searchCustomer2&searchType="+
                encodeURIComponent(category_name)+
                "&searchValue="+encodeURIComponent(word);
            //비동기식 통신
            $.ajax({
                url: "Controller",
                type: "POST",
                data: param,
            }).done(function(data){
                $("#customer_table2 tbody").html(data);
            });
        });
    });
    function setCustomerId(customerId) {
        console.log("전달된 판매자 ID:", customerId);
        $("#stopCustomerId").val(customerId);
        $("#admitCustomerId").val(customerId);



    }
    const columnTranslations = {
        'grade_no': '등급이름',
        'cus_id': '사용자 id',
        'cus_pw': '사용자 pw',
        'name': '이름',
        'nickname': '닉네임',
        'gender': '성별',
        'birth_date': '생일',
        'phone': '전화번호',
        'email': '이메일',
        'weight': '무게',
        'height': '키',
        'total': '전체',
        'grade_expire_date': '등급만기일자',
        'is_del':'삭제여부'

    };

    // 페이지 로딩 후 컬럼 이름을 한국어로 변환
    document.addEventListener('DOMContentLoaded', function() {
        const columnElements = document.querySelectorAll('.column-name'); // 'column-name' 클래스를 가진 요소들

        columnElements.forEach(element => {
            const columnName = element.innerText.trim();
            if (columnTranslations[columnName]) {
                element.innerText = columnTranslations[columnName];  // 한국어로 번역
            }
        });
    });
    $(document).ready(function () {<%--폼태그--%>
        $("#stopCustomerForm").submit(function (event) {
            event.preventDefault(); // 기본 form 제출 막기

            let customerId = $("#stopCustomerId").val();

            let content = $("#stopCustomerReason").val();

            if (!customerId) {
                alert("정지할 구매자 ID가 없습니다.");
                return;
            }

            $.ajax({
                url: "Controller",
                type: "POST",
                data: {
                    type: "buttonCustomer",
                    id: customerId,

                    content: content,
                    action: "stop"
                },
                dataType: "json", <%--보내지는 데이터 타입--%>
                <%--삭제의 경우 기존 값에서 하나의 행만 지우는 식이로 해야해서 이렇게 했다--%>
                <%--삭제시 반드시 1로 만들어준다-->
                <%--추가는 전부 불러오는 방식으로 하길 권장한다--%>
                <%--spring에서도 자주 사용하니 반드시 알아야한다--%>

                success: function (response) {
                    if (response.status === "success") {
                        console.log("정지 성공:", response);
                        console.log(customerId);

                        <%--테이블의 열의 id를 레코드를 삭제--%>
                        $("#row-" + customerId).remove();



                        $("stopCustomerModal").modal("hide");

                        alert("구매자가 정지되었습니다.");

                    } else {
                        console.error("정지 실패:", response.message);
                        alert("구매자 정지에 실패했습니다: " + response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("정지 실패:", error);
                    alert("구매자 정지 중 오류가 발생했습니다.");
                }
            });
        });
        $("#admitCustomerForm").submit(function (event) {
            event.preventDefault(); // 기본 form 제출 막기

            let customerId = $("#admitCustomerId").val();

            let content = $("#admitCustomerReason").val();

            if (!customerId) {
                alert("복귀할 구매자 ID가 없습니다.");
                return;
            }

            $.ajax({
                url: "Controller",
                type: "POST",
                data: {
                    type: "buttonCustomer",
                    id: customerId,

                    content: content,
                    action: "admit"
                },
                dataType: "json", <%--보내지는 데이터 타입--%>
                <%--삭제의 경우 기존 값에서 하나의 행만 지우는 식이로 해야해서 이렇게 했다--%>
                <%--삭제시 반드시 1로 만들어준다-->
                <%--추가는 전부 불러오는 방식으로 하길 권장한다--%>
                <%--spring에서도 자주 사용하니 반드시 알아야한다--%>

                success: function (response) {
                    if (response.status === "success") {
                        console.log("복귀 성공:", response);
                        console.log(customerId);

                        <%--테이블의 열의 id를 레코드를 삭제--%>
                        $("#row-" + customerId).remove();



                        $("admitCustomerModal").modal("hide");

                        alert("구매자가 복귀되었습니다.");

                    } else {
                        console.error("복귀 실패:", response.message);
                        alert("구매자 복귀에 실패했습니다: " + response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("복귀 실패:", error);
                    alert("구매자 복귀 중 오류가 발생했습니다.");
                }
            });
        });
    });
</script>
</body>
</html>
