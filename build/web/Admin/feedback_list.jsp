<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Feedback Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: #f8f9fa;
                color: #333;
                margin: 0;
            }

            .navbar {
                background-color: #00bfa6;
                padding: 16px 30px;
                box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            }

            .navbar h2 {
                margin: 0;
                font-size: 22px;
                color: white;
            }

            .container {
                width: 95%;
                max-width: 1200px;
                margin: 40px auto;
                background: #ffffff;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 6px 16px rgba(0,0,0,0.08);
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 14px 12px;
                text-align: center;
            }

            th {
                background-color: #e0f7f4;
                color: #00bfa6;
                text-transform: uppercase;
                font-size: 13px;
                letter-spacing: 1px;
            }

            td {
                border-bottom: 1px solid #eee;
                font-size: 14px;
                color: #444;
            }

            tr:nth-child(even) {
                background-color: #f5fdfc;
            }

            .button {
                padding: 6px 12px;
                font-size: 12px;
                border-radius: 6px;
                text-decoration: none;
                margin: 2px;
                font-weight: 500;
                display: inline-block;
                transition: 0.2s ease;
            }

            .edit-btn {
                background-color: #00bfa6;
                color: white;
            }

            .edit-btn:hover {
                background-color: #009e8c;
            }

            .delete-btn {
                background-color: #f44336;
                color: white;
            }

            .delete-btn:hover {
                background-color: #d32f2f;
            }

            .star {
                color: #ffb300;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <!-- Navbar -->
        <div class="navbar">
            <h2>Feedback Dashboard</h2>
        </div>

        <!-- Table Container -->
        <div class="container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Product ID</th>
                        <th>User ID</th>
                        <th>Note</th>
                        <th>Rating</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="fb" items="${list}">
                    <tr>
                        <td>${fb.id}</td>
                        <td>${fb.productID}</td>
                        <td>${fb.userID}</td>
                        <td>${fb.note}</td>
                        <td><span class="star">${fb.rating} ★</span></td>
                        <td>
                            <a class="button edit-btn" href="feedback?action=edit&id=${fb.id}">Edit</a>
                            <a class="button delete-btn" href="feedback?action=delete&id=${fb.id}" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>