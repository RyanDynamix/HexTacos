package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.DBContext;
import Model.User;
import jakarta.servlet.http.HttpSession;

public class Loger extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action.toLowerCase()) {
            case "login":
                userLogin(request,response);
                break;
        }
    }
    
    private void userLogin(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = new DBContext().validateUser(email, password);
        if (user != null) {
            if (user.getRoleID() == 1) {
                HttpSession session = request.getSession();
                session.setAttribute("email",user.getEmail());
                session.setAttribute("password",user.getPassword());        
                response.sendRedirect(request.getContextPath() + "/Admin/index.jsp");
            }
            else {
                response.sendRedirect(request.getContextPath() + "/userHome.jsp");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Login servlet for user authentication";
    }
}
