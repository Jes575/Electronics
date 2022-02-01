<%-- 
    Document   : addmodule
    Created on : 22 Jul, 2015, 9:47:28 AM
    Author     : jeose_000
--%>
<%@page import="java.sql.*"%>
<%@page import="database.MSConnection"%>
<%@include file="adminheader.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Module</title>
        <script type="text/javascript">
            function validatef1()
            {
                var name=document.forms["f1"]["modname"].value;
                if(name=="" || name==null)
                {
                    alert("Enter the module name...");
                    return false;
                }
            }
            function validatef2()
            {
                var name=document.forms["f2"]["link"].value;
                if(name=="" || name==null)
                {
                    alert("Enter link value...");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        
        <div>
        <form name="f1"  method="get" onsubmit="return validatef1()">
            <fieldset>
                <legend>Add Module</legend>
            Module Name<input type="text" name="modname"/>
            <br/>
            <input type="submit" name="submit" value="submit1"/>
            </fieldset>
        </form>
        </div>
        <br/>
        <div>
            <form name="f2" method="get" onsubmit="return validatef2()">
                <fieldset>
                <legend>Add Module Links</legend>
               Select Module: <select name="mod">
                    <option value="one">One</option>
                     <option value="one">One</option>
                      <option value="one">One</option>
                </select><br/>
               Add link value:<input type="text" name="link"/><br/>
               <input type="submit" name="submit" value="submit2"/>
                </fieldset>
            </form>
        </div>
        <%
            MSConnection ms=new MSConnection();
               Connection con=ms.Connection();
               Statement st=con.createStatement();
            String sub=request.getParameter("submit");
           out.print(sub);
            if(sub == "submit1")
             //if(sub.isEmpty())
              {
               String modname=request.getParameter("modname");
               st.executeUpdate("insert into moduletb values('1','"+ modname +"')");
               out.print("lhh");
              }
               else
              {
              String modname=request.getParameter("mod");
              String modlink=request.getParameter("link");
               st.executeUpdate("insert into modulelinktb values('"+ modname +"','"+ modlink +"')");
              }
               
          
            
            %>
    </body>
</html>
