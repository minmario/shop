<%--
  Created by IntelliJ IDEA.
  User: 권나현
  Date: 2025-01-14
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/mypage/delivery.css"/>
</head>
<body>
<jsp:include page="./layout/header.jsp"></jsp:include>
    <div id="wrap">

        <div id="wrap-title">
            <h4><span class="left height">배송지 관리</span></h4>
        </div>

        <div id="wrap-table">
            <table id="table">
                <caption>배송지 테이블</caption>
                <tbody>
                    <colgroup>
                        <col width="40px"/>
                        <col width="40px"/>
                        <col width="90px"/>
                        <col width="120px"/>
                        <col width="*"/>
                        <col width="120px"/>
                    </colgroup>
                    <tr>
                        <th><input type="checkbox" id="all"/></th>
                        <th>번호</th>
                        <th>이름</th>
                        <th>연락처</th>
                        <th>주소</th>
                        <th>관리</th>
                    </tr>
                    <c:set var="cnt" value="3"/> <%-- int cnt = 5; --%>
                    <c:forEach begin="1" end="${cnt}" varStatus="st">
                    <tr>
                        <td><input type="checkbox" name="chk"/></td>
                        <td>${st.index}</td>
                        <td>OOO</td>
                        <td>010-0000-0000</td>
                        <td>서울특별시 동작구 보라매로5길 15</td>
                        <td>
                            <button type="button" class="btn btn-outline-primary" onclick="location.href='addDelivery.jsp'">수정</button>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div id="wrap-button">
            <span class="left">
                <button type="button" class="btn btn-secondary btn-sm">선택 배송지 삭제</button>
            </span>
            <span class="right">
            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='addDelivery.jsp'">배송지 추가</button>
            </span>
        </div>
        <br/><br/>
        <div id="wrap-list">
            <ol>
                <li>배송 주소록은 최대 3개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
                <li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
            </ol>
        </div>
    </div>
</body>
<footer>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    $(function () {
        //체크박스 전체선택/해제 기능
        $("#all").on("click", function () {
            let ar = $("#table>tbody").find(":checkbox");
            ar.prop("checked", this.checked);
        });

        //체크박스 개별선택/해제 기능
        $("#table>tbody").find(":checkbox").on("click", function () {
            let allCheck = true;
            $("#table>tbody").find(":checkbox").not("#all").each(function () {
                if (!this.checked) {
                    allCheck = false;
                    return allCheck;
                }
            });
            $("#all").prop("checked", allCheck);
        });
    });
</script>
</html>
