<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="database.MSConnection"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Electronics Items</title>
<link rel="stylesheet" href="css/header.css" type="text/css" />
</head>
<body>
<!-------Top submenu---------->
<% 
     MSConnection ms1=new MSConnection();
     Connection con1=ms1.Connection();
          String value,link,check,user,userlink;
          
          if(session.getAttribute("uname")=="" || session.getAttribute("uname")==null)
          {
              String url1=request.getRequestURL().toString();
              String qs=request.getQueryString();
              if(qs!=null)
                  url1+="?" + qs;
              session.setAttribute("url", url1);
              value="Login";
              link="loginpage.jsp";
              check="#";
              user="My Account";
              userlink="loginpage.jsp";
             
          }
          else
          {
             value="Logout"; 
             link="admin/logout.jsp";
             check="checkout.jsp?add=0";
             user=session.getAttribute("uname").toString();
             userlink="Myaccount.jsp"; 
             
          }
      %>
<div id="mainheader">
<div id="header">
    <ul id="topnav">
        <li><a href=<%=userlink%>><%=user%></a></li>
      <li><a href="loginpage.jsp">My Wishlist</a></li>
      <li><a href="pages/full-width.html">My Cart</a></li>
      <li><a href="<%=check %>">Checkout</a></li>
      <li class="last"><a href=<%=link%>><%=value%></a>
      </li>
    </ul>
    <br class="clear" />
</div>
<!-------Logo------>
<div id="headerlogo">
 <img src="images/TheElectronicStore.png" />
</div>
<!----------Cart----------->
<div id="headercart">
    <%
      
       int items=10;
       String qr,un;
       if(session.getAttribute("uname")=="" || session.getAttribute("uname")==null)
        {
          items=0;  
        }
       else
        {
          Statement st=con1.createStatement();
          un=(String)session.getAttribute("uname");
          qr="Select count(*) from carttb where username='"+ un +"'";
          ResultSet r=st.executeQuery(qr);
          r.next();
          items=r.getInt(1);
        }
       
    
    %>
    <form action="<%=check%>" method="post">
    <label> <%=items%> items in cart.</label>
        <input type="submit" name="button" value="Checkout"/>
</form>
</div>
<!---------search------>
<script type="text/javascript">
    function check() {
    var x = document.forms["f1"]["searchtxt"].value;
    
    if (x == "Search..." || x == null || x == "") {
       // alert("Enter some");
        return false;
    }
}
</script>
<div id="headersearch">
<form action="searchInfo.jsp" name="f1" onsubmit="return check()" method="get" >
  <select name="search">
      <option value="All">All</option>
                  <%
                  Statement ssss=con1.createStatement();
                  ResultSet rrrr=ssss.executeQuery("select * from categorytb");
                while(rrrr.next())
                   {%>
                    <option value=<%=rrrr.getString("id")%>><%=rrrr.getString("category")%></option>
                  <%}%> 
              
  </select>
    <input type="hidden" value="1" name="view"/>
    <input type="hidden" value="1" name="page"/>
    <input type="text" name="searchtxt" value="Search..." onfocus="this.value=(this.value=='Search...')? '' : this.value ;" id="txtinput"/>
        <input type="image" id="go" src="images/search.gif" alt="Search" />  
    
</form>
</div>

<!-----------Header Menu------->
<div id="headermenu">
  <ul id="topnav">
    <li class="active"><a href="index.jsp">Home</a></li>
     
      <li><a href="#">Interfacing Board</a>
        <ul>
          <li><a href="#">Link 1</a></li>
          <li><a href="#">Link 2</a></li>
          <li><a href="#">Link 3</a></li>
        </ul>
      </li>
      <li><a href="pages/full-width.html">Modules</a></li>
      <li><a href="pages/style-demo.html">Wireless</a></li>
       <li class="last"><a href="#">Development Board</a></li>
       <li><a href="pages/full-width.html">Sensors</a></li>
      <li><a href="pages/style-demo.html">Diy Kits</a></li>
       <li class="last"><a href="#">Components</a></li>
      
    </ul>
    <br class="clear" />
    <br />
</div>
</div>
</body>
</html>
