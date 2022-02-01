<%-- 
    Document   : addmodule
    Created on : 22 Jul, 2015, 9:47:28 AM
    Author     : jeose_000
--%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
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
                else
                {
                    alert("Inserted Successfully");
                    return true;
                }
                
                
            }
            function validatef2()
            {
                var name=document.forms["f2"]["category"].value;
                if(name=="" || name==null)
                {
                    alert("Enter link value...");
                    return false;
                }
               else
                {
                    alert("Inserted Successfully");
                    return true;
                }
            }
             function validatef3()
            {
                var name=document.forms["f3"]["modules"].value;
                if(name=="" || name==null)
                {
                    alert("All fields are mandatory");
                    return false;
                }
               else
                {
                    alert("Inserted Successfully");
                    return true;
                }
            }
        </script>
        <%
            MSConnection ms=new MSConnection();
            Connection con=ms.Connection();
            Statement st1=con.createStatement();
            ResultSet rs=st1.executeQuery("select * from moduletb");
        %>
    </head>
    <body>
        <!-------------Adding module--------------->
        <div class="col-12">
        <div class="col-12">
        <form name="f1"  method="get" onsubmit="return validatef1()">
            <fieldset class="col-6">
                <legend>Add Module</legend>
                Module Name:<input type="text" name="modname" required="true"/>
            <br/>
            <input type="submit" name="submit" value="submit1"/>
            </fieldset>
        </form>
        </div>
        
            <!---------------Adding Category------------------>
            <div class="col-12">
            <form name="f2" method="get" onsubmit="return validatef2()">
                <fieldset class="col-6">
                <legend>Add Category For Each Module</legend>
               Select Module: <select name="mod" required="true">
                     <option value=""><---select---></option>
                     <%
                        while(rs.next())
                        {%>
                        <option value=<%=rs.getString("modulename")%>><%=rs.getString("modulename")%></option>
                     <%}%> 
                </select><br/>
               Add Category:<input type="text" name="category" required="true"/><br/>
               <input type="submit" name="submit" value="submit2"/>
                </fieldset>
            </form>
             </div>
            
            <!-----------------Adding image-------------->
            
            <div class="col-12">
                 <form name="f3" method="post" enctype="multipart/form-data" onsubmit="return validatef3()">
                     <fieldset class="col-6">
                     <legend>Add Module Images</legend>
                     Select Module : <select name="modules" required="true">
                                        <option value=""><---select---></option>
                                           <%
                                            rs.beforeFirst();
                                            while(rs.next())
                                             {%>
                                                 <option value=<%=rs.getString("modulename")%>><%=rs.getString("modulename")%></option>
                                           <%}%> 
                     </select><br/><br/>
                       Choose Image: <input type="file" name="image" required="true"/><br/><br/>
                        <input type="submit" name="isubmit" value="Upload Image" />
                     </fieldset>
                  </form>
            <%
               
                if(request.getContentType()!=null)
                {
                    String saveFile =null;
                    String contentType = request.getContentType();
                    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                    DataInputStream in = new DataInputStream(request.getInputStream());
                    int formDataLength = request.getContentLength();
                    byte dataBytes[] = new byte[formDataLength];
                    int byteRead = 0;
                    int totalBytesRead = 0;
                    while (totalBytesRead < formDataLength) {
                          byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                          totalBytesRead += byteRead;
                    }
                    String file = new String(dataBytes);
                    //out.println(file); 
                    String nm=file.substring(file.indexOf("name=\"modules\"")+15);
                    nm = nm.substring(1, nm.indexOf("-----"));
                    nm=nm.trim();
                    saveFile = file.substring(file.indexOf("filename=\"") + 10);
                    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                    int lastIndex = contentType.lastIndexOf("=");
                    String boundary = contentType.substring(lastIndex + 1, contentType.length());
                    int pos;
                    pos = file.indexOf("filename=\"");
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    int boundaryLocation = file.indexOf(boundary, pos) - 4;
                    int startPos = ((file.substring(0, pos)).getBytes()).length;
                    int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                    String appPath = request.getServletContext().getRealPath("");
                    appPath=appPath.substring(0, appPath.indexOf("\\build\\web"));
                    String path=saveFile;
                    saveFile = appPath + "\\web\\images\\modules\\" + saveFile;
                    //out.print(saveFile);
                    File ff = new File(saveFile);
                    FileOutputStream fileOut = new FileOutputStream(ff);
                    fileOut.write(dataBytes, startPos, (endPos - startPos));
                    fileOut.flush();
                    fileOut.close();
                    try {

                        String qry="INSERT INTO `moduleImage`(`modname`, `modImage`) VALUES (?,?)";
                            PreparedStatement st=con.prepareStatement(qry);
                            st.setString(1,nm);
                            st.setString(2,path);
                            int cn=st.executeUpdate();
                            //fis.close();
                            if(cn>0)
                            {
                                out.println("File Uploaded...!");
                                response.sendRedirect("addmodule.jsp");
                               
                            } else
                               out.println("Not inserted...");    
                            
                        }
                        catch(Exception e) {
                            e.printStackTrace();
                       }
                    }
                }
               
            %>
            </div>
            
            
        </div>
        <%
               
               Statement st=con.createStatement();
               String sub2=request.getParameter("submit");
            if("submit1".equals(sub2))
              {               
               String modname=request.getParameter("modname");
               int cn=st.executeUpdate("insert into moduletb(id,modulename) values(0,'"+ modname +"')");
                if(cn>0)
                    response.sendRedirect("addmodule.jsp");  
                else
                    out.println("Not inserted...");    
              }
            else if("submit2".equals(sub2))
              {
              String modname=request.getParameter("mod");
              String modlink=request.getParameter("category");
              int cn=st.executeUpdate("insert into categorytb(id,modulename,category) values(0,'"+ modname +"','"+ modlink +"')");
              if(cn>0)
                    response.sendRedirect("addmodule.jsp");  
                else
                    out.println("Not inserted...");    
              }            
            %>
    </body>
</html>
