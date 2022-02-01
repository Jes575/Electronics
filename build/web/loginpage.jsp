<%-- 
    Document   : loginpage
    Created on : Jul 22, 2015, 11:40:36 PM
    Author     : Ajay
--%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.MSConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" type="text/css" href="css/loginpage.css" />
        <script type="text/javascript">
            function validate()
            {
                var ps=document.forms["signup"]["password"].value;
                var cp=document.forms["signup"]["confirm"].value;
                var mob=document.forms["signup"]["mob"].value;
                if(mob.length!==10)
                {
                    alert("Enter valid mobile number");
                    return false;
                }
                if(ps!=cp)
                {
                    alert("Password Does Not Match.....");
                    return false;
                }
                
            }
        </script>
        <%
           MSConnection ms=new MSConnection();
           Connection con=ms.Connection();
        %>
    </head>
    <body style="background-color: #EFEFEF">
        <div class="col-12 outertab">
			<div class="col-12 toptab"> 
                <div class="col-1"></div>        
                <div class="col-10">
                    <div class="col-6 firstdiv">
                        <a href="index.jsp"><img src="images/login_header.jpg" width="100%" height="100%" alt="Home Page" /></a>
                    </div>
                    <div class="col-6 logintab">
                    <p>User Login</p>
                        <form name="login" action="#" method="post">
                            <input type="text" name="logusernm" placeholder="User Name" required="required" />
                            <input type="password" name="logpassword" placeholder="Password" required="required" />
                            <button type="submit" name="submitlogin" value="SignIn">Sign in</button>
                        </form>
                        <%
                           if("SignIn".equals(request.getParameter("submitlogin")))
                           {
                             String uname=request.getParameter("logusernm");
                             String pwd=request.getParameter("logpassword"); 
                             String qry="SELECT * FROM logintb where uname = '"+ uname +"' and password = '"+ pwd +"'";
                             Statement st1=con.createStatement();
                             ResultSet rs=st1.executeQuery(qry);
                            while(rs.next())
                             {
                               if("admin".equals(rs.getString("type")))
                                  {
                                   response.sendRedirect("admin/addInventory.jsp");
                                  }
                                 else if("user".equals(rs.getString("type")))
                                  {
                                    session.setAttribute("uname",rs.getString(1));
                                    String url=(String)session.getAttribute("url");
                                   //out.print("Login Successfull");
                                    response.sendRedirect(url);
                                  }
                                  else
                                  {
                                       break;
                                  }
                              }%>
                              <br/><p>Invalid Username or Password...</p>
                            <%
                             }
                         %>
                    </div>
                </div>
            </div>    
            <div class="col-12 middletab">
				<div class="col-1"></div>        
            	<div class="col-10">
                	<div class="col-3"></div>
                    <div class="col-6 createtab">
                        <form name="signup" action="#" method="post" onsubmit="return validate()">
                        <h1>Create an account</h1>
                        <h4>It's free and always will be.</h4>
                            <input type="text" name="firstnm" placeholder="Full name" required="required" size="47%" />
                            <input type="email" size="47%" name="email" placeholder="Email"  required="required" />
                            <input type="text" name="mob" size="47%" placeholder="Mobile number" required="required" />
                            <input size="47%" type="text" name="usernm" placeholder="Username"  required="required" />
                            <input type="password" name="password" placeholder="Password"  required="required" size="47%" />
                            <input type="password" size="47%" name="confirm" placeholder="Confirm Password" required="required" />
                            <input type="submit" name="create" value="Create an account" />
                    	</form>
                        <%
                            //out.print(request.getParameter("create"));
                            if("Create an account".equals(request.getParameter("create")))
                            {
                               
                                Statement st=con.createStatement();
                                String name,surnm,uname,pwd,email,mob;
                                name=request.getParameter("firstnm");
                                uname=request.getParameter("usernm");
                                pwd=request.getParameter("password");
                                email=request.getParameter("email");
                                mob=request.getParameter("mob");
                                String qry="insert into usertb values('"+ name +"','"+ uname +"','"+ email +"','" + mob + "')";
                                String qry1="insert into logintb values('"+ uname +"','"+ pwd +"','user')";
                                int s=st.executeUpdate(qry);
                                st.executeUpdate(qry1);
                                if(s>0){%>
                                <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><p>You have registered successfully....</p>
                                <%
                                response.setIntHeader("Refresh", 1);
                               
                                }else
                                    out.print("Error...");
                                con.close();
                            }
                           
			%>
                    </div>
                    <div class="col-3"></div>
                </div>
            </div>       
        </div>
     <div class="col-12 footerborder">
</div>
    </body>
</html>
