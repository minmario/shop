<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 14.
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            width: 1100px;
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
            <tfoot>
            <tr>
                <td colspan="7">
                    <ol class="paging">
            <c:if test="${requestScope.page ne null}">
                <c:set var="pvo" value="${requestScope.page}"/>
                <c:if test="${pvo.startPage<pvo.pagePerBlock}">
                    <li class="disable"><</li>
                </c:if>
                <c:if test="${pvo.startPage >= pvo.pagePerBlock }">
                    <li><a href="Controller?type=list&cPage=${pvo.startPage - pvo.pagePerBlock }">&lt;</a></li>
                </c:if>
                <c:forEach begin="${pvo.startPage }" end="${pvo.endPage }"
                           varStatus="st">
                    <c:if test="${st.index eq pvo.nowPage }">
                        <li class="now">${st.index }</li>
                    </c:if>
                    <c:if test="${st.index ne pvo.nowPage }">
                        <li>
                            <a href="Controller?type=list&cPage=${st.index }">${st.index }</a>
                        </li>
                    </c:if>
                </c:forEach>
                <c:if test="${pvo.endPage < pvo.totalPage }">
                    <li><a href="Controller?type=list&cPage=${pvo.startPage+pvo.pagePerBlock }">&gt;</a></li>
                </c:if>
                <c:if test="${pvo.endPage >= pvo.totalPage }">
                    <li class="disable">&gt;</li>
                </c:if>
            </c:if>
                    </ol>
                </td>
                <td>
                    <input type="button" value="상품추가"
                           onclick="javascript:location.href='Controller?type=productEdit'"/>
                </td>
            </tr>
            </tfoot>
            <colgroup>
                <col width="80px">
                <col width="100px">
                <col width="*">
                <col width="100px">
                <col width="100px">
                <col width="150px">
                <col width="120px">
                <col width="80px">
            </colgroup>
            <thead>
            <tr>
                <th>상품번호</th>
                <th>사진</th>
                <th>상품이름</th>
                <th>가격</th>
                <th>할인</th>
                <th>재고</th>
                <th>활성화</th>
                <th>삭제</th>
            </tr>
            <tr>
                <td>10</td>
                <td><img src="${pageContext.request.contextPath}/seller/images/product1.jpg" class="card-img-top" alt="Product Image"></td>
                <td><a href="">Sunground Hoody - 4COL</a></td>
                <td>80,000원</td>
                <td>60,000원</td>
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
            <tr>
                <td>10</td>
                <td><img src="${pageContext.request.contextPath}/seller/images/product2.jpg" class="card-img-top" alt="Product Image"></td>
                <td><a href="">조던 부루클린 플리스 팬츠</a></td>
                <td>80,000원</td>
                <td>60,000원</td>
                <td>
                    <label id="label_stock2">재고 : 20</label><br/>
                    <input  class="stock" type="number" name="stock"/>
                    <button type="button" onclick="save()">변경</button>
                </td>
                <td>
                    <select id="active2">
                        <option value="1">판매</option>
                        <option value="2">판매중지</option>
                    </select>
                </td>
                <td><button type="button" onclick="delete()">삭제</button></td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="vo" items="${ar }" varStatus="vs">
                <tr>
                    <td>${pvo.totalRecord-((pvo.nowPage-1)*pvo.numPerPage+vs.index) }</td>
                    <td style="text-align: left">
                        <a href="Controller?type=view&b_idx=${vo.b_idx}&cPage=${pvo.nowPage}">
                                ${vo.subject }
                            <c:if test="${vo.c_list.size() > 0 }">
                                (${vo.c_list.size() })
                            </c:if>
                        </a>
                    </td>
                    <td>${vo.writer }</td>
                    <td>${vo.write_date }</td>
                    <td>${vo.hit }</td>
                </tr>
            </c:forEach>
            <c:if test="${ar eq null or fn:length(ar) eq 0 }">
                <tr>
                    <td colspan="8">현재 등록된 데이터가 없습니다.</td>
                </tr>
            </c:if>

            </tbody>
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
