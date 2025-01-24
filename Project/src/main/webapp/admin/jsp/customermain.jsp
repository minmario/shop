<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 25. 1. 20.
  Time: 오후 2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            width: 7%;
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
        <span class="input-group-text">
          <i class="bi bi-search"></i> <!-- 부트스트랩 아이콘 사용 -->
            </span>
                <input type="text" class="form-control" placeholder="전체 구매자 검색">
            </div>
        </div>

        <table class="table mt-3">
            <thead class="table-light">
            <tr>
                <th><input type="checkbox"></th>
                <th>등급 코드</th>
                <th>고객 id</th>
                <th>고객 pw</th>
                <th>고객 이름</th>
                <th>고객 별명</th>
                <th>고객 성별</th>
                <th>고객 생일</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>프로필 사진</th>
                <td>무게</td>
                <td>키</td>
                <td>전체</td>
                <td>등급 만기일</td>
                <td>삭제 여부</td>

            </tr>
            </thead>
            <tbody>
            <c:forEach var ="cl"  items="${customerList}">


            <tr>
                <td><input type="checkbox"></td>
                <td>${cl.grade_code}</td>
                <td>${cl.cus_id}</td>
                <td>${cl.cus_pw}</td>
                <th>${cl.name}</th>
                <td>${cl.nickname}</td>
                <td>${cl.gender}</td>
                <td>${cl.birth_date}</td>
                <td>${cl.phone}</td>
                <th>${cl.email}</th>
                <th>${cl.profile_image}</th>

                <td>${cl.weight}</td>
                <td>${cl.height}</td>
                <td>${cl.total}</td>
                <td>${cl.grade_expire_date}</td>
                <td>${cl.is_del}</td>
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
</body>
</html>
