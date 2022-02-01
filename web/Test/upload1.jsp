<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        
        <a href="upload1.jsp?view=1"><img src="../images/grid_view_icon.gif" name="grid" onclick="changeview()"/></a>
        <a href="upload1.jsp?view=2&valu=23"><img src="../images/list_view.png"/></a>
        <%
            int view1=Integer.parseInt(request.getParameter("view"));
            if(view1==1){%>
        <div>
            <form action="page.jsp" method="post">
                Name:<input type="text" name="name"/>
                File:<input type="text" name="file"/>
                <input type="submit"/>
            </form>
            <a href="newpage.jsp?page=1">nextpage</a>
        </div>
        <%}
            else{%>
           
        <div>
            Welcome
        </div>
        <%}%>
        
        
        
    </body>
</html>
