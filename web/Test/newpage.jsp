


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.PreparedStatement"  %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement"%>

<%
    Connection con=null;
    int numPages;
    try{
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ec","root","mysql");
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
  
    
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select count(*) from logintb");
        rs.next();
        int count=rs.getInt(1);
       // numPages=23;//count/3+1;
       // out.print(numPages);
        %>
        <div style="border: 2px solid #000;float: left;display: block">
            
            <%
              numPages=23; 
            int currentpage=Integer.parseInt(request.getParameter("page"));
            int j=currentpage;
            if(currentpage>3)
            {
                %>
                <a href="newpage.jsp?page=<%=j-4%>"><<</a>
                <%
            }
            int i;
            if(j-1>=1)
               i=j-1;
            else
                i=j;
            for(;i<=j+3&&i<=numPages;i++){%>
               <a href="newpage.jsp?page=<%=i%>"><%=i%></a>
            <%}
            
              if(i<numPages){%>
                <a href="newpage.jsp?page=<%=i+5%24%>">>></a>
               <%}%>
        </div>

    
    </body>
</html>
