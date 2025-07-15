package controller;

import dal.FeedbackDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.Feedbacks;

@WebServlet("/feedback")
public class FeedbackController extends HttpServlet {

    FeedbackDAO dao = new FeedbackDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Feedbacks fb = dao.getFeedbackById(id);
                request.setAttribute("feedback", fb);
                request.getRequestDispatcher("feedback_form.jsp").forward(request, response);
                break;
            case "delete":
                dao.deleteFeedback(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("feedback");
                break;
            default:
                List<Feedbacks> list = dao.getAllFeedbacks();
                request.setAttribute("list", list);
                request.getRequestDispatcher("feedback_list.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = request.getParameter("id") == null || request.getParameter("id").isEmpty()
                 ? 0 : Integer.parseInt(request.getParameter("id"));

        int productID = Integer.parseInt(request.getParameter("productID"));
        int userID = Integer.parseInt(request.getParameter("userID"));
        String note = request.getParameter("note");
        int rating = Integer.parseInt(request.getParameter("rating"));

        Feedbacks f = new Feedbacks(id, productID, userID, note, rating);

        if (id == 0) {
            dao.insertFeedback(f);
        } else {
            dao.updateFeedback(f);
        }
         response.sendRedirect("productDetail?productID=" + productID);
    }
}