<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 25. 1. 23.
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var ="mcl"  items="${ar}">
    <tr>
        <td><input type="checkbox"></td>
        <td>${mcl.name}</td>
        <td>${mcl.ename}</td>
        <td>${mcl.type}</td>
        <td><button class="btn btn-outline-secondary btn-sm">수정</button>
            <button class="btn btn-outline-secondary btn-sm">삭제</button></td>
    </tr>
</c:forEach>
