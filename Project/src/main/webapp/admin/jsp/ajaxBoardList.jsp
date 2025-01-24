<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 25. 1. 23.
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var ="bl"  items="${bar}">
    <tr>
        <td><input type="checkbox"></td>
        <td>${bl.cus_no}</td>
        <td>${bl.prod_no}</td>
        <td>${bl.bname}</td>
        <td>${bl.title}</td>
        <td>${bl.content}</td>
        <td>${bl.snapshot_image}</td>
        <td>${bl.tags}</td>
        <td>${bl.gender}</td>
        <td>${bl.season}</td>
        <td>${bl.style}</td>
        <td>${bl.score}</td>
        <td>${bl.like_count}</td>
        <td>${bl.write_date}</td>
        <td>${bl.is_del}</td>
        <td>${bl.additional_images}</td>


        <td><button class="btn btn-outline-secondary btn-sm">수정</button>
            <button class="btn btn-outline-secondary btn-sm">삭제</button></td>
    </tr>
</c:forEach>
