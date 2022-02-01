<%-- 
    Document   : addModuleImage
    Created on : Jul 22, 2015, 11:07:16 AM
    Author     : Ajay
--%>

<%@page import="java.sql.*"%>
<%@page import="database.MSConnection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="moduleimages">
        <%
            MSConnection ms=new MSConnection();
            Connection con=ms.Connection();
            Statement st1=con.createStatement();
            ResultSet rs=st1.executeQuery("select * from moduletb"); %>
            <form action="#" method="post">
                Select Module : <select name="modules" onchange="this.form.submit()">
                    <option value="--Select--">--Select--</option>
            <%  while(rs.next()) { %>
            <option value="<%= rs.getString(2) %>"><%= rs.getString(2) %></option>
            <% } 
            rs.close();
            %>
            </select>
            </form>
        </div>
    </body>
</html>
