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

@WebServlet(name = "analysis", urlPatterns = {"/analysis"})
public class analyser extends HttpServlet {

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
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("analysis_tables.jsp");
            HttpSession session = request.getSession(false);
            String SQL = "";
            Connection c = database.getConnection();
            Statement stmt = c.createStatement();
            ArrayList<String[]> data = new ArrayList<>();
            if (session == null) {
                SQL = "select DISTINCT iso_code,location,total_Cases,new_Cases,total_deaths,new_deaths from data where date="
                        + "'" + database.getDate() + "'";

                ResultSet rs = stmt.executeQuery(SQL);

                while (rs.next()) {
                    String[] r = new String[6];
                    r[0] = rs.getString(1);
                    r[1] = rs.getString(2);
                    r[2] = rs.getString(3);
                    r[3] = rs.getString(4);
                    r[4] = rs.getString(5);
                    r[5] = rs.getString(6);
                    data.add(r);
                }
                request.setAttribute("email", "0");
                request.setAttribute("password", "0");
            } else if (session.getAttribute("currentUser") == null) {
                SQL = "select DISTINCT iso_code,location,total_Cases,new_Cases,total_deaths,new_deaths from data where date="
                        + "'" + database.getDate() + "'";

                ResultSet rs = stmt.executeQuery(SQL);

                while (rs.next()) {
                    String[] r = new String[6];
                    r[0] = rs.getString(1);
                    r[1] = rs.getString(2);
                    r[2] = rs.getString(3);
                    r[3] = rs.getString(4);
                    r[4] = rs.getString(5);
                    r[5] = rs.getString(6);
                    data.add(r);
                }
                request.setAttribute("email", "0");
                request.setAttribute("password", "0");
            } else {
                SQL = "select DISTINCT iso_code,location,total_Cases,new_Cases,total_deaths,new_deaths from data";
                ResultSet rs = stmt.executeQuery(SQL);
                while (rs.next()) {
                    String[] r = new String[6];
                    r[0] = rs.getString(1);
                    r[1] = rs.getString(2);
                    r[2] = rs.getString(3);
                    r[3] = rs.getString(4);
                    r[4] = rs.getString(5);
                    r[5] = rs.getString(6);
                    data.add(r);
                }
                request.setAttribute("email", session.getAttribute("currentUser"));
                request.setAttribute("password", session.getAttribute("password"));
            }

            request.setAttribute("d", data);
            c.close();
            requestDispatcher.forward(request, response);
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
