--Calculate the count of all grades per Teacher in the system
SELECT t.FirstName, t.LastName, COUNT(g.Grade) AS GRADE 
FROM Teacher t
LEFT JOIN Grade g ON t.ID = g.TeacherID
GROUP BY t.ID, t.FirstName, t.LastName
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT s.FirstName, s.LastName, COUNT(g.Grade) AS GRADE 
FROM Teacher t
LEFT JOIN Grade g ON t.ID = g.TeacherID
JOIN Student s ON g.StudentID = s.ID
WHERE s.ID <100
GROUP BY s.ID, s.FirstName, s.LastName
GO

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT StudentID, MAX(Grade) AS MaxGrade, AVG(Grade) AS AvgGrade
FROM Grade 
GROUP BY StudentID
GO

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName AS Teacher, COUNT(*) AS GradeCount
FROM Grade g
JOIN Teacher t ON t.ID = g.TeacherID
GROUP BY t.FirstName
HAVING COUNT(*) > 200;

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the
--system. Filter only records where Maximal Grade is equal to Average Grade
SELECT s.FirstName, COUNT(g.Grade) As GradeCount, MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade
FROM Grade g
JOIN Student s ON s.Id = g.StudentID
GROUP BY s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

--List Student First Name and Last Name next to the other details from previous query
SELECT s.FirstName + ' ' + s.LastName as StudentFullName, COUNT(g.Grade) As GradeCount, MAX(g.Grade) AS MaximalGrade, AVG(g.Grade) AS AverageGrade
FROM Grade g
JOIN Student s ON s.Id = g.StudentID
GROUP BY s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT StudentID, COUNT(*) AS GradeCount
FROM Grade
GROUP BY StudentID
GO

SELECT * FROM vv_StudentGrades
GO

--Change the view to show Student First and Last Names instead of StudentID
CREATE VIEW vv_StudentGrades1
AS
SELECT s.FirstName, s.LastName, COUNT(*) AS GradeCount
FROM Grade g
JOIN Student s ON s.ID = g.StudentID
GROUP BY s.ID, s.FirstName, s.LastName
GO

SELECT * FROM vv_StudentGrades1
GO

--List all rows from view ordered by biggest Grade Count
SELECT *
FROM vv_StudentGrades1
ORDER BY GradeCount DESC
GO