 /*
Write a query to delete all companions who didn't appear on an episode.
*/

USE DoctorWho
Go


delete from tblCompanion
WHERE CompanionId IN (
						SELECT CompanionId
						FROM tblCompanion
						EXCEPT
						SELECT CompanionId
						FROM tblEpisodeCompanion
						GROUP BY CompanionId
					 );