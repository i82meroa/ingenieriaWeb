<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean  id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>
	<%
	request.getSession().invalidate();
	String nextPage = "../../index.jsp";
	String mensajeNextPage = "";
	%>
	<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=mensajeNextPage%>" name="message"/>
	</jsp:forward>
