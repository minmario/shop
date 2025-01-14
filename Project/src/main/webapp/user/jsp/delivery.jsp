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
    <style>
        #wrap{
            width: 1000px;
            border: 1px solid black;
            align-items: center;     /* 수평 가운데 정렬 */
            justify-content: center; /* 수직 가운데 정렬 */
        }

        #wrap, #wrap-table{
            text-align: center;
            align-items: center;     /* 수평 가운데 정렬 */
            justify-content: center; /* 수직 가운데 정렬 */
        }

        #delivery-table{
            border-collapse: collapse;
            text-align: center;
            width: 100%;
        }

        #delivery-table tr, #delivery-table td{
            border: 1px solid black;
            padding: 4px;
        }

        #wrap-ul>ul{
            list-style: none;
            display: flex;
            justify-content: center;
        }

        #wrap-ul li{

        }
    </style>
</head>
<body>
<jsp:include page="./layout/header.jsp"></jsp:include>
    <div id="wrap">
        <div id="wrap-ul">
            <ul>
                <li>배송지 관리</li>
                <li><button type="button">배송지 추가</button></li>
            </ul>
            <hr/>
        </div>
        <div id="wrap-table">
            <table id="delivery-table">
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>연락처</th>
                    <th>관리</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>OOO</td>
                    <td>서울특별시 동작구 보라매로5길 15</td>
                    <td>010-0000-0000</td>
                    <td>
                        <button type="button">수정</button>
                        <button type="button">삭제</button>
                    </td>
                </tr>
            </table>
        </div>


    </div>
</body>
<footer>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>
</html>
