<%-- 
    Document   : placeorder
    Created on : Jul 29, 2015, 10:58:11 PM
    Author     : Ajay
--%>

<%@page import="java.sql.*"%>
<%@page import="database.MSConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            * {
                box-sizing: border-box;
            }

            .row:after {
                content: "";
                clear: both;
                display: block;
            }

            [class*="col-"] {
                float: left;
                padding: 0.1% 0.5%;
                border:1px solid #000;
            }
            .col-1 {width: 8.33%;}
            .col-2 {width: 16.66%;}
            .col-3 {width: 25%;}
            .col-4 {width: 33.33%;}
            .col-5 {width: 41.66%;}
            .col-6 {width: 50%;}
            .col-7 {width: 58.33%;}
            .col-8 {width: 66.67%;}
            .col-9 {width: 75%;}
            .col-10 {width: 83.33%;}
            .col-11 {width: 91.66%;}
            .col-12 {width: 100%;}
        </style>
    </head>
    <body>
        <div class="col-12">
            <div class="col-12">
                <div class="col-1"></div>
                <div class="col-10">
                    <% 
                        MSConnection ms=new MSConnection();
                        Connection con=ms.Connection();
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery("select * from products where code='" + request.getParameter("code") + "'");
                        Statement st2=con.createStatement();
                        ResultSet rs2=st2.executeQuery("select * from addressbook where addno=" + request.getParameter("addnumber"));
                        if(rs.next()) { %> 
                            <!--div class="col-6 products" style="border-right:1px solid #666;"-->
                            <div class="col-2 image"><img src="images/<%= rs.getString("pimage") %>" height="100" width="100" alt="<%=rs.getString("pname") %>" /></div>
                            <div class="col-2">Product Name : <span style="text-transform:capitalize; color:#900;"><%=rs.getString("pname") %></span></div>
                            <div class="col-2"><span>Price : Rs. <%=rs.getString("price") %>/-</span></div>
                            <div class="col-2"><span>Quantity : <%= request.getParameter("quantity") %></span></div>
                            <div class="col-2" style="padding-top:15px;"><span>Total Price: Rs. <%= rs.getDouble("price")*(Integer.parseInt(request.getParameter("quantity"))) %>/-</span></div>
                        <% } %>             
                </div>
            </div>
                <div class="col-12">
                    <div class="col-1"></div>
                    <div class="col-10">
                        <% if(rs2.next()) { %>
                        
                        <% } %>
                    </div>
                </div>
        </div>
    </body>
</html>
