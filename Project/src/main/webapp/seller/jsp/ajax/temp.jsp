<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="comm.vo.ProductVO" %><%@ page import="java.util.HashMap"%><%@ page import="java.util.Map"%>

<%
    ProductVO[] ar = (ProductVO[]) request.getAttribute("ar");
    Gson gson = new Gson();
    Map<String, Object> responseMap = new HashMap<>();
    responseMap.put("ar", ar);
    String json = gson.toJson(responseMap);
%>
<%= json %>