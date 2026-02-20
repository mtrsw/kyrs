// Servlet for adding a result: AddResultServlet.java
package ru.prakticum.lab7.servlet;


import ru.prakticum.lab7.dao.TestResultDAO;
import ru.prakticum.lab7.model.TestResult;

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
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

/**
 * Servlet to add a new test result.
 */
@WebServlet("/add")
public class AddResultServlet extends HttpServlet {
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String studentName = req.getParameter("studentName");
            String subject = req.getParameter("subject");
            int score = Integer.parseInt(req.getParameter("score"));
            String dateStr = req.getParameter("testDate");
            LocalDate date = dateStr.isEmpty() ? LocalDate.now() : LocalDate.parse(dateStr);
            TestResult result = new TestResult(studentName, subject, score, Date.valueOf(date));
            dao.addTestResult(result);
            resp.sendRedirect("list");
        } catch (NumberFormatException | DateTimeParseException e) {
            req.setAttribute("error", "Invalid input: " + e.getMessage());
            req.getRequestDispatcher("/add.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
