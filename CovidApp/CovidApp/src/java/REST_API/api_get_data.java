/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package REST_API;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import static_classes.database;


/**
 *
 * @author user
 */
@WebServlet(name = "getData", urlPatterns = {"/getData"})
public class api_get_data extends HttpServlet {

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
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            String email = request.getHeader("email");
            String password = request.getHeader("password");
            if (!email.isBlank() && !email.isEmpty()) {
                if (!password.isBlank() && !password.isEmpty()) {
                    boolean flag = isAuthenticated(email, password);
                    if (flag) {
                        JSONObject jo = new JSONObject();
                        if (request.getParameterMap().containsKey("continent")) {
                            String cont = request.getParameter("continent");
                            JSONArray a1 = getContinent(cont);
                            out.print(a1.toJSONString());
                        } else if (request.getParameterMap().containsKey("list")) {
                            String list = request.getParameter("list");
                            JSONArray a1 = getList(list);
                            out.print(a1.toJSONString());
                        } else {
                            JSONArray a = getAllCommunlative();
                            out.print(a.toJSONString());

                        }


                        //   out.print(jo.toJSONString());
                    } else {
                        out.print(
                                "unauthorized  :" + flag);
                    }
                    
                } else {

                    out.print("Password Is Not Provided");
                }
            } else {

                out.print("Email Is Not Provided");
            }
            
            
        } catch (Exception e) {
            response.getWriter().write(e.getMessage());
        }
    }
    private JSONArray getList(String list) {
        try {
            JSONArray res = new JSONArray();
            String[] l = list.split(",");
            Set<String> s = new HashSet<>();
            for (String g : l) {
                s.add(g);
            }
            for (String g : s) {
                JSONObject o = (JSONObject) getContinent(g).get(0);
                System.out.println(o.toJSONString());
                res.add(o);
            }

            return res;
        } catch (Exception e) {
            return null;
        }
    }
    private JSONArray getContinent(String cont) {
        try {
            JSONArray res = new JSONArray();
            String SQL = "select * from (select iso_code,location, sum(new_cases) as cases,sum(new_deaths) as deaths, sum(fully_vaccinated) as vaccinated from data group by iso_code,location ) as A where A.iso_code LIKE '%" + cont + "%' or A.location LIKE '%" + cont + "%'";
            System.out.println(SQL);
            Connection c = database.getConnection();
            ResultSet rs = c.createStatement().executeQuery(SQL);
            while (rs.next()) {
                JSONObject o = new JSONObject();
                o.put("iso", rs.getString(1));
                o.put("location", rs.getString(2));
                o.put("cases", rs.getString(3));
                o.put("deaths", rs.getString(4));
                o.put("vaccinated", rs.getString(5));
                res.add(o);
            }
            c.close();
            return res;
        } catch (Exception e) {
            return null;
        }
    }
    private JSONArray getAllCommunlative() {
        try {
            JSONArray res = new JSONArray();
            String SQL = "select iso_code,location, sum(new_cases) as cases,sum(new_deaths) as deaths, sum(fully_vaccinated) as vaccinated from data group by iso_code,location";
            Connection c = database.getConnection();
            ResultSet rs = c.createStatement().executeQuery(SQL);
            while (rs.next()) {
                JSONObject o = new JSONObject();
                o.put("iso", rs.getString(1));
                o.put("location", rs.getString(2));
                o.put("cases", rs.getString(3));
                o.put("deaths", rs.getString(4));
                o.put("vaccinated", rs.getString(5));
                res.add(o);
            }
            c.close();
            return res;
        } catch (Exception e) {
            return null;
        }
        }
    private boolean isAuthenticated(String email, String password) {
        try {


                    Connection c = database.getConnection();
                    Statement stmt = c.createStatement();
                    String SQL = "SELECT * FROM users where email = '%s' and password = '%s'".formatted(email, password);

            ResultSet rs = stmt.executeQuery(SQL);

            boolean valid = false;
                    if (rs.next()) {
                        valid = true;
                    }
            c.close();
                    return valid;


        } catch (Exception e) {
            return false;
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
