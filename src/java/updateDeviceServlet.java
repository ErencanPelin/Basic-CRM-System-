/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/updateDevice"})
public class updateDeviceServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
              
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        //Get parameters from register JSP page
       // create request object to redirect to Welcome page
        RequestDispatcher req = request.getRequestDispatcher("viewDeviceCatalogue.jsp");
         //send request with parameters to the next page Welcome to JSP
        req.forward(request, response);
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
            throws ServletException, IOException 
    {
      //  processRequest(request, response);
        
        try
        {
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Product;create=true");  
            
            String id = request.getParameter("prodID");
            String Remove = "DELETE FROM Product WHERE prodID = '"+id+"'";
            
            PreparedStatement prep = con.prepareStatement(Remove);

            prep.executeUpdate();
            prep.close();
                    
            String sql = "INSERT INTO Product (prodID, prodName, prodDesc, prodCost, prodStock)values (?,?,?,?,?)";
            prep = con.prepareStatement(sql);

            String prodID = request.getParameter("prodID");
            String prodName = request.getParameter("prodName");
            String prodDesc = request.getParameter("prodDesc");
            String prodCost = request.getParameter("prodCost");
            String prodStock = request.getParameter("prodStock");

            prep.setString(1, prodID);
            prep.setString(2,prodName);
            prep.setString(3, prodDesc);
            prep.setDouble(4, Double.parseDouble(prodCost));
            prep.setInt(5, Integer.parseInt(prodStock));

            prep.executeUpdate();
            prep.close();
            RequestDispatcher req = request.getRequestDispatcher("viewDeviceCatalogue.jsp");
            req.forward(request, response);
        }
        catch (SQLException e)
        {
            System.out.println(e);
        }
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
