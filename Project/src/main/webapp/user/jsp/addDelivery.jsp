<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2025-01-14
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #wrap-title{
            width: 700px;
            margin: 0 auto;

        }

        .info{
            background-color: #777777;
            text-align: center;

        }

        #delivery-info{
            border-collapse: collapse;
            width: 700px;
            margin: 0 auto;
        }

        #delivery-info tr, #delivery-info td{
            border: 1px solid black;
        }

        #delivery-info td{
            padding: 5px;
        }

        #tfoot{
            border-top: 1px black;
        }
    </style>
</head>
<body>
<jsp:include page="./layout/header.jsp"></jsp:include>
    <div class="border-bottom pb-2 mb-3">
        무신사 > 내 정보 > 배송지 관리 > 배송지 추가
    </div>
    <div id="wrap-title">
        <h4>배송지 추가</h4>
    </div>
    <hr/>
    <div id="wrap-table">
        <table id="delivery-info">
            <tbody>
                <tr>
                    <td class="info">이름</td>
                    <td><input type="text"/></td>
                </tr>
                <tr>
                    <td class="info">연락처</td>
                    <td><input type="text"/></td>
                </tr>
                <tr>
                    <td class="info">주소</td>
                    <td>
                        <input type="text" placeholder="우편번호"/>
                        <button class="btn btn-primary" type="submit">주소검색</button><br/>
                        <input type="text" placeholder="주소"/><br/>
                        <input type="text" placeholder="상세주소"/><br/>
                    </td>
                </tr>
                <tr>
                    <td class="info">배송 요청사항 (선택)</td>
                    <td>
                        <select id="select" name="select">
                            <option selected="selected">:: 배송 요청사항을 선택하세요 ::</option> <!--가장 먼저 작성하는 것이 선택되기 때문에 selected로 지정한다. -->
                            <option value="1">문 앞에 놔주세요</option>
                            <option value="2">경비실에 맡겨주세요</option>
                            <option value="3">택배함에 넣어주세요</option>
                            <option value="4">배송 전에 연락주세요</option>
                            <option value="5">직접 입력</option>
                        </select>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr id="tfoot">
                    <td colspan="2">
                        <input type="checkbox" id="chk" name="chk" value="1"/>
                        <label for="chk">기본 배송지로 설정</label>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
    <br/>
</body>
<footer>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>
</html>
