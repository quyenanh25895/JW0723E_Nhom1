package control;

import MaHoa.MaHoa;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

import entity.Account;
import entity.Email;
import entity.EmailUtils;

/**
 * Servlet implementation class ForgotPasswordControl
 */
@WebServlet("/forgotPassword")
//@WebServlet(name = "ForgotPasswordControl", urlPatterns = {"/forgotPassword"})
public class ForgotPasswordControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html;charset=UTF-8");

        try {
            String emailAddress = request.getParameter("email");
            String username = request.getParameter("username");

            DAO dao = new DAO();
            Account account = dao.checkAccountExistByUsernameAndEmail(username, emailAddress);
            if (account == null) {
                request.setAttribute("error", "Email hoac username sai!");
            }
            if (account != null) {
                Email email = new Email();
                email.setFrom("buisyduc2710@gmail.com");
                email.setFromPassword("demdblquwwtzlfsh");
                email.setTo(emailAddress);
                email.setSubject("Forgot Password Function");
                StringBuilder sb = new StringBuilder();
                sb.append("Dear ").append(username).append("<br>");
                sb.append("You are used the forgot password. <br> ");
                sb.append("Your password is <b>").append(account.getUser()).append("@123").append(" </b> <br>");
                sb.append("Regards<br>");
                sb.append("Administrator");
                
                String newPasswrord = account.getUser() + "@123";
                String passwordMH = MaHoa.toSHA1(newPasswrord);
                dao.changePassWord(account.getId(), passwordMH);
                email.setContent(sb.toString());
                EmailUtils.send(email);

                request.setAttribute("mess", "Mật khẩu đã được gửi đến Email của bạn!");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }

}
