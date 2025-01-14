<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 14.
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        #wrap {
            display: flex;
            justify-content: center; /* 수평 가운데 정렬 */
            height: 100vh; /* 화면 전체 높이 */
        }
        #table{
            width: 100%;
        }
        #table th{
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
            background-color: #222222;
            color: white;
            height: 30px;
        }
        #content{
           margin: 0;
            margin-top: 100px;
        }
        #table td{
            border: 1px solid #999999;
            border-collapse: collapse;
            text-align: center;
        }
        .stock {
            width: 80px;
        }
    </style>
</head>
<body>
<jsp:include page="./layout/header.jsp"></jsp:include>
<div id="wrap">
    <div id="search">
    </div>
    <div id="content">
        <table id="table">
            <colgroup>
                <col width="80px">
                <col width="100px">
                <col width="*">
                <col width="120px">
                <col width="120px">
                <col width="100px">
            </colgroup>
            <tr>
                <th>상품번호</th>
                <th>사진</th>
                <th>상품이름</th>
                <th>재고</th>
                <th>활성화</th>
                <th>삭제</th>
            </tr>
            <tr>
                <td>10</td>
                <td><img src="${pageContext.request.contextPath}/seller/images/product1.jpg" class="card-img-top" alt="Product Image"></td>
                <td><a href="">Sunground Hoody - 4COL</a></td>
                <td>
                    <label id="label_stock">재고 : 50</label><br/>
                    <input  class="stock" type="number" name="stock"/>
                    <button type="button" onclick="save()">변경</button>
                </td>
                <td>
                    <select id="active">
                        <option value="1">판매</option>
                        <option value="2">판매중지</option>
                    </select>
                </td>
                <td><button type="button" onclick="delete()">삭제</button></td>
            </tr>
        </table>
    </div>
</div>
<script>
    $(function(){
        function save(){
            $.ajax({
                url:changeStock.jsp,
                type: 'post',
                dataType : 'json',
            }).done(res){

            }
        }
    });
</script>
</body>
<footer>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>
</html>
