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
    <jsp:include page="./layout/header.jsp"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        #nav_product{
            background-color:#dddddd;
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
            vertical-align: middle;
        }
        .stock {
            width: 80px;
        }
        .center{
            text-align: center;
        }
        .filter-section {
            margin-bottom: 20px;
        }
        .product-image {
            width: 100px;
            height: 80px;
            object-fit: cover; /* 이미지를 100x100으로 잘라줌 */
        }
        .flex{
            display: flex;
        }
        .search{
            height: 40px;
            margin-top: 23px;
            margin-left: 5px;}
        .form-group{
            margin-right: 10px;
        }
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    session.setAttribute("seller_no","434384");
%>
<div class="container mt-5">
    <h3 class="center">상품/재고 관리</h3>
    <hr/>
    <div id="search">
    </div>
    <div id="content" class="table-container">
        <form method="post" action="Controller">
            <div class="filter-section">
                <div class="form-row flex">
                    <div class="form-group col-md-3">
                        <label for="category">카테고리</label>
                        <select id="category" name="category" class="form-control">
                            <option value="0">전체</option>
                            <option value="1">상의</option>
                            <option value="2">하의</option>
                            <option value="3">아우터</option>
                            <option value="4">신발</option>
                            <option value="5">악세사리</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3" >
                        <label for="prod_name">검색어</label>
                        <input type="text" class="form-control" id="prod_name" name="prod_name">
                    </div>
                    <button type="submit" class="btn btn-primary mb-4 search" onclick="searchProduct(this.form)">조회</button>
                </div>
            </div>
        </form>
        <table id="table" class="table table-bordered">
            <colgroup>
                <col width="90px">
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
            </thead>
            <tbody>


            <tr>
                <td>10</td>
                <td><img src="${pageContext.request.contextPath}/seller/images/product1.jpg" class="card-img-top product-image" alt="Product Image"></td>
                <td><a href="Controller?type=productEdit&prod_no=3&cPage=1">Sunground Hoody - 4COL</a></td>
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
                <td><button type="button" onclick="deleteRecord(this)">삭제</button></td>
            </tr>
            <tr>
                <td>10</td>
                <td><img src="${pageContext.request.contextPath}/seller/images/product2.jpg" class="card-img-top product-image" alt="Product Image"></td>
                <td><a href="">조던 부루클린 플리스 팬츠</a></td>
                <td>80,000원</td>
                <td>60,000원</td>
                <td>
                    <label id="label_stock2">재고 : 20</label><br/>
                    <input  class="stock" type="number" name="stock"/>
                    <button type="button" onclick="changeStock(this)">변경</button>
                </td>
                <td>
                    <select id="active2">
                        <option value="1">판매</option>
                        <option value="2">판매중지</option>
                    </select>
                </td>
                <td><button type="button" onclick="deleteRecord(this)">삭제</button></td>
            <c:forEach var="vo" items="${ar }" varStatus="vs">
                <tr>
                    <td>${vo.prod_no}</td>
                    <td style="text-align: left">
                        <a href="Controller?type=productEdit&b_idx=${vo.prod_no}&cPage=${pvo.nowPage}">
                                ${vo.prod_name}
                        </a>
                    </td>
                    <td>${vo.price }</td>
                    <td>${vo.sale_price }</td>
                    <td>
                        <label id="label_stock3">재고 : ${vo.inventory}</label><br/>
                        <input  class="stock" type="number" name="stock"/>
                        <button type="button" onclick="changeStock(this)">변경</button>
                    </td>
                    <td>
                        <select id="active3">
                            <option value="1">판매</option>
                            <option value="2">판매중지</option>
                        </select>
                    </td>
                    <td><button type="button" onclick="deleteRecord(this)">삭제</button></td>

                </tr>
            </c:forEach>
            <c:if test="${ar eq null or fn:length(ar) eq 0 }">
                <tr>
                    <td colspan="8">현재 등록된 데이터가 없습니다.</td>
                </tr>
            </c:if>

            </tbody>
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
                           onclick="javascript:location.href='Controller?type=productNew'"/>
                </td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>
    function changeStock(button){
        // 버튼에서 가장 가까운 행(Row) 찾기
        const row = $(button).closest('tr');

        // 필요한 데이터 가져오기
        const prodNo = row.find('td:first').text().trim(); // 상품 번호 (첫 번째 셀)
        const stockInput = row.find('input[name="stock"]'); // 입력 필드
        const newStock = stockInput.val(); // 입력된 값

        if (!newStock || isNaN(newStock) || newStock < 0) {
            alert("유효한 재고 수량을 입력해주세요.");
            return;
        }

        // Ajax 요청 보내기
        $.ajax({
            url: "Controller?type=changeStock", // 서버에서 처리할 URL
            type: "POST",
            data: "stock="+encodeURIComponent(newStock)+
                "&prodNO"+encodeURIComponent(prodNo),
            success: function(response) {
                // 서버 응답 처리
                if (response.success) {
                    alert("재고가 성공적으로 변경되었습니다.");
                    row.find('label[id^="label_stock"]').text("재고 : " + newStock);
                } else {
                    alert("재고 변경에 실패했습니다. 다시 시도해주세요.");
                }
            },
            error: function() {
                alert("서버와 통신 중 오류가 발생했습니다.");
            }
        });
    }function deleteRecord(button) {
        // 버튼에서 가장 가까운 행(Row) 찾기
        const row = $(button).closest('tr');

        // 필요한 데이터 가져오기
        const prodNo = row.find('td:first').text().trim(); // 상품 번호 (첫 번째 셀)

        if (!confirm("정말로 이 상품을 삭제하시겠습니까?")) {
            return;
        }

        // Ajax 요청 보내기
        $.ajax({
            url: "Controller?type=deleteProduct", // 서버에서 처리할 URL
            type: "POST",
            data: "prodNo=" + encodeURIComponent(prodNo),
            success: function(response) {
                // 서버 응답 처리
                if (response.success) {
                    alert("상품이 성공적으로 삭제되었습니다.");
                    row.remove(); // 삭제된 행 제거
                } else {
                    alert("상품 삭제에 실패했습니다. 다시 시도해주세요.");
                }
            },
            error: function() {
                alert("서버와 통신 중 오류가 발생했습니다.");
            }
        });
    }
    function searchProduct(frm) {
        // 카테고리와 검색어 가져오기
        const category = frm.category.value;
        const prod_name = frm.prod_name.value;
        console.log("${pageContext.request.contextPath}/seller/images/product1.jpg");
        let param = "type=searchProduct&category="+encodeURIComponent(category)+"&prod_name="+encodeURIComponent(prod_name);
        // Ajax 요청 보내기
        $.ajax({
            url: "Controller",
            type: "POST",
            data: param,
            dataType: "json",
        }).done(function(res){
            // 기존 테이블 데이터 비우기
            const tableBody = $("#table tbody");
            tableBody.empty();

            // 검색 결과가 있는 경우
            if (response.products && response.products.length > 0) {
                response.products.forEach(product => {
                    const row = `
                    <tr>
                        <td>${product.prodNo}</td>
                        <td>
                            <img src="${product.imagePath}" class="card-img-top product-image" alt="Product Image">
                        </td>
                        <td>${product.prodName}</td>
                        <td>${product.price.toLocaleString()}원</td>
                        <td>${product.salePrice.toLocaleString()}원</td>
                        <td>
                            <label>재고 : ${product.inventory}</label><br/>
                            <input class="stock" type="number" name="stock" value="${product.inventory}">
                            <button type="button" onclick="changeStock(this)">변경</button>
                        </td>
                        <td>
                            <select>
                                <option value="1" ${product.active == 1 ? "selected" : ""}>판매</option>
                                <option value="2" ${product.active == 2 ? "selected" : ""}>판매중지</option>
                            </select>
                        </td>
                        <td><button type="button" onclick="deleteRecord(this)">삭제</button></td>
                    </tr>`;
                    tableBody.append(row);
                });
            } else {
                // 검색 결과가 없는 경우
                const emptyRow = `
                <tr>
                    <td colspan="8" class="text-center">검색 결과가 없습니다.</td>
                </tr>`;
                tableBody.append(emptyRow);
            }
        })
            .fail(function(xhr, status, error) {
                // 오류 처리
                alert("검색 중 오류가 발생했습니다. 다시 시도해주세요.");
                console.error("AJAX Error:", status, error);
            });
        return false; // 폼 제출 방지
    }
</script>
</body>
<footer>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>
</html>
