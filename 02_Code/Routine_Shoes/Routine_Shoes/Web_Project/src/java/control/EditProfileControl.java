/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import MaHoa.MaHoa;
import dao.DAO;
import entity.Account;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/editProfile")
//@WebServlet(name = "EditProfileControl", urlPatterns = {"/editProfile"})
public class EditProfileControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        int id = a.getId();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
<<<<<<< HEAD
        String passwordMH = MaHoa.toSHA1(password);
        DAO dao = new DAO();

        dao.editProfile(username, passwordMH, email, id);

        request.setAttribute("mess", "Cập nhật tài khoản thành công! Vui lòng đăng nhập lại");

        request.getRequestDispatcher("logout").forward(request, response);
=======
        DAO dao = new DAO();

        dao.editProfile(username, password, email, id);
        
        request.setAttribute("mess", "Cap nhat tai khoan thanh cong! Hay dang nhap bang tai khoan moi!");

        request.getRequestDispatcher("Login.jsp").forward(request, response);
>>>>>>> 88201320392470e9f17c3cda012fc18851b80297
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
