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
            width: 10%;
        }
        th:nth-child(8), td:nth-child(8) {
            width: 10%;
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


    <!-- Main Content -->
    <div class="col-9">
        <div class="d-flex justify-content-between align-items-center">
            <h5>구매자 목록</h5>

        </div>

        <div class="mt-3">
            <div class="input-group">
                <!-- 검색 아이콘 -->
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
                <select class="form-select" aria-label="Default select example" id="customer_name">
                    <c:forEach var="name" items="${customerName}" varStatus="st">
                        <c:if test="${name ne 'id' && name ne 'profile_image'}">

                                <option class="column-name" value="${name}">${name}</option>

                        </c:if>
                    </c:forEach>

                </select>


                <!-- 검색 입력 -->
                <input type="text" class="form-control" placeholder="검색할 열을 선택" aria-label="Search" id="customer_word">
                <!-- 드롭다운 버튼 -->
                <button class="btn btn-outline-secondary" type="button" aria-expanded="false" id="customer_search_btn">
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

        <table class="table mt-3" id="customer_table">
            <thead class="table-light">
            <tr>


                <c:forEach var="name" items="${customerName}">
                    <c:if test="${name ne 'id' &&name ne 'cus_pw'&&name ne 'profile_image'&& name ne 'is_del'}">
                        <th class="column-name">${name}</th>
                    </c:if>
                </c:forEach>

            </tr>
            </thead>
            <tbody>
            <c:forEach var ="cusl"  items="${customerList}">
            <tr>

                <td>${cusl.grade_no}</td>
                <td>${cusl.cus_id}</td>

                <th>${cusl.name}</th>
                <td>${cusl.nickname}</td>
                <td>${cusl.gender}</td>
                <td>${cusl.birth_date}</td>
                <td>${cusl.phone}</td>
                <th>${cusl.email}</th>


                <td>${cusl.weight}</td>
                <td>${cusl.height}</td>
                <td>${cusl.total}</td>
                <td>${cusl.grade_expire_date}</td>

            </tr>
            </c:forEach>
            </tbody>

        </table>

        <div class="mt-3 mb-4">
            <button class="btn btn-outline-secondary">초기화</button>
        </div>



    </div>
</div>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    $(function (){
        $("#customer_search_btn").click(function(){
            //검색버튼을 클릭할 때마다 수행하는 곳
            let category_name = $("#customer_name").val();
            let word = $("#customer_word").val();
            alert(category_name+"/"+word);
            let param = "type=searchCustomer&searchType="+
                encodeURIComponent(category_name)+
                "&searchValue="+encodeURIComponent(word);
            //비동기식 통신
            $.ajax({
                url: "Controller",
                type: "POST",
                data: param,
            }).done(function(data){
                $("#customer_table tbody").html(data);
            });
        });
    });
    const columnTranslations = {
        'grade_no': '등급코드',
        'cus_id': '사용자 id',
        'cus_pw': '사용자 pw',
        'name': '이름',
        'nickname': '닉네임',
        'gender': '성별',
        'birth_date': '생일',
        'phone': '전화번호',
        'email': '이메일',
        'weight': '무게',
        'height': '높이',
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
</script>
</body>
</html>
