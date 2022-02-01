<%-- 
    Document   : editItems
    Created on : Jul 19, 2015, 12:32:15 AM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Items</title>
    </head>
    <body background="../images/page_background.jpg">
        <form method="post" action="#" name="myform">
<table id="outerTable">
<caption style="text-align:center; margin-bottom:5px;">
<h2>Update Inventory Item</h2></caption>
<%
String qry="select * from products where code='" +request.getParameter("code") + "'";
MSConnection mscon=new MSConnection();
Connection con=mscon.Connection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qry);
if(rs.next())
{
%>
<tr>
  <td width="120" height="31" id="label">Product Code : </td>
  <td width="164" height="31" id="pos"><input type="text" name="pcode" value="<%=rs.getString("code") %>" readonly="readonly" /></td>  
</tr>
<tr>
  <td width="120" height="31" id="label">Product Name :</td>
  <td width="164" height="31"  id="pos"><input type="text" name="name" value="<%=rs.getString("pname") %>"></td>  
</tr>
<tr>
  <td width="120" height="31" id="label">Date :</td>
  <td width="164" height="31" id="pos"><input type="date" name="date" value="<%=rs.getString("pdate") %>"></td>  
</tr>
<tr>
  <td width="120" height="31" id="label">Quantity :</td>
  <td width="164" height="31" id="pos"><input type="text" name="qty" value="<%=rs.getString("quantity") %>"></td>  
</tr>
<tr><td width="120" height="31" id="label">Description :</td><td width="164" id="pos"><textarea cols="30" rows="4" name="desc"><%=rs.getString("description") %></textarea></td></tr>
<tr>
  <td width="120" height="31" id="label">Price :</td>
  <td width="164" height="31" id="pos"><input type="text" name="price" value="<%=rs.getString("price") %>"></td>  
</tr>

<% }
    rs.close();
    con.close();
%>
<tr>
<td colspan="2" id="heading" align="center"><input type="submit" name="submit" value="  Update  "/></td>
</tr>
</table>
</form>
        <%
    if(request.getParameter("name")!=null)
    {
        String sql="UPDATE `products` SET `pname`='" + request.getParameter("name") + "', `pdate`='" + request.getParameter("date") + "',`quantity`=" + Integer.parseInt(request.getParameter("qty")) + ",`description`='" + request.getParameter("desc") + "',`price`=" + Double.parseDouble(request.getParameter("price")) + " where code='" + request.getParameter("pcode") + "'";
        con=mscon.Connection();
        st=con.createStatement();
        int n=st.executeUpdate(sql);
        if(n>0) {
            response.sendRedirect("editItems.jsp?code=" + request.getParameter("pcode"));
            out.print("Updated...");
        }
        else
            out.print("Not updated...");
    }
    %>
    </body>
</html>
