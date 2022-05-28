 /*
6. Create a function called **`fnCompanions`** to printout the companions names for a given episode
    - **Input:** `EpisodeId`
    - **Output**: Companion 1 Name, Companion 2 Name, Companion 3 Name, etc.
*/

USE DoctorWho
Go

DROP FUNCTION IF EXISTS fnCompanions;
GO

CREATE FUNCTION fnCompanions(
	@EpisodeId int
)
RETURNS varchar(100)
AS
begin
	declare @c varchar(100) = ''

	SELECT
		@c = @c + 
			case when len(@c) > 0 THEN ', ' ELSE '' END + 
			c.CompanionName
			
	FROM
		tblEpisodeCompanion as ec
		INNER JOIN tblCompanion as c on ec.CompanionId = c.CompanionId
	WHERE
		ec.EpisodeId = @EpisodeId

	return @c
end
GO


/*
7. Create a function called **`fnEnemies`** to printout the enemies names for a given episode
    - **Input**: `EpisodeId`
    - **Output**: Enemy 1 Name, Enemy 2 Name, Enemy 3 Name, etc.

*/

DROP FUNCTION IF EXISTS fnEnemies;
GO

CREATE FUNCTION fnEnemies(
	@EpisodeId int
)
RETURNS varchar(100)
AS
begin
	declare @c varchar(100) = ''

	SELECT
		@c = @c + 
			CASE WHEN len(@c) > 0 THEN ', ' ELSE '' END + 
			c.EnemyName
			
	FROM
		tblEpisodeEnemy AS ec
		INNER JOIN tblEnemy AS c ON ec.EnemyId = c.EnemyId
	WHERE
		ec.EpisodeId = @EpisodeId

	return @c
end
GO

/*
8. Create a SQL view called **`viewEpisodes`** to list out all episodes, include:
    - Author Name
    - Doctor Name
    - Companions
    - Enemies
        
        **P.S.** Make use of the previous created functions
*/

USE DoctorWho;
GO

DROP VIEW IF EXISTS viewEpisodes;
GO

CREATE VIEW viewEpisodes AS
SELECT E.SeriesNumber AS [Series Number], 
	   E.EpisodeNumber AS [Episode Number], 
	   E.Title AS Title, 
	   A.AuthorName AS [Author Name], 
	   D.DoctorName AS [Doctor Name],
	   dbo.[fnCompanions](E.EpisodeId) AS Companions,
	   dbo.[fnEnemies](E.EpisodeId) AS Enemies

FROM tblEpisode E
	 left join tblAuthor A ON E.AuthorId = A.AuthorId
	 left join tblDoctor D ON E.DoctorId = D.DoctorId 
GO

/*
9. Create a stored procedure called **`spSummariseEpisodes`** to show:
    - The 3 most frequently-appearing companions; then separately
    - The 3 most frequently-appearing enemies.
*/

USE DoctorWho;
GO

DROP PROCEDURE IF EXISTS spSummariseEpisodes;
GO

CREATE PROCEDURE spSummariseEpisodes AS
BEGIN
	SELECT C.CompanionName AS [Three Most Frequently-Appearing Companions]
	FROM tblEpisodeCompanion EC
		 JOIN tblCompanion C ON EC.CompanionId = C.CompanionId
	GROUP BY EC.CompanionId, C.CompanionName
	ORDER BY COUNT(EC.CompanionId) DESC
	OFFSET 0 ROWS
	FETCH NEXT 3 ROWS ONLY;

	SELECT E.EnemyName AS [Three Most Frequently-Appearing Enemies]
	FROM tblEpisodeEnemy EE
		 JOIN tblEnemy E ON EE.EnemyId = E.EnemyId
	GROUP BY EE.EnemyId, E.EnemyName
	ORDER BY COUNT(EE.EnemyId) DESC
	OFFSET 0 ROWS
	FETCH NEXT 3 ROWS ONLY;
END;

EXEC spSummariseEpisodes;