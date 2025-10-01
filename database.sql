-- Create Student Table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL
);

-- Create Marks Table
CREATE TABLE Marks (
    marks_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50) NOT NULL,
    marks INT CHECK (marks >= 0 AND marks <= 100),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

-- Insert Students
INSERT INTO Student (student_id, name, department) VALUES
(1, 'Dev', 'Computer Science'),
(2, 'Sahil', 'Electronics'),
(3, 'Nikhil', 'Computer Science'),
(4, 'Arnav', 'Mechanical'),
(5, 'Anuj', 'Electronics');

-- Insert Marks
INSERT INTO Marks (marks_id, student_id, subject, marks) VALUES
(101, 1, 'Maths', 85),
(102, 1, 'Physics', 72),
(103, 2, 'Circuits', 90),
(104, 2, 'Signals', 65),
(105, 3, 'Maths', 95),
(106, 4, 'Thermo', 55),
(107, 5, 'Circuits', 82),
(108, 5, 'Signals', 88);

-- Create View for Scores > 80
CREATE VIEW Score AS
SELECT s.student_id, s.name, s.department, m.subject, m.marks
FROM Student s
JOIN Marks m ON s.student_id = m.student_id
WHERE m.marks > 80;

-- Display Records from View
SELECT * FROM Score;

-- Department-wise Average of High Scores
SELECT department, AVG(marks) AS avg_high_marks
FROM Score
GROUP BY department
HAVING department IN ('Computer Science', 'Electronics');
