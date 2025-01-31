<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>판매자 관리</title>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>

<div class="container-fluid mt-4">


    <!-- Main Content -->
    <div class="col-9">
        <div class="d-flex justify-content-between align-items-center">
            <h5>판매자 목록</h5>

        </div>

        <div class="mt-3">
            <div class="input-group">
        <span class="input-group-text">
          <i class="bi bi-search"></i> <!-- 부트스트랩 아이콘 사용 -->
            </span>
                <input type="text" class="form-control" placeholder="전체 판매자 검색">
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

