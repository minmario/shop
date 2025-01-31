<%@ page import="com.mysql.cj.x.protobuf.MysqlxCrud" %>
<%@ page import="comm.vo.OrderVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%-- JSON표기법 --%>
<%
    Object obj = request.getAttribute("vo");
    if(obj!=null){
        OrderVO vo = (OrderVO) obj;
        System.out.println("json: "+vo.getName());
%>
{
"cus_id":"<%=vo.getCus_id()%>",
"name":"<%=vo.getName()%>",
"order_no":"<%=vo.getId()%>",
"option":"<%=vo.getOption_name()%>"
}
<%
    }
%>