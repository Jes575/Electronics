<%-- 
    Document   : InventoryItems
    Created on : Jul 11, 2015, 11:53:58 PM
    Author     : Ajay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.MSConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>JSP Page</title>
        <style type="text/css"> 
			table {
                margin-top: 0px;
				border: 1px solid #F00;
				width: 80%;
               	background:#fffffc;
                font-family: comic sans ms, sans-serif;
			}
			td, th {
				color: #530053;
				padding-bottom: 8px;
                                padding: 5px;
                                text-align: left;
				/*border-top: 1px solid #09F;
				border-right: 1px solid #03F; */
			}
                        th {
                            //border-right: 1px solid #000; 
                            border-bottom: 1px solid #000; 
                        }
		</style>
    </head>
    <body> 
        <div>
        <table align="center">
            <caption style="margin: 0px auto; margin-bottom: 15px; padding-left: 20px;"><%@include file="adminheader.jsp" %></caption>
            <tr style="background: #eee;">                
                <th width="8%">Product Code</th>
                <th width="12%">Product Name</th>
                <th width="10%">Date</th>
                <th width="8%">Product Quantity</th>
                <th width="25%">Product Description</th>
                <th width="12%">Product Image Name</th>
                <th width="10%">Price</th>  
                <th width="10%">Category</th>
                <th width="8%">Module</th>
               
            </tr>
        <% 
        try {
            
            MSConnection mscon=new MSConnection();
            Connection con=mscon.Connection();
            String qry="SELECT * FROM `products`";
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(qry);
			int  i=0;
            while(rs.next()) { 
                if(i==0) { %>
                <tr style="background-color: <% out.print("#fff"); %> ">
                <% i=1; 
                } else { %>
                    <tr style="background-color: <% out.print("#eee"); %> ">
                <%    i=0;
                } %>
                <td><%=rs.getString("code") %> </td>
                <td><%=rs.getString("pname") %></td>
                <td><%=rs.getString("pdate") %></td>
                <td><%=rs.getInt("quantity") %></td>
                <td><%=rs.getString("description") %></td>
                <td><%=rs.getString("pimage") %></td>
                <td><%=rs.getDouble("price") %></td>
                <td><%=rs.getString("category") %></td>
                 <td><%=rs.getString("module") %></td>
                </tr> <%
            }
            //out.print("<tr><td colspan='6' align='center'>No Pending Requests</td></tr>");
            rs.close();
            con.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        %>
        </table>
	</div>

    </body>
</html>
