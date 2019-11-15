package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        Cookie loginCookie = new Cookie("user_login", "");
        loginCookie.setMaxAge(0);
        HttpSession session = request.getSession();
        session.removeAttribute("currentUser");
        session.removeAttribute("basket");
        try {
            response.sendRedirect("/login");
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
