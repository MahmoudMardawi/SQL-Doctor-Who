DROP DATABASE IF EXISTS DoctorWho;
GO

CREATE DATABASE DoctorWho;
GO

USE DoctorWho;
GO

drop table if exists tblEnemy;
drop table if exists tblAuthor;
drop table if exists tblDoctor;
drop table if exists tblCompanion;
drop table if exists tblEpisode;
drop table if exists tblEpisodeCompanion;
drop table if exists tblEpisodeEnemy;

create table tblEnemy(
EnemyId int identity primary key not null,
EnemyName nvarchar(50) not null,
Description text null
);

create table tblAuthor(
AuthorId int identity primary key not null,
AuthorName nvarchar(50) not null,
);

Create table tblCompanion(
CompanionId int identity primary key not null,
CompanionName nvarchar(50) not null,
WhoPlayed nvarchar(50) not null
);

create table tblDoctor(
DoctorId int identity primary key not null,
DoctorNumber int not null,
DoctorName nvarchar(50) not null,
BirthDate date null default null,
FirstEpisodeDate date null default null,
LastEpisodeDate date null default null
);

create table tblEpisode(
EpisodeId int identity primary key not null,
SeriesNumber int null,
EpisodeNumber int null,
EpisodeType VARCHAR(250) NOT NULL,
Title Text NOT NULL,
EpisodeDate Date NULL DEFAULT NULL,
AuthorId INT  REFERENCES tblAuthor (AuthorId),
DoctorId int  references tblDoctor (DoctorId),
Notes Text NULL DEFAULT NULL
);

create table tblEpisodeEnemy(
EpisodeEnemyId int identity primary key not null,
EpisodeId int not null references tblEpisode(EpisodeId),
EnemyId int not null references tblEnemy(EnemyId)
);

create table tblEpisodeCompanion(
EpisodeCompanionId int identity primary key not null,
EpisodeId int not null references tblEpisode(EpisodeId),
CompanionId int not null references tblCompanion(CompanionId)
);

/*
Insert records in Enemy Table
*/

insert tblEnemy(EnemyName) values (N'Allen')
insert tblEnemy(EnemyName) values ( N'Robert')
insert tblEnemy(EnemyName) values ( N'Diego')
insert tblEnemy(EnemyName) values ( N'Sergio')
insert tblEnemy(EnemyName) values ( N'Raul')
GO

/*
Insert records in Author Table
*/

insert tblAuthor(AuthorName) values (N'Alex')
insert tblAuthor(AuthorName) values ( N'Chris')
insert tblAuthor(AuthorName) values ( N'Dave')
insert tblAuthor(AuthorName) values ( N'Pen')
insert tblAuthor(AuthorName) values ( N'Newman')
GO

/*
Insert records in Doctor Table
*/


insert tblDoctor(DoctorNumber, DoctorName, BirthDate, FirstEpisodeDate,LastEpisodeDate) 
values (1234, N'Alex','1965-12-21','2005-10-17', '2005-12-17');

insert tblDoctor(DoctorNumber, DoctorName, BirthDate)
values (2345, N'Folk','1977-9-24');

insert tblDoctor(DoctorNumber, DoctorName, BirthDate)
values (3456, N'Daniel','1955-7-13');

insert tblDoctor(DoctorNumber, DoctorName, BirthDate) 
values (4567, N'Martin','1968-6-21');

insert tblDoctor(DoctorNumber, DoctorName, BirthDate)
values (5678, N'Michael','1971-8-6');
GO

/*
Insert records in Companion Table
*/

insert tblCompanion(CompanionName, WhoPlayed) values (N'Sandro', 'Foster')
insert tblCompanion(CompanionName, WhoPlayed) values ( N'Christain','Jack')
insert tblCompanion(CompanionName, WhoPlayed) values ( N'Nickolas','Karim')
insert tblCompanion(CompanionName, WhoPlayed) values ( N'Fred','Skirtel')
insert tblCompanion(CompanionName, WhoPlayed) values ( N'Leon','Johnny')
GO

/*
Insert records in Episode Table
*/


insert tblEpisode(EpisodeId, SeriesNumber, EpisodeNumber, EpisodeType, Title, EpisodeDate, AuthorId, DoctorId, Notes)
values (1, 1, 1, N'Normal episode', N'Rose', CAST(0x7E2B0B00 AS Date), 9, 16, NULL)

insert tblEpisode(EpisodeId, SeriesNumber, EpisodeNumber, EpisodeType, Title, EpisodeDate, AuthorId, DoctorId, Notes) 
VALUES (2, 1, 2, N'Normal episode', N'The End of the World', CAST(0x852B0B00 AS Date), 4, 15, NULL)

insert tblEpisode(EpisodeId, SeriesNumber, EpisodeNumber, EpisodeType, Title, EpisodeDate, AuthorId, DoctorId, Notes)
VALUES (3, 1, 3, N'Normal episode', N'The Unquiet Dead', CAST(0x8C2B0B00 AS Date), 2, 17, NULL)

insert tblEpisode(EpisodeId, SeriesNumber, EpisodeNumber, EpisodeType, Title, EpisodeDate, AuthorId, DoctorId, Notes)
VALUES (4, 1, 4, N'Normal episode', N'Aliens of London (Part 1)', CAST(0x932B0B00 AS Date), 3, 16, NULL)

insert tblEpisode(EpisodeId, SeriesNumber, EpisodeNumber, EpisodeType, Title, EpisodeDate, AuthorId, DoctorId, Notes)
VALUES (5, 1, 5, N'Normal episode', N'World War Three (Part 2)', CAST(0x9A2B0B00 AS Date), 2, 15, NULL)

ALTER TABLE tblEpisode ALTER COLUMN DoctorId int NULL;
insert tblEpisode(EpisodeId, SeriesNumber, EpisodeNumber, EpisodeType, Title, EpisodeDate, AuthorId, DoctorId, Notes)
VALUES (6, 1, 5, N'Normal episode', N'World War Three (Part 2)', CAST(0x9A2B0B00 AS Date), 2, NULL, NULL)

GO

/*
Insert records to EpisodeCompanion Table
*/


insert tblEpisodeCompanion(EpisodeId, CompanionId) values (1, 6)

insert tblEpisodeCompanion(EpisodeId, CompanionId) values (2, 7)

insert tblEpisodeCompanion(EpisodeId, CompanionId) values (3, 7)

insert tblEpisodeCompanion(EpisodeId, CompanionId) values (4, 9)

insert tblEpisodeCompanion(EpisodeId, CompanionId) values(5, 6)

GO

/*
Insert records into EpisodeEnemy table
*/

INSERT tblEpisodeEnemy(EpisodeId, EnemyId) values (1, 2)

INSERT tblEpisodeEnemy(EpisodeId, EnemyId) values (5, 5)

INSERT tblEpisodeEnemy(EpisodeId, EnemyId) values (3, 2)

INSERT tblEpisodeEnemy(EpisodeId, EnemyId) values (1, 1)

INSERT tblEpisodeEnemy(EpisodeId, EnemyId) values (1, 2)

GO
 
