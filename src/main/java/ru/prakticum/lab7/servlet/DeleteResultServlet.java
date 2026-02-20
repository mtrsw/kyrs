// Servlet for deleting a result: DeleteResultServlet.java
package ru.prakticum.lab7.servlet;

import ru.prakticum.lab7.dao.TestResultDAO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet to delete a test result by id.
 */
@WebServlet("/delete")
public class DeleteResultServlet extends HttpServlet {
    private TestResultDAO dao;

    @Override
    public void init() throws ServletException {
        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
            dao = new TestResultDAO(ds);
        } catch (NamingException e) {
            throw new ServletException("Cannot lookup DataSource", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean deleted = dao.deleteTestResult(id);
            if (deleted) {
                resp.sendRedirect("list");
            } else {
                req.setAttribute("error", "Record not found");
                req.getRequestDispatcher("/list.jsp").forward(req, resp);
            }
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid id");
            req.getRequestDispatcher("/list.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
