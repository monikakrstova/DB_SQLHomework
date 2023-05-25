use [master]
go

drop database if exists [SEDCACADEMYDB]
GO

create database [SEDCACADEMYDB]
GO

use [SEDCACADEMYDB]
go

drop table if exists [dbo].[Students]
drop table if exists [dbo].[Teacher]
drop table if exists [dbo].[Grade]
drop table if exists [dbo].[Course]
drop table if exists [dbo].[GradeDetails]
drop table if exists [dbo].[AchievementType]
go

create table Students (
[Id] int IDENTITY (1,1)NOT NULL,
[FirstName] nvarchar (100) NOT NULL,
[LastName] nvarchar (100) not null,
[DateOfBirth] date null,
[EnrolledDate] date null,
[Gender] nchar(1) null, 
[NationalIdNumber] nvarchar (20) null,
[StudentCardNumber] nvarchar(20) null
constraint [PK_Students] primary key (Id))

create table Teacher(
[Id] int IDENTITY (1,1)NOT NULL,
[FirstName] nvarchar (100) NOT NULL,
[LastName] nvarchar (100) not null,
[DateOfBirth] date null,
[AcademicRank] nvarchar(100)not null,
[HireDate] date null,
constraint [PK_Teacher] primary key (Id))

create table Grade(
[Id] int IDENTITY (1,1)NOT NULL,
[StudentId] int NULL,
[CourseId] int null,
[TecherId] int null,
[Grade] int null,
[Comment] nvarchar(max) null,
[CreatedDate] date null,
constraint [PK_Grade] primary key (Id))

create table Course(
[Id] int IDENTITY (1,1)NOT NULL,
[Name] nvarchar (100)not NULL,
[Credit] int null,
[AcademicYear] nvarchar(20) not null,
[Semester] nvarchar null,
constraint [PK_Course] primary key (Id))

create table GradeDetails(
[Id] int IDENTITY (1,1)NOT NULL,
[GradeId] int NULL,
[AchievementTypeId] int null,
[AchievementPoints] int null,
[AchievementMaxPoints] int null,
[AchievementDate] date null,
constraint [PK_GradeDetails] primary key (Id))

create table AchievementType(
[Id] int IDENTITY (1,1)NOT NULL,
[Name] nvarchar(20) NULL,
[Description] nvarchar(max) null,
[ParticipationRate] int null,
constraint [PK_AchievementType] primary key (Id))