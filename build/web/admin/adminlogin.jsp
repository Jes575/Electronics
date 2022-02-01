<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="../css/login.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
  <div class="wrap" align="center">
      <form name="login" method="post" action="login.jsp"> 
		<div class="avatar">
      <img src="../images/User-icon.png">
		</div>
               
		<input type="text" placeholder="username" name="uname" required>
	<div class="bar">
			<i></i>
		</div>
		<input type="password" name="passwd" placeholder="password" required>
                <button type="submit" name="submit" >Sign in&nbsp;&nbsp;&nbsp;<a href="../usersignup.jsp">New User?..</a></button>
        </form>
	</div>
    </body>
</html>
