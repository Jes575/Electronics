<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="header.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="database.*"%>


<%
MSConnection ms=new MSConnection();
Connection con=ms.Connection();
String url1=request.getRequestURL().toString();
String qrs=request.getQueryString();
url1+="?" + qrs;
session.setAttribute("url",url1);

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link rel="stylesheet" href="css/search.css" type="text/css" />
</head>
<body>
<!--div style="position:relative;height:1000px;border:2px solid #000"-->
<div class="col-12 outerborder">

<!-------------------Left Space-------->

<div class="col-1 leftspace">

</div>

<!-------------------Left Menu--------------->
<div class="col-2 leftmenu">
<h5>SELECT YOUR CURRENCY</h5>
<hr />
<select name="currency">
<option value="INR">Indian Rupee-INR</option>
<option value="USD">US Doller-USD</option>
<option value="EUR">Euro-EUR</option>
</select>
<h5>BROWSE BY</h5>
<hr />
<h5>Category</h5>
 <li><a href="#"> Relay Interfacing Board</a></li>
 <li><a href="#">  Stepper/ Servo/ Motor Driver</a></li>
 <li><a href="#">  Audio / Telephone Interfacing Boards</a></li>
  <li><a href="#"> Keypad / Joystick</a></li>
 <li> <a href="#"> Display Interfacing Board</a></li>
 <li> <a href="#"> More in Interfacing Board...</a></li>
</div>

<!------------Main contents----------->
    
      <%
       int view,currentpage,startfrom,limit,i;
       String head="";
       view=Integer.parseInt(request.getParameter("view"));
       currentpage=Integer.parseInt(request.getParameter("page"));
       String pname=request.getParameter("searchtxt");
       startfrom=(currentpage*3)-3;
       limit=3;
       String qry="select * from products limit "+ limit +" offset "+ startfrom +"";
       String qry1="select count(*) from products";
       Statement st=con.createStatement();
       
       if(request.getParameter("category")!=null)
       {
       head=request.getParameter("category");
       qry="select * from products where category='"+ request.getParameter("category") +"' and module='"+ request.getParameter("module") +"' limit "+ limit +" offset "+ startfrom +"";
       qry1="select count(*) from products where category='"+ request.getParameter("category") +"'";
       }
       else if(request.getParameter("module")!=null)
       {
           head=request.getParameter("module");
           qry="select * from products where module='"+ request.getParameter("module") +"' limit "+ limit +" offset "+ startfrom +"";
           qry1="select count(*) from products where module='"+ request.getParameter("module") +"'";
       }
       else if(request.getParameter("searchtxt")!=null)
       {
           if("All".equals(request.getParameter("search")))
           {
               qry="select * from products  where pname like '"+'%'+ pname +'%'+"' limit "+ limit +" offset "+ startfrom +"";
               qry1="select count(*) from products  where pname like '"+'%'+ pname +'%'+"'";
           }
           else
           {

               Statement ist=con.createStatement();
               ResultSet irs=ist.executeQuery("select category from categorytb where id='"+ request.getParameter("search") +"'");
               irs.next();
               String gg=irs.getString("category");
               head=gg;
              //out.print(gg);
              qry="select * from products where category='"+ gg +"' and  pname like '"+'%'+ pname +'%'+"' limit "+ limit +" offset "+ startfrom +"";
              qry1="select count(*) from products where category='"+ request.getParameter("search") +"' and  pname like '"+'%'+ pname +'%'+"' ";
           }
       }
           ResultSet rs=st.executeQuery(qry);
       %>
            
<div class="col-8 content">
    <div class="col-12 view">
        <div class="col-4 viewcontent1">
            <%
             String s=request.getQueryString();
             String ss=s.replaceAll("view=1", "view=2");  
             String s1=request.getQueryString();
             String ss1=s.replaceAll("view=2", "view=1");  
            %>
            <a href="searchInfo.jsp?<%=ss1%>"><img src="images/grid_view_icon.gif"/>Grid View</a>
            <a href="searchInfo.jsp?<%=ss%>"><img src="images/list_view.png" height="19px"/>List View</a>
        </div>
          <!---------------Paging--------------->
        
          <div class="col-4 viewpage">
             
            <%
            Statement st1=con.createStatement();
            ResultSet rs1=st1.executeQuery(qry1);
            rs1.next();
             int count=rs1.getInt(1);
             int numPages;
             if(count%3==0)
               numPages=count/3;
             else
                numPages=count/3+1;
             int j; 
            j=currentpage;
            if(currentpage>3)
            {
                %>
                <a href="searchInfo.jsp?page=<%=j-3%>&view=<%=view%>&searchtxt=<%=pname%>"><<</a>
                <%
            }
            if(j-1>=1)
               i=j-1;
            else
                i=j;
            
            for(;i<=j+3&&i<=numPages;i++){%>
               <a href="searchInfo.jsp?page=<%=i%>&view=<%=view%>&searchtxt=<%=pname%>"><%=i%></a>
            <%}
            
              if(i<numPages){%>
                <a href="searchInfo.jsp?page=<%=i+5%24%>&view=<%=view%>&searchtxt=<%=pname%>"> >> </a>
               <%}%>
       
        </div>   
    </div>           
   <div class="col-12 contenthead">
       <%if(head!=null){%>
       <h3><%=head%></h3>
       <%}%>
   </div>
      
 <!--------------Grid View---------------->
    <%
       
        if(view==1)
        {
    //for(i=1;i<=10;i++)
      while(rs.next())
   {%>
   <div class="col-4 info">
       <h3><%=rs.getString("pname")%></h3>
       <div style="border: 2px solid bisque;height:170px">
           <a href="productDetails.jsp?code=<%= rs.getString("code") %>"><img src="images/<%=rs.getString("pimage")%>" style="max-height: 170px"/></a>
       </div>
       <div class="col-12">
           Rs. <%=rs.getString("price")%>/-
            &nbsp;&nbsp;&nbsp; 
            <% 
            String link1;
            if(session.getAttribute("uname")=="" || session.getAttribute("uname")==null)
            {
                link1="loginpage.jsp";
            }
            else
                link1="addtocart.jsp";
             %>
             <form method="post" action=<%=link1%>>
                <input type="hidden" name="pname" value="<%=rs.getString("pname")%>"/>
                <input type="hidden" name="pcode" value="<%=rs.getString("code")%>"/>
                <% if(rs.getInt("quantity")<1) out.print("<span style=\"color:#ff0000;\">Out of Stock!</span>"); else { %>
                <input type="submit" name="AddtoCart" value="Add to Cart"  />
                <% } %>
            </form>
            
            <br/><img src="images/wishlist.png" style="width:12px;height:12px"/>Add to Wishlist
            <br/><img src="images/icon-compare.png.png" style="width:12px;height:12px"/> Add to Compare
       </div>
   </div>
    <%} 
    }  
    else
    {
         
     // for(i=1;i<=10;i++)
       while(rs.next())
        {%>
          <!----------------------List View----------------->
        <div class="col-12 listinfo">
           <h3> <%=rs.getString("pname")%></h3>
            <div class="col-4">
                <a href="productDetails.jsp?code=<%= rs.getString("code") %>"><img src="images/<%=rs.getString("pimage")%>" style="max-height: 170px"/></a>
            </div>
             <div class="col-6">
              Rs. <%=rs.getString("price")%>/-
              <% 
            String link1;
            if(session.getAttribute("uname")=="" || session.getAttribute("uname")==null)
            {
                link1="loginpage.jsp";
            }
            else
                link1="addtocart.jsp";
             %>
             &nbsp;&nbsp;&nbsp; 
                <form method="post" action=<%=link1%>>
                <input type="hidden" name="pname" value="<%=rs.getString("pname")%>"/>
                <input type="hidden" name="pcode" value="<%=rs.getString("code")%>"/>
                <% if(rs.getInt("quantity")<1) out.print("<span style=\"color:#ff0000;\">Out of Stock!</span>"); else { %>
                <input type="submit" name="AddtoCart" value="Add to Cart"  />
                <% } %>
            </form>
                <br/><img src="images/wishlist.png" style="width:12px;height:12px"/>Add to Wishlist
                <br/><img src="images/icon-compare.png.png" style="width:12px;height:12px"/> Add to Compare
             </div>
        </div>
         <%} 
    }%>
        
</div>


</div>
<div class="col-12 footerborder">
    <%@include file="footer.jsp" %>
</div>
</body>

</html>
