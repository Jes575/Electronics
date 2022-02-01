<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<div class="col-12 blockTitle"><span>Billing Address</span></div>
<form name="address" action="#" method="post">
    <div class="col-12"><input type="email" size="30" name="email" id="email" placeholder="Email Address" required="required" /><label for="email">*</label></div>    
    <div class="col-12"><input type="text" name="address" id="address" size="30" placeholder="Address" required="required" /><label for="address">*</label></div>
    <div class="col-12"><input type="text" name="city" id="city" placeholder="City" size="30" required="required" /><label for="city">*</label></div>
    <div class="col-12"><input type="text" name="country" placeholder="Country" size="30" required="required" /><label for="country">*</label></div>
    <div class="col-12"><input type="text" name="state" placeholder="State" size="30" required="required" /><label for="state">*</label></div>
    <div class="col-12"><input type="text" name="mob" placeholder="Mobile No." size="30" required="required" /><label for="mob">*</label></div>
    <div class="col-12"><input type="text" name="postcode" placeholder="Postal Code" size="30" required="required" /><label for="postcode">*</label></div>
    <div class="col-6"><button type="submit" name="addAddress">Add Address</button></div>
    <div class="col-6"><a href="checkout.jsp?add=0" style="text-decoration: none; display: block; vertical-align: center; text-align: center; background: #00cccc; padding: 5px; border: 1px thin #000; color: #000; width: 90px; margin-top: 5px;">Cancel</a></div></form>
<%
    if(request.getParameter("addAddress")!=null) {
        Statement stadd=con.createStatement();
        ResultSet rsadd=stadd.executeQuery("select max(addno) from addressbook where uname='" + session.getAttribute("uname") + "'");
        if(rsadd.next()) {
            if(rsadd.getInt(1)>9)
            {
                out.print("Cannot add more than 10 address list...");
            }
            else {
                String qry="insert into addressbook values(" + (rsadd.getInt(1)+1) + ",'" + session.getAttribute("uname") + "','" + request.getParameter("email") + "','" + request.getParameter("address") + "','" + request.getParameter("city") + "','" + request.getParameter("country") + "','" + request.getParameter("state") + "'," + Long.parseLong(request.getParameter("mob")) + "," + Integer.parseInt(request.getParameter("postcode")) + ")";
                stadd.executeUpdate(qry);
                response.sendRedirect("checkout.jsp?add=0");
            }
        }
    }
%>
