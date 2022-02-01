<%-- 
    Document   : testing
    Created on : Jul 2, 2015, 8:41:51 PM
    Author     : Ajay
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        hello<div>
        <%
            try {
            Class.forName("com.mysql.jdbc.Driver"); 
            }
            catch (ClassNotFoundException e) {
                e.printStackTrace();}
            try {
                
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/electronics","root","");
                Statement st=con.createStatement();
                ResultSet rs=null;
                rs=st.executeQuery("SELECT * FROM `products`");
                if(rs.next()) { 
                    out.print("Hello");
                    //byte[] imgData=null;
                    //Blob photo = rs.getBlob(2);
                    //InputStream photo=rs.getBinaryStream(2);
                    //int rd=photo.read();
                    //imgData = photo.getBytes(1,(int)photo.length());
                    //response.setContentType("image/jpg");
                    //response.setHeader("Content-Disposition", "inline");
                    //response.setContentLength(imgData.length);
                    //OutputStream os = response.getOutputStream(); 
                    //os.write();
                    //os.write(rs.getBytes(2)); 
                    %>
                    <%= rs.getString(5) %>
                    <img src="../images/<%= rs.getString(5) %>" width="200" height="200" />
                    <%
                    //os.flush();
                    //OutputStream output = response.getOutputStream();
                    //output.write(rd);

                    //output.flush();
                    //output.close();
                    
                    /*OutputStream o = response.getOutputStream();
                    o.write(imgData);
                    o.flush();
                    o.close();
            /*byte[] rb = null;
            InputStream readImg = rs.getBinaryStream(2);
                    int index = readImg.read();
                    //System.out.println("Index.........." + index);
 
                    response.setContentType("image/jpg");
                    OutputStream o=response.getOutputStream();
                    o.write(index);
                    o.flush();
            /*Blob photo = rs.getBlob("image"); 
            imgData = photo.getBytes(1,(int)photo.length());
            response.setContentType("image/jpg");
            OutputStream o = response.getOutputStream();
            o.write(imgData);
            o.flush();*/
            //o.close();
            /*byte[] rb = null;
            InputStream readImg = rs.getBinaryStream(2);
            int index = readImg.read();
            //System.out.println("Index.........." + index);

            response.setContentType("image/jpg");
            OutputStream o=response.getOutputStream();
            o.write(index);
            o.flush();*/
            }
        }
       catch(Exception ex) {
           ex.printStackTrace();
       }
                    %></div>
    </body>
    
</html>
