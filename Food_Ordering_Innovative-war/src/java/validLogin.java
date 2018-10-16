/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class validLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Connection conn;
    Statement st;
    
    public void connect(){
      try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jtdatab","root","");
            st = conn.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(validLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(validLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(validLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(validLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void init(){
        connect();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String usename = request.getParameter("usern");
        String passwordn = request.getParameter("passt");
        String usert = request.getParameter("usetype"); 
        
        
        if(request!=null && request.getParameter("rus")!=null && request.getParameter("rus").equals("on")){
            Cookie co = new Cookie("userid",usename);
            response.addCookie(co);
        }
        
        String selq  ="Select * from servuser where username='" + usename + "' and password='" + passwordn + "' and usertype='" + usert + "';";
        try {
            
            ResultSet rs = st.executeQuery(selq);
            
            if(rs.next()){
                request.getSession().setAttribute("usernam", usename);
                 request.getSession().setAttribute("name",rs.getString(3));
                 request.getSession().setAttribute("type",usert);
                 
                 if(usert.equals("c")){
                        response.sendRedirect("dashbpage.jsp");
                 }
                 else if(usert.equals("s")){
                        response.sendRedirect("restdashpage.jsp");
                 }
                 
            }
            else{
                //response.sendRedirect("loginprom.html");
                out.println("<script>");
                out.println("window.alert(\"Authentication Failed\");");
                out.println("window.location.href='loginp.jsp';");
                out.println("</script>");
               
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(validLogin.class.getName()).log(Level.SEVERE, null, ex);
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
