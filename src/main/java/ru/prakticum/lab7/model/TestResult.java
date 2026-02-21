package ru.praktikum.lab7.model;

import java.sql.Timestamp;

public class TestResult {
    private int id;
    private String studentName;
    private String testName;
    private int score;
    private Timestamp createdAt;

    public TestResult() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getTestName() { return testName; }
    public void setTestName(String testName) { this.testName = testName; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}