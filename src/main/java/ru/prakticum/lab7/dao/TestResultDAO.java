// DAO class: TestResultDAO.java
// Uses JDBC with connection pool (assuming configured DataSource)
package ru.prakticum.lab7.dao;


import ru.prakticum.lab7.model.TestResult;


import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TestResultDAO {
    private DataSource dataSource;

    // Constructor injecting DataSource
    public TestResultDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // SQL queries (same as in lab 5)
    private static final String SQL_INSERT = """
            INSERT INTO test_results (student_name, subject, score, test_date)
            VALUES (?, ?, ?, ?)
            """;

    private static final String SQL_SELECT_ALL = """
            SELECT id, student_name, subject, score, test_date
            FROM test_results
            ORDER BY test_date DESC, student_name
            """;

    private static final String SQL_SELECT_BY_STUDENT = """
            SELECT id, student_name, subject, score, test_date
            FROM test_results
            WHERE student_name LIKE ?
            ORDER BY test_date DESC
            """;

    private static final String SQL_DELETE_BY_ID = """
            DELETE FROM test_results WHERE id = ?
            """;

    // Add a new test result
    public void addTestResult(TestResult result) throws SQLException {
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(SQL_INSERT)) {
            ps.setString(1, result.getStudentName());
            ps.setString(2, result.getSubject());
            ps.setInt(3, result.getScore());
            ps.setDate(4, result.getTestDate());
            ps.executeUpdate();
        }
    }

    // Get all test results
    public List<TestResult> getAllTestResults() throws SQLException {
        List<TestResult> results = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(SQL_SELECT_ALL);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                results.add(extractTestResult(rs));
            }
        }
        return results;
    }

    // Get test results by student name (partial match)
    public List<TestResult> getTestResultsByStudent(String namePart) throws SQLException {
        List<TestResult> results = new ArrayList<>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(SQL_SELECT_BY_STUDENT)) {
            ps.setString(1, "%" + namePart + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    results.add(extractTestResult(rs));
                }
            }
        }
        return results;
    }

    // Delete test result by id
    public boolean deleteTestResult(int id) throws SQLException {
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(SQL_DELETE_BY_ID)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    // Helper to extract TestResult from ResultSet
    private TestResult extractTestResult(ResultSet rs) throws SQLException {
        return new TestResult(
                rs.getInt("id"),
                rs.getString("student_name"),
                rs.getString("subject"),
                rs.getInt("score"),
                rs.getDate("test_date")
        );
    }
}