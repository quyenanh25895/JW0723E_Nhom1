/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import MaHoa.MaHoa;
import static MaHoa.GiaiMa.fromSHA1;
import dao.DAO;
import entity.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/change")
public class ChangePassWord extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");

        if (a != null) {
            int id = a.getId();
            String password = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            if (!password.equals(a.getPass())) {
                request.setAttribute("error", "Mật khẩu cũ không đúng");
                request.getRequestDispatcher("ChangePassWord.jsp").forward(request, response);

            } else if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("error", "Mật khẩu không trùng khớp");
                request.getRequestDispatcher("ChangePassWord.jsp").forward(request, response);

            } else if (newPassword.equals(a.getPass())) {
                request.setAttribute("error", "Mật khẩu trùng với mật khẩu cũ");
                request.getRequestDispatcher("ChangePassWord.jsp").forward(request, response);

            } else {
                DAO dao = new DAO();
                String passwordMH = MaHoa.toSHA1(newPassword);
                dao.changePassWord(id, passwordMH);
                request.setAttribute("mess", "Cập nhật tài khoản thành công!");
                request.getRequestDispatcher("ChangePassWord.jsp").forward(request, response);
            }
        } else {
            String error = "Không tìm thấy thông tin tài khoản!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("ChangePassWord.jsp").forward(request, response);
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
