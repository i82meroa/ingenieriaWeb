<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="datos.DAOUsuario"%>
<jsp:useBean  id="customerBean" scope="session" class="bean.CustomerBean"></jsp:useBean>
	<%
	DAOUsuario.cambiarPlan(customerBean.getNombreUsuario(), "Premium");
	String nextPage = "../../index.jsp";
	String mensajeNextPage = "";
	%>
	<jsp:setProperty property="plan" value="Premium" name="customerBean"/>
	<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=mensajeNextPage%>" name="message"/>
	</jsp:forward>
