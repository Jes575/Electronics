<%-- 
    Document   : productDetails
    Created on : Jul 13, 2015, 11:46:55 PM
    Author     : Ajay
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Product Details</title>
<style type="text/css">

*{
    box-sizing: border-box;
}

.row:after {
    content: "";
    clear: both;
    display: block;
}

[class*="col-"] {
    float: left;
    padding: 0px 15px;
    border:1px solid #FFF;
}
.col-1 {width: 7.33%;}
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

/******* Head Link *********/
.headLink {
	padding-bottom: 5px;
}
.headLink ul li {
	float: left;
	list-style:none;
}

.headLink ul .product {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 10pt;
}
.headLink ul .module, .headLink ul .module a:visited  {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 10pt;
	color:#006;
}
.headLink ul .module a:hover {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 10pt;
	color:#06F;
}
.headLink ul .category11, .headLink ul .category11 a:visited  {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 10pt;
	color:#006;
}
.headLink ul .category11 a:hover {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 10pt;
	color:#06F;
}

.headLink ul .home, .headLink ul .home a:visited  {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 10pt;
	color:#006;
}
.headLink ul .home a:hover  {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 10pt;
	color:#06F;
}

/***** Product details *****/

.col-12 .col-12.body .col-10.productDetails .col-4.productImgBox {
	/*background-color: #E8E8E8;*/
	float: left;
	height: 300px;
	padding-top: 0px;
}

.col-12.body .col-10.productDetails .col-8.productInfo .col-12.productName {
	padding: 0px;
	padding-left:15px;
	padding-bottom:10px;
	margin-top: 10px;
}

.col-12.body .col-10.productDetails .col-8.productInfo .col-12.productName h1 {
	font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
	font-size:1.7em;
	font-style:normal;
	font-weight:normal;
	margin:0px;
}
.col-12 .col-12.body .col-10.productDetails .col-8.productInfo {
	/*background-color: #EFEFEF;*/
	padding: 0px 10px 0px 10px; /*top right bottom left  */
}



.col-12 .col-12.body .col-10.productDetails .col-8.productInfo .col-12.productLink ul li , .col-12.productLink a {
	text-decoration: none;
	float: left;
	list-style-type: none; 
	color: #333;
	font-weight:bold;
}
</style>
</head>

<body>
    <div class="col-12"><%@include file="header.jsp" %></div>
    <% 
    MSConnection mscon=new MSConnection();
    Connection con=mscon.Connection();
    Statement st=con.createStatement();
    String url1=request.getRequestURL().toString();
    String qrs=request.getQueryString();
    url1+="?" + qrs;
    session.setAttribute("url",url1);
    String srchcode=request.getParameter("code");
    ResultSet rs=st.executeQuery("select * from products where code='" + srchcode + "'");
    if(rs.next()) {
    %>
    <div class="col-12">
            <div class="col-12 header">
            <div class="col-1"></div>
            <div class="col-10 headLink">
                <ul>
                    <li class="home">
                            <a href="index.jsp" title="Go to Home Page">Home</a>
                                        <span>/ </span>
                        </li>
                    <li class="module">
                        <a href="searchInfo.jsp?view=1&page=1&module=<%=rs.getString("module")%>" title=""><%=rs.getString("module") %></a>
                                        <span>/ </span>
                        </li>
                    <li class="category11">
                            <a href="searchInfo.jsp?view=1&page=1&module=<%=rs.getString("module")%>&category=<%=rs.getString("category")%>" title=""><%=rs.getString("category") %></a>
                                        <span>/ </span>
                        </li>
                    <li class="product">
                            <strong><%=rs.getString("pname") %></strong>
                       </li>
              </ul>
            </div>
            <div class="col-1"></div>
            </div>
        <div class="col-12 body">
            <div class="col-1"></div>
            <div class="col-10 productDetails">
                    <div class="col-4 productImgBox">
                    <img src="images/<%=rs.getString("pimage") %>" alt="<%=rs.getString("pname") %>" name="pimage" height="300px" width="100%" />
                </div> 
                <div class="col-8 productInfo">                
                    <div class="col-12 productName">
                        <h1><%=rs.getString("pname") %></h1>
                    </div>
                    <div class="col-12 short-description" style="border-top:1px solid #666;">
                        <div class="std"><p style="text-align: justify;"><span><%=rs.getString("description") %></span></p>		
                        </div>
                    </div>
                    <div class="col-12">Availability: <span>In stock</span></div>
                    <div class="col-4 priceBox">
                                <span class="price">Rs. <%=rs.getString("price") %>/-</span>
                    </div>
                    <div class="col-8 add-to-cart">
                       
                        <% 
                        String link1;
                        if(session.getAttribute("uname")=="" || session.getAttribute("uname")==null)
                            link1="loginpage.jsp";
                        else
                            link1="addtocart.jsp";
                        %>
                        <form method="post" action=<%=link1%>>
                            <!--span>Qty: </span>
                            <input type="text" size="5" name="qty" maxlength="4" value="1" /-->
                            <input type="hidden" name="pname" value="<%=rs.getString("pname")%>"/>
                            <input type="hidden" name="pcode" value="<%=rs.getString("code")%>"/>
                            <% if(rs.getInt("quantity")<1) out.print("<span style=\"color:#ff0000;\">Out of Stock!</span>"); else { %>
                            <input type="submit" name="AddtoCart" value="Add to Cart"  />
                            <% } %>
                        </form>
                    </div>
                    <div class="col-12 productLink">
                        <ul class="addToLinks">
                            <li><a rel="nofollow" href="" onClick="" class="link-wishlist">Add to Wishlist | </a></li>
                            <li><a rel="nofollow" href="" class="link-compare">&nbsp;Add to Compare</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% }
    rs.close();
    con.close();
    %>
    <div class="col-12"></div>
    <div class="col-12"><%@include file="footer.jsp" %></div>
</body>
</html>