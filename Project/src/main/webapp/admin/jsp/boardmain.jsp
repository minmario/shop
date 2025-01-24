<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 25. 1. 21.
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>게시판 관리</title>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>

<div class="container-fluid mt-4">
    <!-- 일반 게시판 목록 영역 -->
    <div class="col-9">
        <div class="d-flex justify-content-between align-items-center">
            <h5>게시판 목록</h5>
            <div>
                <!-- 대분류 추가 버튼, 모달 연결 -->
                <button class="btn btn-primary add-user-btn" data-bs-toggle="modal" data-bs-target="#boardModal">게시판 추가</button>
            </div>
        </div>

        <div class="mt-3">
            <div class="input-group">
                <!-- 검색 아이콘 -->
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
                <select class="form-select" aria-label="Default select example" id="board_name">
                    <c:forEach var="name" items="${boardName}" varStatus="st">
                        <c:if test="${name ne 'id'}">
                            <option value="${name}"><a class="dropdown-item" href="#">${name}</a></option>
                        </c:if>
                    </c:forEach>

                </select>


                <!-- 검색 입력 -->
                <input type="text" class="form-control" placeholder="검색할 열을 선택" aria-label="Search" id="board_word">
                <!-- 드롭다운 버튼 -->
                <button class="btn btn-outline-secondary" type="button" aria-expanded="false" id="board_search_btn">
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

        <table class="table mt-3" id="board_table">
            <thead class="table-light">

            <tr>
                <th><input type="checkbox"></th>
                <c:forEach var="name" items="${boardName}">
                    <c:if test="${name ne 'id'}">
                        <th>${name}</th>
                    </c:if>
                </c:forEach>


                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var ="bl"  items="${boardList}">
                <tr>
                    <td><input type="checkbox"></td>

                    <td>${bl.cus_no}</td>
                    <td>${bl.prod_no}</td>
                    <td>${bl.bname}</td>
                    <td>${bl.title}</td>
                    <td>${bl.content}</td>
                    <td>${bl.snapshot_image}</td>
                    <td>${bl.tags}</td>
                    <td>${bl.gender}</td>
                    <td>${bl.season}</td>
                    <td>${bl.style}</td>
                    <td>${bl.score}</td>
                    <td>${bl.like_count}</td>
                    <td>${bl.write_date}</td>
                    <td>${bl.is_del}</td>
                    <td>${bl.additional_images}</td>

                    <td><button class="btn btn-outline-secondary btn-sm">수정</button>
                        <button class="btn btn-outline-secondary btn-sm">삭제</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="mt-3 mb-4">
            <button class="btn btn-outline-secondary">초기화</button>
        </div>

        <hr/><!---------------------------------------------->

        <div class="d-flex justify-content-between align-items-center">
            <h5>스냅샷 목록</h5>
            <div>
                <!-- 대분류 추가 버튼, 모달 연결 -->
                <button class="btn btn-primary add-user-btn" data-bs-toggle="modal" data-bs-target="#boardprodModal">스냅샷 추가</button>
            </div>
        </div>

        <div class="mt-3">
            <div class="input-group">
                <!-- 검색 아이콘 -->
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
                <select class="form-select" aria-label="Default select example" id="boardprod_name">
                    <c:forEach var="name" items="${boardprodName}" varStatus="st">
                        <c:if test="${name ne 'id'}">
                            <option value="${name}"><a class="dropdown-item" href="#">${name}</a></option>
                        </c:if>
                    </c:forEach>

                </select>


                <!-- 검색 입력 -->
                <input type="text" class="form-control" placeholder="검색할 열을 선택" aria-label="Search" id="boardprod_word">
                <!-- 드롭다운 버튼 -->
                <button class="btn btn-outline-secondary" type="button" aria-expanded="false" id="boardprod_search_btn">
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

        <table class="table mt-3" id="boardprod_table">
            <thead class="table-light">

            <tr>
                <th><input type="checkbox"></th>
                <c:forEach var="name" items="${boardprodName}">
                    <c:if test="${name ne 'id'}">
                        <th>${name}</th>
                    </c:if>
                </c:forEach>


                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var ="bpl"  items="${boardprodList}">
                <tr>
                    <td><input type="checkbox"></td>

                    <td>${bpl.board_no}</td>
                    <td>${bpl.prod_no}</td>


                    <td><button class="btn btn-outline-secondary btn-sm">수정</button>
                        <button class="btn btn-outline-secondary btn-sm">삭제</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="mt-3 mb-4">
            <button class="btn btn-outline-secondary">초기화</button>
        </div>
    </div>




</div>
<!-- 부트스트랩 관련 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    $(function (){
        $("#board_search_btn").click(function(){
            //검색버튼을 클릭할 때마다 수행하는 곳
            let category_name = $("#board_name").val();
            let word = $("#board_word").val();
            alert(category_name+"/"+word);
            let param = "type=searchBoard&searchType="+
                encodeURIComponent(category_name)+
                "&searchValue="+encodeURIComponent(word);
            //비동기식 통신
            $.ajax({
                url: "Controller",
                type: "POST",
                data: param,
            }).done(function(data){
                $("#board_table tbody").html(data);
            });
        });
    });
    $(function (){
        $("#boardprod_search_btn").click(function(){
            //검색버튼을 클릭할 때마다 수행하는 곳
            let category_name = $("#boardprod_name").val();
            let word = $("#boardprod_word").val();
            alert(category_name+"/"+word);
            let param = "type=searchBoardProd&searchType="+
                encodeURIComponent(category_name)+
                "&searchValue="+encodeURIComponent(word);
            //비동기식 통신
            $.ajax({
                url: "Controller",
                type: "POST",
                data: param,
            }).done(function(data){
                $("#boardprod_table tbody").html(data);
            });
        });
    });

</script>
</body>
</html>

