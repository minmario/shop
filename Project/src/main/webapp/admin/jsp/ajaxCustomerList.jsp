<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 25. 1. 31.
  Time: 오전 2:36
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var ="cusl"  items="${cusar}">
    <tr>

        <td>${cusl.grade_no}</td>
        <td>${cusl.cus_id}</td>

        <td>${cusl.name}</td>
        <td>${cusl.nickname}</td>
        <td>${cusl.gender}</td>
        <td>${cusl.birth_date}</td>
        <td>${cusl.phone}</td>
        <td>${cusl.email}</td>
        <td>${cusl.weight}</td>
        <td>${cusl.height}</td>
        <td>${cusl.total}</td>
        <td>${cusl.grade_expire_date}</td>




    </tr>
</c:forEach>

