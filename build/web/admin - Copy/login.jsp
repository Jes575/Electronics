<%-- 
    Document   : login
    Created on : 2 Jul, 2015, 8:50:49 PM
    Author     : jeose_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>


<%
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    String uname=request.getParameter("uname");
    String pwd=request.getParameter("passwd");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/electronics","root","mysql");
    }
    catch(ClassNotFoundException e){
        e.printStackTrace();
    }
    st=con.createStatement();
    String qry="SELECT * FROM logintb where uname = '"+ uname +"' and password = '"+ pwd +"'";
    rs=st.executeQuery(qry);
    while(rs.next())
    {
        if(rs.getString(3).equals("admin"))
        {
             response.sendRedirect("addInventory.jsp");
        }
        else if(rs.getString(3).equals("user"))
        {
            session.setAttribute("uname",rs.getString(1));
            String url=(String)session.getAttribute("url");
            response.sendRedirect(url);
        }
        else
        {
            
        %>
        <%@include file="adminlogin.jsp" %>
        <p>Invalid uname or password</p>
        <%
            break;
        }
    }
    
    
   


%>