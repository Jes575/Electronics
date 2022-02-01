<%-- 
    Document   : upload
    Created on : 15 Jul, 2015, 1:48:05 PM
    Author     : jeose_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>


<%
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    String name=request.getParameter("name");
    String file=request.getParameter("file");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/electronics","root","mysql");
    }
    catch(ClassNotFoundException e){
        e.printStackTrace();
    }
    st=con.createStatement();
    String query="insert into filetb values('"+ name +"','"+ file +"')";
    //String qry="SELECT * FROM logintb where uname = '"+ uname +"' and password = '"+ pwd +"'";
    int s=st.executeUpdate(query);
    %>