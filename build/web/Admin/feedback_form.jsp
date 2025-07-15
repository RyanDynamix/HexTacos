<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Feedbacks" %>
<%
    Feedbacks f = (Feedbacks) request.getAttribute("feedback");
    if (f == null) f = new Feedbacks();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Feedback Form</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f8f9fa;
                color: #333;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .form-container {
                background-color: #ffffff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 6px 20px rgba(0,0,0,0.15);
                width: 420px;
            }

            h2 {
                text-align: center;
                margin-bottom: 25px;
                font-size: 22px;
                color: #00bfa6;
            }

            label {
                display: block;
                margin-top: 16px;
                margin-bottom: 6px;
                font-weight: 600;
                color: #444;
            }

            input[type="number"],
            textarea,
            select {
                width: 100%;
                padding: 10px 12px;
                background-color: #f2f2f2;
                color: #333;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 15px;
                box-sizing: border-box;
            }

            textarea {
                resize: vertical;
                min-height: 90px;
            }

            button {
                margin-top: 24px;
                width: 100%;
                padding: 12px;
                background-color: #00bfa6;
                color: #ffffff;
                border: none;
                border-radius: 6px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: 0.3s ease;
            }

            button:hover {
                background-color: #009e8c;
            }

        </style>
    </head>
    <body>

        <div class="form-container">
            <form method="post" action="feedback">
                <h2><%= (f.getId() == 0 ? "Add Feedback" : "Edit Feedback") %></h2>

                <input type="hidden" name="id" value="<%= f.getId() %>"/>

                <label for="productID">Product ID</label>
                <input type="number" id="productID" name="productID" value="<%= f.getProductID() %>" required>

                <label for="userID">User ID</label>
                <input type="number" id="userID" name="userID" value="<%= f.getUserID() %>" required>

                <label for="note">Note</label>
                <textarea id="note" name="note"><%= f.getNote() != null ? f.getNote() : "" %></textarea>

                <label for="rating">Rating</label>
                <select id="rating" name="rating">
                    <%
                        for (int i = 5; i >= 1; i--) {
                            String selected = (f.getRating() == i) ? "selected" : "";
                    %>
                    <option value="<%= i %>" <%= selected %>><%= i %></option>
                    <%
                        }
                    %>
                </select>

                <button type="submit">Save Feedback</button>
            </form>
        </div>

    </body>
</html>