<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@page import="database.MSConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css"> 
	table {
		margin-top: 0px;
		border: 1px solid #F00;
		width: 80%;
		background:#fffffc;
                font-family: comic sans ms, sans-serif;
                font-size: 12pt;
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

<body><div>
        <table align="center">
            <caption style="margin: 0px auto; margin-bottom: 15px; padding-left: 20px;"><%@include file="adminheader.jsp" %></caption>
            <tr><th width="8%">Product Code</th><th width="12%">Product Name</th><th width="10%">Date</th><th width="8%">Product Quantity</th><th width="25%">Product Description</th><th width="12%">Product Image Name</th><th width="10%">Price</th><th width="10%">Product Type</th><th width="5%">Update Inventory</th></tr>	
        <% 
        try {
            MSConnection mscon=new MSConnection();
            Connection con=mscon.Connection();
            /*if(!request.getParameter("code").isEmpty())
            {
                Statement stdel=con.createStatement();
                ResultSet rs=stdel.executeQuery("select pimage from `products` where code='" + request.getParameter("code") + "'");
                if(rs.next())
                {
                    String appPath = request.getServletContext().getRealPath("");
                    appPath=appPath.substring(0, appPath.indexOf("\\build\\web"));
                    appPath = appPath + "\\web\\images\\" + rs.getString("pimage");
                    File f=new File(appPath);
                    f.delete();
                }
                stdel.executeUpdate("delete from `products` where code='" + request.getParameter("code") + "'");
            }*/
            String qry="SELECT * FROM `products`";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(qry);
            int i=0;
            while(rs.next()) { 
                if(i==0) { %>
                 <tr style="background-color: <% out.print("#eee"); %> ">
                <% i=1; 
                } else { %>
                    <tr style="background-color: <% out.print("#ffffff"); %> ">
                <%    i=0;
                } %>
                <td><%=rs.getString(1) %> </td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getInt(4) %></td>
                <td><%=rs.getString(5) %></td>
                <td><%=rs.getString(6) %></td>
                <td><%=rs.getDouble(7) %></td>
                <td><%=rs.getString(8) %></td>
                <td><button onclick="window.open('editItems.jsp?code=<%=rs.getString(1) %>','Update Items','width=500,height=400')">Update Item</button></td>
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