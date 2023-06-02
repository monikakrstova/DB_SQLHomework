USE [SEDCACADEMYDB]
GO

--Declare scalar variable for storing FirstName values
--• Assign value ‘Antonio’ to the FirstName variable
--• Find all Students having FirstName same as the variable

DECLARE
@FirstName nvarchar(100);
SET @FirstName = 'Antonio';

SELECT * FROM Student s
WHERE s.FirstName = @FirstName 
GO

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--• Fill the table variable with all Female students
DECLARE @FemaleStudents TABLE(
	StudentId int NOT NULL,
	StudentName nvarchar(100) null,
	DateOfBirth date NOT NULL
	)
INSERT INTO @FemaleStudents (
	StudentId,
	StudentName,
	DateOfBirth
	)
	SELECT s.ID, s.FirstName, s.DateOfBirth
	FROM Student s
	WHERE Gender = 'F'
	
SELECT * FROM @FemaleStudents
GO

--Declare temp table that will contain LastName and EnrolledDate columns
--• Fill the temp table with all Male students having First Name starting with ‘A’
--• Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #MaleStudents
(	LastName varchar(100) null,
	EnrolledDate date NOT NULL
	);
INSERT INTO #MaleStudents (LastName, EnrolledDate)
SELECT s.LastName, s.EnrolledDate
FROM Student s
WHERE s.Gender = 'M' AND s.FirstName LIKE 'A%'

SELECT * 
FROM #MaleStudents
WHERE LEN(LastName) = 7;
GO

--Find all teachers whose FirstName length is less than 5 and
--• the first 3 characters of their FirstName and LastName are the same

SELECT *
FROM Teacher t
WHERE LEN(t.FirstName) < 5 AND LEFT(t.FirstName, 3) = LEFT(t.LastName, 3)
GO