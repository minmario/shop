<%--
  Created by IntelliJ IDEA.
  User: aaa
  Date: 25. 1. 24.
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var ="mdcl"  items="${dar}">
    <tr>
        <td><input type="checkbox"></td>
        <td>${mdcl.major_no}</td>
        <td>${mdcl.name}</td>
        <td>${mdcl.type}</td>

    </tr>
</c:forEach>
