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
    <style>
        /* 테이블의 레이아웃을 고정하여 각 열이 비례적으로 배분되지 않고 고정된 크기를 가지도록 설정 */
        table {
            table-layout: fixed;
            width: 100%; /* 테이블 전체의 너비 */
        }

        .group-list {
            background-color: #f8f9fa;
            border-right: 1px solid #dee2e6;
            height: 100%;
        }
        .add-user-btn {
            float: right;
        }
        .highlight {
            background-color: #efeff5;
            border: 1px solid #dcdce6;
        }

        th, td {
            padding: 8px 20px;
            text-align: center; /* 중앙 정렬 */
            word-wrap: break-word; /* 긴 텍스트 줄바꿈 방지 */
        }

        /* 열에 대한 너비를 고정적으로 설정 */
        th:nth-child(1), td:nth-child(1) {
            width: 5%;
        }
        th:nth-child(2), td:nth-child(2) {
            width: 10%;
        }
        th:nth-child(3), td:nth-child(3) {
            width: 10%;
        }
        th:nth-child(4), td:nth-child(4) {
            width: 10%;
        }
        th:nth-child(5), td:nth-child(5) {
            width: 10%;
        }
        th:nth-child(6), td:nth-child(6) {
            width: 10%;
        }
        th:nth-child(7), td:nth-child(7) {
            width: 15%;
        }
        th:nth-child(8), td:nth-child(8) {
            width: 15%;
        }
        th:nth-child(9), td:nth-child(9) {
            width: 15%;
        }
        th:nth-child(10), td:nth-child(10) {
            width: 8%;
        }
        th:nth-child(11), td:nth-child(11) {
            width: 8%;
        }
        th:nth-child(12), td:nth-child(12) {
            width: 10%;
        }
        th:nth-child(13), td:nth-child(13) {
            width: 10%;
        }
        th:nth-child(14), td:nth-child(14) {
            width: 10%;
        }
        th:nth-child(15), td:nth-child(15) {
            width: 10%;
        }
        th:nth-child(16), td:nth-child(16) {
            width: 10%;
        }

    </style>
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
                        <c:if test="${name ne 'id' && name ne 'cus_no' && name ne 'season' && name ne 'prod_no' && name ne 'snapshot_image' && name ne 'additional_images' && name ne 'tags' && name ne 'gender' && name ne 'style' && name ne 'like_count' && name ne 'order_code' && name ne 'type' && name ne 'order_code' && name ne 'type' && name ne 'status' && name ne 'is_del' && name ne 'is_private' }">
                            <option value="${name}">${name}</option>
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
                    <c:if test="${name ne 'id' && name ne 'cus_no' &&name ne 'season' &&  name ne 'prod_no' && name ne 'snapshot_image' && name ne 'additional_images' && name ne 'tags' && name ne 'gender' && name ne 'style' && name ne 'like_count' && name ne 'order_code' && name ne 'type' && name ne 'order_code' && name ne 'type' && name ne 'status' && name ne 'is_del' && name ne 'is_private' }">
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

                    <td>${bl.bname}</td>

                    <td>${bl.title}</td>

                    <td>${bl.content}</td>
                    <td>${bl.score}</td>
                    <td>${bl.write_date}</td>

                    <td>
                        <button class="btn btn-secondary add-user-btn" data-bs-toggle="modal"  data-board-id="${bl.id} data-bs-target="#deleteBoard">게시판 삭제</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="mt-3 mb-4">
            <button class="btn btn-outline-secondary" onclick = "location.href='Controller?type=boardmain'">초기화</button>
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


                    <td><button class="btn btn-primary add-user-btn" data-bs-toggle="modal" data-bs-target="#rejectModal">게시판 삭제 사유</button>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="mt-3 mb-4">
            <button class="btn btn-outline-secondary">초기화</button>
        </div>
    </div>



    <%--보드 삭제 모달 창--%>
    <div class="modal fade" id="deleteBoard" tabindex="-1" aria-labelledby="rejectModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="rejectModalLabel">게시판 사유</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/Controller?type=deleteBoard&id" method="post" >
                    <div class="modal-body">
                        <textarea class="form-control" name="content" rows="3">보드를 삭제할 이유를 적어주세요.</textarea>
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

