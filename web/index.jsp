<%-- 
    Document   : index1
    Created on : 21 Jul, 2015, 9:56:35 PM
    Author     : jeose_000
--%>
<%@include file="header.jsp" %>
<%@page import="database.MSConnection" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Electronics</title>
        <link rel="stylesheet" href="css/navi1.css" type="text/css"/>
        <!--link rel="stylesheet" href="css/slider.css" type="text/css" /-->
       
        <script type="text/javascript" src="slider/swfobject.js"></script>
        <script type="text/javascript">
        var flashvars = {};
        flashvars.cssSource = "slider/piecemaker.css";
        flashvars.xmlSource = "slider/piecemaker.xml";
        var params = {};
        params.play = "false";
        params.menu = "false";
        params.scale = "showall";
        params.wmode = "transparent";
        params.allowfullscreen = "true";
        params.allowscriptaccess = "sameDomain";
        params.allownetworking = "all";
        swfobject.embedSWF('slider/piecemaker.swf', 'piecemaker', '960', '430', '10', null, flashvars, params, null);
</script>
<%
MSConnection ms=new MSConnection();
Connection con=ms.Connection();
%>
    </head>
    <body>
        <div class="col-12 outerborder">
            <div class="col-1 leftspace"></div>
            <div class="col-10 contentsborder">
                <div class="col-12 slider">
                    <div class="featured_slide">
                    <div id="piecemaker"><img src="images/demo/piecemaker/1.jpg" alt="" /></div>
                    <div class="t" ><img src="images/demo/piecemaker/t.png" /></div>
                    <div class="t" ><img src="images/product/ka.png" /></div>
                    </div>
                </div>
                <% Statement ss=con.createStatement();
                   ResultSet rss=ss.executeQuery("select count(*) from moduletb");
                   rss.next();
                   int count=rss.getInt(1);
                   int cn=0;
                   while(cn<=count)
                   { 
                   %>
                <div class="col-12 modulesborder">
                    <%
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from moduletb limit 3 offset "+ cn +"");
                    
                    while(rs.next()){%>
                    <div class="col-4 module">
                        <div class="col-12 modulehead"><a href="searchInfo.jsp?view=1&page=1&module=<%=rs.getString("modulename")%>"><%=rs.getString("modulename")%></a></div>
                        <div class="col-12 moduleimage">
                            <div class="slider">
                                <figure>
                                   <%
                                    Statement st1=con.createStatement();
                       
                                    ResultSet rs1=st1.executeQuery("select * from moduleimage where modname='"+ rs.getString("modulename") +"'");
                                    rs1.beforeFirst();
                                    while(rs1.next()){
                                   %>
                                   <a href="searchInfo.jsp?view=1&page=1&module=<%=rs.getString("modulename")%>"><img src="images/modules/<%=rs1.getString("modImage")%>"/></a>
                                   <%}%>  
                                </figure>
                            </div>
                        </div>
                        <div class="col-12 modulelink">
                                <%
                                    Statement st2=con.createStatement();
                                    ResultSet rs2=st2.executeQuery("select * from categorytb where modulename='"+ rs.getString("modulename") +"'");
                                    rs2.beforeFirst();  
                                    while(rs2.next())
                                    {  
                                    %> 
                                    
                                    <li style="list-style:url(images/pointer.png)"><a href="searchInfo.jsp?view=1&page=1&module=<%=rs.getString("modulename")%>&category=<%=rs2.getString("category")%>"><%=rs2.getString("category")%></a></li>                               
                                   <%}%>  
                        </div>
                    </div>
                    <%}%>
                    
                </div>
                    <%
                   cn+=3;}%>
                <div class="col-12 newarrivalborder">
                    <div class="col-6 newarrival">                       
                        <fieldset class="arrival">
                        <legend>New Arrivals</legend>
                       <% 
                       try { 
                        Statement st=con.createStatement();
                        ResultSet rs=null;
                        rs=st.executeQuery("SELECT * FROM `products`");
                         int i=0;  
                         while(i<6)
                         {
                          i++;
                          if(rs.next()) { %>
                             <div class="col-4 boxnew">
                                 <a href="productDetails.jsp?code=<%= rs.getString("code") %>">
                                 <img src="images/<%=rs.getString("pimage") %>" name="<%= rs.getString("pname") %>" alt="images/<%=rs.getString("pimage") %>" width="100%" height="110px" />
                                 <p style="margin-top:0px;"><%= rs.getString("pname") %></p>
                                 </a>
                             </div> <%
                             }
                          }
                        rs.close();
                         con.close();
                        }
                        catch(Exception e) {
                        e.printStackTrace();
                       }
                    %>                        
                    </div>
                     <div class="col-6 comingsoon">
                        <fieldset class="arrival">
                            <legend>Coming Soon</legend>
                            <% 
                       try { 
                        Statement st1=con1.createStatement();
                        ResultSet rs1=null;
                        rs1=st1.executeQuery("SELECT * FROM `products`");
                         int i=0;  
                         while(i<6)
                         {
                          i++;
                          if(rs1.next()) { %>
                             <div class="col-4 boxnew">
                                 <a href="productDetails.jsp?code=<%= rs1.getString("code") %>">
                                 <img src="images/<%=rs1.getString("pimage") %>" name="<%= rs1.getString("pname") %>" alt="images/<%=rs1.getString("pimage") %>" width="100%" height="110px" />
                                 <p style="margin-top:0px;"><%= rs1.getString("pname") %></p>
                                 </a>
                             </div> <%
                             }
                          }
                        rs1.close();
                         con1.close();
                        }
                        catch(Exception e) {
                        e.printStackTrace();
                       }
                    %>                        
                    </div>
                        </fieldset>
                    </div>
                </div>
                
            </div>
        </div>
        <div class="col-12 footerborder">
         <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
