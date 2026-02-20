// Model class: TestResult.java
package ru.prakticum.lab7.model;

import java.sql.Date;

public class TestResult {
    private int id;
    private String studentName;
    private String subject;
    private int score;
    private Date testDate;

    // Default constructor
    public TestResult() {}

    // Constructor with all fields except id
    public TestResult(String studentName, String subject, int score, Date testDate) {
        this.studentName = studentName;
        this.subject = subject;
        this.score = score;
        this.testDate = testDate;
    }

    // Full constructor
    public TestResult(int id, String studentName, String subject, int score, Date testDate) {
        this.id = id;
        this.studentName = studentName;
        this.subject = subject;
        this.score = score;
        this.testDate = testDate;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Date getTestDate() {
        return testDate;
    }

    public void setTestDate(Date testDate) {
        this.testDate = testDate;
    }

    @Override
    public String toString() {
        return "TestResult{" +
                "id=" + id +
                ", studentName='" + studentName + '\'' +
                ", subject='" + subject + '\'' +
                ", score=" + score +
                ", testDate=" + testDate +
                '}';
    }
}