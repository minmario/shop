<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 25. 1. 24.
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
category_no, seller_no, type, grade_code, name, sale_per, sale_price, start_date, end_date, status
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var ="coul"  items="${car}">
    <tr>
        <td><input type="checkbox"></td>
        <td>${coul.root_no}</td>
        <td>${coul.category_no}</td>
        <td>${coul.seller_no}</td>
        <td>${coul.type}</td>
        <td>${coul.grade_code}</td>
        <td>${coul.name}</td>
        <td>${coul.sale_per}</td>
        <td>${coul.sale_price}</td>
        <td>${coul.start_date}</td>
        <td>${coul.end_date}</td>
        <td>${coul.status}</td>


        <td><button class="btn btn-outline-secondary btn-sm">수정</button>
            <button class="btn btn-outline-secondary btn-sm">삭제</button></td>
    </tr>
</c:forEach>
