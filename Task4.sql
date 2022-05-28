 /*
 Write a script to update the the episode name to {ORIGINAL_EPISODE_NAME}_CANCELLED for only the episodes with zero doctor appearances.
 */

USE DoctorWho
Go

UPDATE tblEpisode
SET Title = CONCAT(Title, '_CANCELLED')
WHERE DoctorId IS NULL;