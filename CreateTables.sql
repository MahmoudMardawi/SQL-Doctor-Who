DROP DATABASE IF EXISTS DoctorWho;
GO

CREATE DATABASE DoctorWhoCore;
GO

USE DoctorWhoCore;
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
DoctorName nvarchar(50) not null,
BirthDate date null default null,
FirstEpisodeDate date null default null,
LastEpisodeDate date null default null
);

create table tblEpisode(
EpisodeId int primary key not null,
SeriesNumber int null,
EpisodeNumber int null,
EpisodeType VARCHAR(250) NOT NULL,
Title Text NOT NULL,
EpisodeDate Date NULL DEFAULT NULL,
AuthorId INT NOT NULL REFERENCES tblAuthor (AuthorId),
DoctorId int not null references tblDoctor (DoctorId),
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

