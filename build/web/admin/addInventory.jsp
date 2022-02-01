
    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.MSConnection"%>
<%@page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<title>Untitled Document</title>
</head>

<body>
    <div style="width: 80%;margin: 0px auto; "><%@include file="adminheader.jsp" %></div>
    <div ><p>&nbsp;</p><p>&nbsp;</p>
        
    
  <table width="37%" cellspacing="3" align="center">
  <tr style=" background-color: #eee;">
      <td></td>
      <td style="font-size:22px;font-weight:bold;padding: 2% 0%;font-family: comic sans ms, sans-serif;">Add Inventory</td>
  </tr>
      <tr>
          <td id="names" width="40%">Select Module :</td>
          <td id="fields" width="60%">
               <%
            MSConnection ms=new MSConnection();
            Connection con=ms.Connection();
            Statement st1=con.createStatement();
            String modsel=request.getParameter("modules");
            ResultSet rs=st1.executeQuery("select * from moduletb"); %>
            <form action="#" method="get">
                <select name="modules" onchange="this.form.submit()">
                    <option value="">-----------------------Select------------------</option>
                    <%  while(rs.next()) { %>
                    <option value="<%=rs.getString(2) %>" <% if(rs.getString(2).equals(modsel)) out.print("selected"); else out.print("");  %>><%= rs.getString(2) %></option>
                    <% } 
                    rs.close();
                    %>
                </select>
            </form>
          </td>
       </tr>
                <%
                    String mod=null;
                if(request.getParameter("modules")!=null)
                {
                    mod=request.getParameter("modules");
                }
                %>
                <form action="../Insert" name="myForm" id="myform" method="post" enctype="multipart/form-data">
         <tr style=" background-color: #eee;">
          <td id="names">Product Type :</td>
                 <td id="fields">
                     <input type="hidden" name="module" value="<%=mod %>" />
                     <select name="type" required="required"> <!--onchange="return validatef1()"-->
                     <option value="">-----------------------Select------------------</option>
                     <%
                        ResultSet rs1=st1.executeQuery("select * from categorytb where modulename='" + mod + "'");
                        while(rs1.next())
                        {%>
                        <option value="<%=rs1.getString("category") %>"><%=rs1.getString("category")%></option>
                     <%}
                     rs1.close();
                     con.close();
                     %> 
                </select>
                <!--input type="hidden" name="types" id="types" value="" /-->
               </td>
       </tr>  
       <tr>
          <td id="names" width="40%">Product Code :</td>
          <td id="fields" width="60%">
          <input type="text" name="code" size="30" required="required" /></td>
       </tr>
       <tr style=" background-color: #eee; border-right: 2px solid #eee;">
          <td id="names">Product Name :</td>
          <td id="fields">
          <input name="pname" type="text" required size="30"/></td>
       </tr>
       <tr>
          <td id="names">Date :</td>
          <td id="fields">
           <input type="date" name="date" required="required" /></td>
       </tr>
       <tr style=" background-color: #eee;">
          <td id="names">Quantity :</td>
          <td id="fields">
           <input type="text" name="pqty" size="30" required /></td>
       </tr>
        <tr>
          <td id="names">Product Description :</td>
          <td id="fields">
          <textarea name="pdesc" required  rows="3" cols="32"></textarea></td>
       </tr>
       <tr style=" background-color: #eee;">
          <td id="names">Product Image Name :</td>
          <td id="fields"><input name="pimage" required type="file" /></td>
       </tr>
       <tr>
          <td id="names">Price :</td>
          <td id="fields">
            <input type="text" name="price" size="30" required /></td>
       </tr>
        
       <tr>
          <td>&nbsp;</td>
          <td id="fields" style="padding:8px;" ><input  type="submit" name="submit"value="Add This Item"/></td>
       </tr>
    </form>
  </table>

    </div>
</body>
</html>