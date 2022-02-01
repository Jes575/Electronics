<%-- 
    Document   : checkout
    Created on : 20 Jul, 2015, 3:39:51 PM
    Author     : jeose_000
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
                //border:1px solid #000;
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
            
           
            .col-2.placeorder #order {
                font-family: Calibri, "Calibri Light", "Comic Sans MS";
                font-size: 13pt;
                font-weight: bold;
                display: block;
                border-radius:3px;
                background: #0CF;
                border-width:thin;
                width: 110px;
                height: 30px;
                outline: none;
                margin-top: -2px;
            } 
			
            .col-7.products  {
                padding-bottom: 0px;
                padding-top: 0px;
                padding-left: 0px;	
            }
            .col-7.products .col-2.image {
                font-family: Verdana, Geneva, sans-serif;
                text-decoration: none;
                padding-bottom: 0px;
                padding-top: 0px;
            }
        .col-11.header {
			font-family: Verdana, Geneva, sans-serif;
			font-size: 11pt;
			font-weight: bold;
			color: #900;
			background-color: #E8E8E8;
			//text-align: center;
			vertical-align: middle;
			padding-top: 10px;
			padding-bottom: 10px;
			border: 1px solid #666;
		}

        .col-7 .col-11.body {
			font-family: Verdana, Geneva, sans-serif;
			font-size: 11pt;
			text-decoration: none;
			background-color: #F2F2F2;
			border: thin solid #666;
			margin-top:-5px;
		}
		
		.col-4.addressbox {
			width:320px;
			background:#EBEBEB;
			border:1px solid #000;
		}
        
 		.col-12 .col-4 .address input,span {
			font-family: Calibri, "Calibri Light", "Comic Sans MS";
			font-size: 13pt;
			display: block;
			float:left;
			margin: 5px;
			font-weight: bold;
			border-radius: 3px;
			border-width: thin;
			padding-left: 5px;
}
		.col-12 .col-4 .address span { padding-bottom: 15px; font-size: 15pt; 
		font-weight: bolder;}
			.col-12 .col-4 .address button {
				font-family: Calibri, "Calibri Light", "Comic Sans MS";
				font-size: 12pt;
				font-weight: bold;
				display: block;
				border-radius:3px;
				background: #0CF;
				border-width:thin;
				width: 100px;
				height: 25px;
				outline: none;
				margin-top: 5px;
				margin-left: 5px;
				margin-bottom: 10px;
			}
        .col-4.addressbox .col-12.addlist button {
			font-family: Calibri, "Calibri Light", "Comic Sans MS";
			font-size: 12pt;
			font-weight: bold;
			border-radius:3px;
			background: #0CF;
			border-width:thin;
			width: 150px;
			height: 25px;
			outline: none;
			margin-top: 5px;
			margin-left: 5px;
			margin-bottom: 10px;
		}
		
		.col-4.addressbox .col-12.addlist input ,.col-4.addressbox .col-12.addlist { 
			font-family: Calibri, "Calibri Light", "Comic Sans MS";
			font-size: 13pt;
			display: block;
			float:left;
			margin: 5px;
			font-weight: bold;
			border-radius: 3px;
			border-width: thin;
			padding-left: 5px;
		}
		
        </style>
        <script type="text/javascript">
            function addchange()
            {
                var value=document.forms["adds"]["rdadd"].value;
                document.forms["f1"]["addnumber"].value=value;
                //alert(value);
            }
        </script>
    </head>
    <body>
        <div class="col-12">
            <div class="col-7">
                <div class="col-12">
                    <div class="col-1"></div>
                    <div class="col-11 header">
                        <div class="col-6 headproduct">Product(s)</div>
                        <div class="col-2 headprice">Price</div>
                        <div class="col-2 headqty">Quantity</div>
                        <div class="col-2 headbutton">Place orders</div>
                    </div>
                </div>
                <%
                MSConnection mscon=new MSConnection();
                Connection con=mscon.Connection();
                Statement st,st2;
                st2=con.createStatement();
                st=con.createStatement();
                ResultSet rs2;
                ResultSet rs=st.executeQuery("select * from carttb where username='" + session.getAttribute("uname") + "'");
                while(rs.next()) {
                    rs2=st2.executeQuery("select * from products where code='" + rs.getString("code") + "'");
                    if(rs2.next()) { 
                %>
                <div class="col-12">
                    <div class="col-1"></div>
                    <div class="col-11 body">
                        <div class="col-6 products" style="border-right:1px solid #666;">
                            <div class="col-4 image"><a href="productDetails.jsp?code=<%=rs.getString("code") %>"><img src="images/<%= rs2.getString("pimage") %>" height="100" width="100" alt="<%=rs2.getString("pname") %>" /></a></div>
                            <div class="col-8" style="padding-top:15px;"><a href="productDetails.jsp?code=<%=rs.getString("code") %>" style="text-decoration:none;"><span style="text-transform:capitalize; color:#900;"><%=rs2.getString("pname") %></span></a></div>
                        </div>
                        <div class="col-2" style="padding-top:15px;"><span>Rs. <%=rs2.getString("price") %>/-</span></div>
                        <form action="placeorder.jsp?code=<%= rs.getString("code") %>" name="f1" method="post">
                        <div class="col-2" style="padding-top:15px;">
                            <input type="hidden" name="addnumber" value="1" />
                            <% if(rs2.getInt("quantity")<1) {
                                out.print("<span style=\"color:#ff0000;\">Out of Stock!</span>");
                            } else { %>
                            <input type="text" name="quantity" size="4" value="1" list="quantity" />
                            <datalist id="quantity">
                            <% 
                                for(int i=1;i<=rs2.getInt("quantity");i++) {
                            %>
                                <option value="<%=i %>"><%=i %></option>
                            <% } %>
                            </datalist>
                            <% } %>
                            <!--input type="text" name="qty" value="1" size="5" maxlength="4" /--></div>
                        <div class="col-2 placeorder" style="padding-top:12px;"><button type="submit" name="order" id="order">Place order</button></div>
                        </form> 
                    </div>
                </div>
                <%      
                    }
                    }
                //rs.close();
                
                %>
            </div>
            <div class="col-4 addressbox">
                <%
                    if("0".equals(request.getParameter("add"))) {
                        Statement st3=con.createStatement();
                        ResultSet rs3=st3.executeQuery("select count(*) from addressbook where uname='" + session.getAttribute("uname") + "'");
                        if(rs3.next()) {
                            if(rs3.getInt(1)>0)
                            { %>
                            <div class="col-12 addlist">
                                <div class="col-12">Address Book</div>
                                <form name="adds" action="checkout.jsp?add=1" method="post">
                                <% 
                                Statement st4=con.createStatement();
                                ResultSet rs4=st4.executeQuery("select * from addressbook where uname='" + session.getAttribute("uname") + "'");
                                while(rs4.next()) {
                                    %>
                                <div class="col-12">
                                    <input type="radio" name="rdadd" onchange="addchange()" id="rd<%=rs4.getInt(1) %>" value="<%=rs4.getInt(1) %>" /><label for="rd<%=rs4.getInt(1) %>"><%=rs4.getString("address") %></label>
                                </div>
                                <%
                                }
                                //rs4.close();
                                %>
                                <span>Or</span>
                                <div class="col-12">
                                    <button type="submit" name="addAdds">Add new Address</button>
                                </div>
                                </form>
                            </div>
                        <%  }
                            else
                            {
                    %>
                    <div class="col-12 address">
                        <script type="text/javascript">
                            document.getElementById('order').setAttribute("style","visibility:hidden");
                        </script>
                        <%@include file="addressadding.jsp"%>
                    </div>
                    <% }  } 
                    } else { %>
                    <div class="col-12 address">
                        <%@include file="addressadding.jsp"%>
                    </div>
                       <% } 
                       con.close();
                       %>
            </div>
        </div>
    </body>
</html>