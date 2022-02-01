<%-- 
    Document   : usersignup
    Created on : 19 Jul, 2015, 11:58:56 AM
    Author     : jeose_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="database.MSConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User signup</title>
        <script type="text/javascript">
            function validate()
            {
                /*var name=document.forms["f1"]["name"].value;
                var uname=document.forms["f1"]["uname"].value;
                var pswd=document.forms["f1"]["pwd"].value;
                var confirm=document.forms["f1"]["confirm"].value;
                if(name=="" || name==null || uname=="" || uname==null || pswd=="" || pswd==null )
                {
                    alert("All fields are mandatory... Please fill in all the fields");
                    return false;
                }
                if(pswd!=confirm)
                {
                    alert("Password does not match");
                    return false;
                }
                var mob=document.forms["f1"]["mob"].value;
                if(mob.length!=10 || mob=="" || mob==null)
                {
                    alert("enter valid mobile number..");
                    return false;
                }*/
              return true;
            }
        </script>
    </head>
    <body>
        <form name="f1" method="get" onsubmit="return validate()">
            <table border="2px bold">
             <tr>
                 <td> Name :</td><td> <input type="text" name="name"/></td>
            </tr>
            <tr>
                <td> Username:</td><td><input type="text" name="uname"/></td>
            </tr> 
            <tr>
                <td>Password:</td><td><input type="password" name="pwd"/></td>
            </tr>
            <tr>
                <td>Confirm:</td><td><input type="password" name="confirm"/></td>
            </tr>
            <tr>
                <td>Email ID:</td><td><input type="email" name="email"/></td>
            </tr>
            <tr>
                <td>Mob NO:</td><td><input type="text" name="mob"/></td>
            </tr>
            <tr>
                <td colspan="2"><center> <input type="submit" value="SUBMIT" name="submit"/></center></td>
            </tr>
            </table>
        </form>
        <%
            MSConnection ms=new MSConnection();
            Connection con=ms.Connection();
            Statement st=con.createStatement();
            String name,uname,pwd,email,mob,sub;
            sub=request.getParameter("submit");
            if(sub!=null)
            {
            name=request.getParameter("name");
            uname=request.getParameter("uname");
            pwd=request.getParameter("pwd");
            email=request.getParameter("email");
            mob=request.getParameter("mob");
            if(name==""|| uname=="" || pwd=="" || email=="" || mob=="")
            {
                 out.print("some fields are empty");
                response.sendRedirect("usersignup.jsp");   
            }
            else
            {
            String qry="insert into usertb values('"+ name +"','"+ uname +"','"+ email +"','"+ mob +"')";
            String qry1="insert into logintb values('"+ uname +"','"+ pwd +"','user')";
            int s=st.executeUpdate(qry);
            st.executeUpdate(qry1);
            if(s==1)
            {
                response.sendRedirect("admin/adminlogin.jsp");
            }
            }
            }
            %>
    </body>
</html>
