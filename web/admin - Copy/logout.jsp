<%-- 
    Document   : logout.jsp
    Created on : 20 Jul, 2015, 12:08:20 AM
    Author     : jeose_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("uname");
response.sendRedirect("../index.jsp");
%>
