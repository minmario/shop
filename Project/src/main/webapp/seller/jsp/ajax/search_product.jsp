<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page import="comm.vo.ProductVO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj = request.getAttribute("ar");
	if(obj != null){
		ProductVO[] ar = (ProductVO[])obj;
		JSONObject jsonList = new JSONObject();
		JSONArray itemList = new JSONArray();
		int i =0;
		for(ProductVO vo : ar){
			JSONObject json = new JSONObject();
			json.put("prod_no",vo.getId());
			json.put("prod_image",vo.getProd_image());
			json.put("prod_name",vo.getName());
			json.put("price",vo.getPrice());
			json.put("sale",vo.getSale());
			json.put("inventory",vo.getInventory());
			json.put("active",vo.getActive());
			json.put("is_del",vo.getIs_del());
			//{"empno":"1007,"ename":"Michael",...)
			itemList.put(json);
		}
			jsonList.put("items",itemList);

	}
%>