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