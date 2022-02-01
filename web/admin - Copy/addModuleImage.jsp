<%-- 
    Document   : addModuleImage
    Created on : Jul 22, 2015, 11:07:16 AM
    Author     : Ajay
--%>

<%@page import="java.sql.*"%>
<%@page import="database.MSConnection"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="modulenames">
            
            
        </div>
        <div id="moduleimages">
            <form action="#" method="post" enctype="multipart/form-data">
            Select Module : <select name="modules">
                <option value="Module1">Module1</option>
                <option value="Module2">Module2</option>
            </select>
            <input type="file" name="image" />
            <input type="submit" name="isubmit" value="Submit Image" />
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

                        MSConnection mscon=new MSConnection();
                        Connection con=mscon.Connection();
                        String qry="INSERT INTO `moduleImage`(`modname`, `modImage`) VALUES (?,?)";
                            PreparedStatement st=con.prepareStatement(qry);
                            st.setString(1,nm);
                            st.setString(2,path);
                            int cn=st.executeUpdate();
                            //fis.close();
                            if(cn>0)
                            {
                                out.println("File Uploaded...!");
                                //response.sendRedirect("admin/addInventory.jsp");
                               
                            } else
                               out.println("Not inserted...");    
                            con.close();
                        }
                        catch(Exception e) {
                            e.printStackTrace();
                       }
                    }
                }
            %>
        </div>
    </body>
</html>
