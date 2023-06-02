USE [SEDCACADEMYDB]
GO

--Find all Students with FirstName = Antonio
SELECT *
FROM Student s
where s.FirstName='Antonio'
go

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM Student s
WHERE s.DateOfBirth > '1999.01.01'
GO

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM Student s
WHERE s.LastName LIKE 'J%'
AND s.EnrolledDate >= '1998.01.01' AND s.EnrolledDate < '1998.01.31'
GO

--List all Students ordered by FirstName
SELECT * 
FROM Student s
Order by s.FirstName
GO

--List all Teacher Last Names and Student Last Names in single result set.Remove duplicates
SELECT DISTINCT t.LastName as 'Teacher LastName', s.LastName as 'Student LastName'
FROM Teacher t
INNER JOIN Student s on t.ID = s.ID
GO

--Create Foreign key constraints from diagram or with script
ALTER TABLE Grade
ADD CONSTRAINT FK_STUDENT_GRADE
FOREIGN KEY (StudentID) REFERENCES [dbo].[Student]([ID]);
GO

ALTER TABLE Grade
ADD CONSTRAINT FK_TEACHER_GRADE
FOREIGN KEY (TeacherID) REFERENCES [dbo].[Teacher]([ID]);
GO
ALTER TABLE Grade
ADD CONSTRAINT FK_COURSE
FOREIGN KEY (CourseID) REFERENCES [dbo].[Course]([ID]);
GO

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade
FOREIGN KEY (GradeID) REFERENCES [dbo].[Grade]([ID]);
GO

ALTER TABLE GradeDetails
ADD CONSTRAINT FK_AchievementType_GradeDetails
FOREIGN KEY (AchievementTypeID) REFERENCES [dbo].[AchievementType]([Id]);
GO


--List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.Name AS 'Course Name', a.Name as 'AchievementType Name'
FROM Course c
CROSS JOIN AchievementType a 
GO

--List all Teachers without exam Grade
SELECT *
FROM Teacher t
LEFT JOIN Grade g ON t.ID = g.TeacherID
WHERE g.TeacherID IS NULL
GO
