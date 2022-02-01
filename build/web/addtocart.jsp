<%-- 
    Document   : addtocart
    Created on : 19 Jul, 2015, 10:42:17 PM
    Author     : jeose_000
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="database.MSConnection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    MSConnection ms=new MSConnection();
    Connection con=ms.Connection();
    Statement st=con.createStatement();
    String cart=request.getParameter("AddtoCart");
    if(cart!="")
    {
        String uname,pname,pcode;
        uname=session.getAttribute("uname").toString();
        pname=request.getParameter("pname");
        pcode=request.getParameter("pcode");
        DateFormat dt = new SimpleDateFormat("dd-MM-yyyy");
        java.util.Date date = new java.util.Date();
        String qry="insert into carttb values('"+ uname +"','"+ pname +"','"+ pcode +"','"+ dt.format(date) +"')";
        st.executeUpdate(qry);
        response.sendRedirect(session.getAttribute("url").toString());
    }
%>