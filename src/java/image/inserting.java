/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package image;

import java.io.DataInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.MSConnection;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Ajay
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class inserting {   
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out=response.getWriter();
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
        String nm=file.substring(file.indexOf("name=\"name\"")+12);
        nm = nm.substring(1, nm.indexOf("-----"));
        String type=file.substring(file.indexOf("name=\"type\"")+11);
        type = type.substring(1, type.indexOf("-----"));
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
        saveFile = "c:/users" + saveFile;
        File ff = new File(saveFile);
        FileOutputStream fileOut = new FileOutputStream(ff);
        fileOut.write(dataBytes, startPos, (endPos - startPos));
        fileOut.flush();
        fileOut.close();
        try {
                MSConnection mscon=new MSConnection();
                Connection con = mscon.Connection();
                PreparedStatement st=null;
                String qry="insert into imgtb values(?,?)";
                st=con.prepareStatement(qry);
                st.setString(1,nm);
                File fnm=new File(saveFile);
                out.println(fnm);   
                FileInputStream fis=new FileInputStream(fnm);
                st.setBinaryStream(2, fis);
                int cn=st.executeUpdate();
                if(cn>0)
                    out.println("Successfull...");
                else
                   out.println("Not inserted...");
            }
            catch(Exception e) {
                e.printStackTrace();
           }
        }

    }
}
