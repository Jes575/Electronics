/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package image;

import database.MSConnection;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ajay
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class Insert extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
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
        String mod=file.substring(file.indexOf("name=\"module\"")+14);
        mod = mod.substring(1, mod.indexOf("-----"));
        mod=mod.trim();
        //out.print("<br />"+mod);
        String cato=file.substring(file.indexOf("name=\"type\"")+12);
        cato = cato.substring(1, cato.indexOf("-----"));
        cato=cato.trim();
        //out.print("<br />"+cato);
        String cod=file.substring(file.indexOf("name=\"code\"")+12);
        cod = cod.substring(1, cod.indexOf("-----"));
        cod=cod.trim();
        String nm=file.substring(file.indexOf("name=\"pname\"")+13);
        nm = nm.substring(1, nm.indexOf("-----"));
        nm=nm.trim();
        String dte=file.substring(file.indexOf("name=\"date\"")+12);
        dte = dte.substring(1, dte.indexOf("-----"));
        dte=dte.trim();
        String qty=file.substring(file.indexOf("name=\"pqty\"")+12);
        qty = qty.substring(1, qty.indexOf("-----"));
        qty=qty.trim();
        int qt=Integer.parseInt(qty);
        String desc=file.substring(file.indexOf("name=\"pdesc\"")+13);
        desc = desc.substring(1, desc.indexOf("-----"));
        desc=desc.trim();
        String prc=file.substring(file.indexOf("name=\"price\"")+13);
        prc = prc.substring(1, prc.indexOf("-----"));
        prc=prc.trim();
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
        saveFile=saveFile.substring(saveFile.indexOf("."));
        saveFile=cod+nm+saveFile;
        String path=saveFile;
        saveFile = appPath + "\\web\\images\\" + saveFile;
        File ff = new File(saveFile);
        FileOutputStream fileOut = new FileOutputStream(ff);
        fileOut.write(dataBytes, startPos, (endPos - startPos));
        fileOut.flush();
        fileOut.close();
        try {

            MSConnection mscon=new MSConnection();
            Connection con=mscon.Connection();
            
            /*DateFormat formt=new SimpleDateFormat("yyyy-mm-dd");
            out.print(dte);
            java.util.Date dt=formt.parse(dte);*/
            String qry="INSERT INTO products(module,category,`code`,pname,pdate,quantity,description,pimage,price) VALUES (?,?,?,?,?,?,?,?,?)";
                PreparedStatement st=con.prepareStatement(qry);
                st.setString(1, mod);
                st.setString(2, cato);
                st.setString(3,cod);
                st.setString(4,nm);
                st.setString(5, dte);
                st.setInt(6,qt);
                st.setString(7,desc);
                st.setString(8, path);
                st.setDouble(9, Double.parseDouble(prc));
                int cn=st.executeUpdate();
                //fis.close();
                con.close();
                if(cn>0)
                {
                    //response.sendRedirect("admin/addInventory.jsp?insert=1");
                    out.println("File Uploaded...!");
                    /*RequestDispatcher rs = request.getRequestDispatcher("admin/addInventory.jsp");
                    rs.forward(request, response);*/
                } else
                   out.println("Not inserted...");
            }
            catch(Exception e) {
                e.printStackTrace();
           }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
 
}
