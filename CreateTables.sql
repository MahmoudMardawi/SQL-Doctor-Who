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

create table tblEpisode(
EpisodeId int primary key not null,
SeriesNumber int null,
EpisodeNumber int null,
EpisodeType VARCHAR(250) NOT NULL,
Title Text NOT NULL,
EpisodeDate Date NULL DEFAULT NULL,
AuthorId INT NOT NULL REFERENCES tblAuthor (AuthorId),
DoctorId VARCHAR(250) NOT NULL REFERENCES tblDoctor (DoctorId),
Notes Text NULL DEFAULT NULL
);

create table tblEpisodeEnemy(
EpisodeEnemyId int identity primary key not null,
EpisodeId int not null references tblEpisode(EpisodeId),
EnemyId int foreign key references tblEnemy(EnemyId)
);


