<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Musinsa Style Page</title>

</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
<!-- 네비게이션 아래 메뉴바 페이지 -->
<!-- d-flex justify-content-between align-items-center: 좌우정렬과 가운데정렬을 하는 부트스트랩기능-->

<%-- <div class="index header d-flex justify-content-between align-items-center p-3 bg-light border-bottom">--%>

<%--     <div>--%>
<%--         <c:choose>--%>
<%--             <c:when test="${isLoggedIn}">--%>
<%--                 <span class="me-3">환영합니다, <strong>${nickname}님</strong></span>--%>
<%--                 <button type="button" class="btn btn-outline-secondary"--%>
<%--                         onclick="location.href='Controller?type=logout';">로그아웃</button>--%>
<%--             </c:when>--%>
<%--             <c:otherwise>--%>
<%--                 <button type="button" class="btn btn-outline-primary"--%>
<%--                         onclick="location.href='login.jsp';">로그인</button>--%>
<%--             </c:otherwise>--%>
<%--         </c:choose>--%>
<%--     </div>--%>




<%--     <div class="d-flex gap-3 align-items-center">--%>
<%--         <a href="#" class="text-decoration-none text-dark">바로접속 ON</a>--%>
<%--         <a href="mypage.jsp" class="text-decoration-none text-dark">마이페이지</a>--%>
<%--         <a href="#" class="text-decoration-none text-dark">최근 본 상품</a>--%>
<%--         <a href="#" class="text-decoration-none text-danger">좋아요</a>--%>
<%--         <a href="#" class="text-decoration-none text-dark position-relative">--%>
<%--             장바구니 <span class="badge bg-primary rounded-pill">0</span>--%>
<%--         </a>--%>
<%--         <a href="#" class="text-decoration-none text-dark">주문배송조회</a>--%>
<%--         <a href="#" class="text-decoration-none text-dark">고객센터</a>--%>
<%--     </div>--%>
<%-- </div>--%>

<%--<form action = "Controller?type=admin" method="post">

</form>--%>
<!--이벤트슬라이더 -->
<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <!-- 첫 번째 이미지 -->
        <div class="carousel-item active">
            <img src="./user/images/index1.jpg" class="d-block w-100" alt="이벤트 이미지 1">
        </div>
        <!-- 두 번째 이미지 -->
        <div class="carousel-item">
            <img src="./user/images/index2.jpg" class="d-block w-100" alt="이벤트 이미지 2">
        </div>

    </div>

    <!-- 이전 버튼 -->
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <!-- 다음 버튼 -->
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


<!-- 각 옷들 태그묶음집 -->
<div class="container my-5">
    <h2 class="mb-4">스포티 스타일 브랜드 아이템 추천</h2>
    <div class="row row-cols-1 row-cols-md-4 g-4">

        <div class="col">
            <div class="card h-100">
                <img src="./user/images/product1.jpg" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">Sunground Hoody - 4COL</h5>
                    <p class="card-text text-danger">55% 48,600원</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="./user/images/product2.jpg" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">조던 부루클린 플리스 팬츠</h5>
                    <p class="card-text text-danger">10% 76,500원</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="./user/images/product3.jpg" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">INDIGO WASHED JOGGER PANTS</h5>
                    <p class="card-text text-danger">80% 15,800원</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="./user/images/product4.jpg" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">[2PACK] 프렌치 테리 팬츠</h5>
                    <p class="card-text text-danger">62% 40,000원</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card h-100">
                <img src="./user/images/product5.jpg" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">유니버스 오버핏 스웨트</h5>
                    <p class="card-text text-danger">40% 29,880원</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="./user/images/product6.jpg" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">RDS 2PK 후디 미드</h5>
                    <p class="card-text text-danger">43% 169,000원</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="./user/images/product7.jpg" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">AV LOGO CROP HOODY</h5>
                    <p class="card-text text-danger">35% 80,600원</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="./user/images/product8.jpg" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title">스포츠 스타일 팬츠</h5>
                    <p class="card-text text-danger">45,000원</p>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<footer>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>

</html>
