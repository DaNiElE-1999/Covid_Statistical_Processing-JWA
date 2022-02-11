/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package redirects;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import static_classes.database;


/**
 *
 * @author user
 */
@WebServlet(name = "covid_data", urlPatterns = {"/covid_data"})
public class records extends HttpServlet {

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
        try {

            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect("./#login");
            } else if (session.getAttribute("currentUser") == null) {
                response.sendRedirect("./#login");
            } else {

                Connection c = database.getConnection();
                Statement stmt = c.createStatement();
                String SQL = "select distinct location, iso_code from data";
                System.out.println(SQL);
                ResultSet rs = stmt.executeQuery(SQL);
                ArrayList<String[]> d = new ArrayList<String[]>();
                ArrayList<String[]> d1 = new ArrayList<String[]>();
                while (rs.next()) {
                    String[] data = new String[2];
                    data[0] = rs.getString(2);
                    data[1] = rs.getString(1);
                    d.add(data);

                }
                String SQL1 = "select iso_code,date,location,new_cases,new_deaths from data";
                rs = stmt.executeQuery(SQL1);
                while (rs.next()) {
                    String[] data = new String[5];
                    data[0] = rs.getString(1);
                    data[1] = rs.getString(2);
                    data[2] = rs.getString(3);
                    data[3] = rs.getString(4);
                    data[4] = rs.getString(5);
                    d1.add(data);

                }
                c.close();
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("Covid_Data.jsp");
                request.setAttribute("countries", d);
                request.setAttribute("covid_data", d1);
                requestDispatcher.forward(request, response);
            }
        } catch (Exception e) {
            database.ERROR = e.getLocalizedMessage();
            response.sendRedirect("./err");
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
