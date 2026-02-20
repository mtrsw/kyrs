// Servlet for searching by student: SearchResultsServlet.java
package servlet;

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
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet to search test results by student name.
 */
@WebServlet("/search")
public class SearchResultsServlet extends HttpServlet {
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
        req.getRequestDispatcher("/search.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String namePart = req.getParameter("namePart");
        try {
            List<TestResult> results = dao.getTestResultsByStudent(namePart);
            req.setAttribute("results", results);
            req.getRequestDispatcher("/list.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
