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